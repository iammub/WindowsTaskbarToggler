# Toggle Taskbar Auto-Hide: flips StuckRects3\Settings[8] between 3 (hide) and 2 (show)
# Works for current user on Windows 10/11. No admin needed.

$regPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3'
$regName = 'Settings'

# Ensure key/value exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}
$settings = (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName
if (-not $settings) {
    # Initialize a blob and default to "show always" so first run hides
    $settings = New-Object byte[] 64
    $settings[8] = 2
    New-ItemProperty -Path $regPath -Name $regName -PropertyType Binary -Value $settings -Force | Out-Null
}

# Read current and decide next (normalize unexpected values to 2)
$current = [int]$settings[8]
if ($current -ne 2 -and $current -ne 3) { $current = 2 }
$next = if ($current -eq 3) { 2 } else { 3 }
$settings[8] = [byte]$next

# Persist
Set-ItemProperty -Path $regPath -Name $regName -Value $settings

# Feedback on console ps 
Write-Host ("Taskbar auto-hide -> " + ($(if ($next -eq 3) { "ON (3)" } else { "OFF (2)" })))

# Apply immediately actually force closing explorer 
Get-Process explorer -ErrorAction SilentlyContinue | Stop-Process -Force
#Start-Sleep -Milliseconds 250
while (Get-Process explorer -ErrorAction SilentlyContinue) { Start-Sleep -Milliseconds 50 }
# Start Explorer only if not auto started by win11 after force close above
if (-not (Get-Process explorer -ErrorAction SilentlyContinue)) {
    Start-Process explorer.exe "/N, /E, /select, ""C:\Windows""" -WindowStyle Hidden
}

