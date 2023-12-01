@echo off
echo Warning: Make sure this file is placed in your USB drive.
echo.
set /p confirm=Type 'yes' to install Minecraft using SKLauncher: 

if /I "%confirm%"=="yes" (
    echo.
    echo Downloading SKLauncher...
    mkdir "PortAnMC"
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://skmedix.pl/binaries/_/SKlauncher-3.2.1.jar', 'PortAnMC\SKLauncher.jar')"
    
    echo.
    echo SKLauncher downloaded successfully!

    echo.
    echo Launching SKLauncher...
    start "" "%~dp0\PortAnMC\SKLauncher.jar"
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
echo sLinkFile = "%~dp0\SKLauncher.lnk" >> "create-shortcut.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "create-shortcut.vbs"
echo oLink.TargetPath = "%~dp0\PortAnMC\SKLauncher.jar" >> "create-shortcut.vbs"
echo oLink.Save >> "create-shortcut.vbs"
cscript "create-shortcut.vbs" //nologo
del "create-shortcut.vbs"

echo Shortcut created successfully.

echo Deleting 'PortAnMC' folder...
rmdir /s /q "PortAnMC"
