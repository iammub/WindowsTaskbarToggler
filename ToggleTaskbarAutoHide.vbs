Set objShell = CreateObject("WScript.Shell")

' Just the filename, no path needed as its in same folder named as below
strPS = "ToggleTaskbarAutoHide.ps1"

' Run PowerShell hidden
objShell.Run "powershell.exe -NoProfile -ExecutionPolicy Bypass -File """ & strPS & """", 0, False
