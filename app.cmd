@echo off
:: pyw without console window
start /min pythonw app.py
:: py with console window
::python app.py
call scp-remote.cmd