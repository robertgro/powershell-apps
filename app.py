import os, sys
import tkinter as tk
from tkinter import StringVar, ttk
from tkinter import messagebox
from subprocess import Popen

root = tk.Tk()
root.geometry("320x195")
root.title("PS script wrapper")

content = ttk.Frame(root, padding="5")
content.grid(column=0, row=0)

frame = ttk.Frame(content, borderwidth=5, relief=tk.GROOVE, padding="5")
frame.grid(column=0, row=0, sticky=(tk.N, tk.W, tk.E, tk.S))

label_variable = StringVar(value="Select a script")
label = ttk.Label(frame, textvariable=label_variable)
label.grid(column=1, row=0, sticky=(tk.N, tk.W), padx=10)

script_files = []
choice_variable = StringVar()

for file in os.listdir("."):
    if os.path.isfile(os.path.join(".", file)) and file.endswith(".ps1"):
        script_files.append(file)

if len(script_files) > 0:
    choice_variable.set(script_files)
else:
    messagebox.showwarning("ERROR", "No .ps1 files found in current dir. Stopping execution.")
    sys.exit()

#https://stackoverflow.com/questions/52395321/python-how-to-remove-border-around-selected-listbox-item
list_box = tk.Listbox(frame, listvariable=choice_variable, selectmode=tk.SINGLE, activestyle=tk.NONE, width=23)
list_box.bind("<<ListboxSelect>>", lambda e: label_variable.set(list_box.get(list_box.curselection()[0])))
list_box.grid(column=0, row=0, sticky=(tk.N, tk.W), rowspan=4)

args_label = ttk.Label(frame, text="Args", padding="0 10 0 0")
args_label.grid(column=1, row=1, sticky=(tk.N, tk.W), padx=10)

args_variable = StringVar()
args_entry = ttk.Entry(frame, textvariable=args_variable, width=20)
args_entry.grid(column=1, row=2, sticky=(tk.N, tk.W), padx=10, pady="0 30")

def executePS():
    ps_str = "powershell -NoLogo -NoExit -ExecutionPolicy Unrestricted -File "
    exec_str = ps_str + label_variable.get() + " " + args_variable.get()
    Popen(exec_str)

execute_button = ttk.Button(frame, text="Execute", command=executePS)
execute_button.grid(column=1, row=3, sticky=(tk.N, tk.W), padx=10)

root.mainloop()