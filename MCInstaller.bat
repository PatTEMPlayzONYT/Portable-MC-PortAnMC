@echo off
echo Warning: Make sure this file is placed in your USB drive.
echo.
set /p confirm=Type 'yes' to install Minecraft: 

if /I "%confirm%"=="yes" (
    echo.
    echo Downloading Minecraft...
    mkdir "PortAnMC"
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://launcher.mojang.com/download/Minecraft.exe', 'PortAnMC\Minecraft.exe')"
    
    echo.
    echo Minecraft downloaded successfully!

    echo.
    echo Launching Minecraft...
    start "" "PortAnMC\Minecraft.exe"
    echo.
) else (
    echo.
    echo Installation cancelled.
    echo.
    timeout 3 >nul
    exit /b
)

echo.
echo Press any key to exit.
pause >nul

echo Creating shortcut...
echo Set oWS = WScript.CreateObject("WScript.Shell") > "create-shortcut.vbs"
echo sLinkFile = "%~dp0\Minecraft Launcher.lnk" >> "create-shortcut.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "create-shortcut.vbs"
echo oLink.TargetPath = "%~dp0\PortAnMC\Minecraft.exe" >> "create-shortcut.vbs"
echo oLink.Save >> "create-shortcut.vbs"
cscript "create-shortcut.vbs" //nologo
del "create-shortcut.vbs"

echo Shortcut created successfully.

echo Deleting 'PortAnMC' folder...
rmdir /s /q "PortAnMC"
