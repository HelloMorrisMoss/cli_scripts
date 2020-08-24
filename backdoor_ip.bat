@echo off
netsh wlan connect "NA-LW Guest" interface="Back Door"
if errorlevel 1 echo "Could not connect Back Door to Guest network" &
for /f "tokens=3 delims=: " %%I in ('netsh interface IPv4 show addresses "Back Door" ^| findstr /C:"IP Address"') do set bd_ip=%%I &
echo %1 &
"C:\Program Files (x86)\ForceBindIP\ForceBindIP64.exe" %bd_ip% %1