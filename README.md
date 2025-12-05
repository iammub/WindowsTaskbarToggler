# WindowsTaskbarToggler
nonsense script running under the hood to replace going to annoying taskbar settings 

Taskbar Auto-Hide Toggle (Windows 10/11)
===============================================

Files:
- ToggleTaskbarAutoHide.ps1 : PowerShell toggle script
- ToggleTaskbarAutoHide.bat : Double-click launcher
- ToggleTaskbarAutoHide.vbs : Double-click launcher to hide cmd flawlessly (recommended)
- toggle.ico                : Simple icon you can assign to the shortcut

How to use:
1) Copy the entire folder anywhere under your user profile, e.g. C:\Users\<you>\Scripts\TaskbarToggle\
2) Double-click ToggleTaskbarAutoHide.bat to toggle: first run hides, next run unhides.
3) To pin to taskbar: Right-click the .bat or .vbs -> Create shortcut -> Right-click shortcut -> Properties -> Run: Minimized.
   Click Change Icon... and choose toggle.ico. Then Pin to Start and from Start, Pin to taskbar or simply let the icon be on desktop

Troubleshooting:
- If unhide doesn't work, ensure Taskbar > Taskbar behaviors > "Optimize taskbar for touch interactions" is OFF.
- On managed devices, a policy may lock taskbar settings. Check with your IT admin.
