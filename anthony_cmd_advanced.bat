@echo off
title Anthony's CMD Advanced

:main
cls
echo ==================================================
echo          Welcome to Anthony's CMD Advanced
echo ==================================================
echo.
echo Type a command or ask Anthony to adjust settings:
echo (e.g., "Display Settings," "Wi-Fi Settings," "Privacy Settings")
echo.
echo Type Exit to exit
echo.
set /p userInput="> "

:: Normalize input to lowercase
setlocal enabledelayedexpansion
set "userInput=!userInput!"
for %%A in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    set "userInput=!userInput:%%A=%%A!"
)

:: Check for "Exit" command
if /I "!userInput!"=="exit" goto :exit

:: Check for "Anthony is my god" command
if /I "!userInput!"=="anthony is my god" (
    color 4F
    echo.
    echo Anthony loves all, but all needs love be.
    echo.
    pause >nul
    goto :main
)

:: Match specific "Settings" keywords in user input
if /I "!userInput!"=="display settings" goto :openDisplaySettings
if /I "!userInput!"=="wifi settings" goto :openWiFiSettings
if /I "!userInput!"=="bluetooth settings" goto :openBluetoothSettings
if /I "!userInput!"=="network settings" goto :openNetworkSettings
if /I "!userInput!"=="ip settings" goto :openIPSettings
if /I "!userInput!"=="privacy settings" goto :openPrivacySettings
if /I "!userInput!"=="sound settings" goto :openSoundSettings
if /I "!userInput!"=="battery settings" goto :openBatterySettings
if /I "!userInput!"=="storage settings" goto :openStorageSettings
if /I "!userInput!"=="region settings" goto :openRegionSettings
if /I "!userInput!"=="update settings" goto :openUpdateSettings
if /I "!userInput!"=="apps settings" goto :openAppsSettings
if /I "!userInput!"=="list" goto :showList

:: If no match is found
echo.
echo Anthony didn't understand your command. Please try again.
echo.
pause >nul
goto :main

:: Define actions for each setting
:openDisplaySettings
echo.
echo Opening Display Settings...
start ms-settings:display
goto :main

:openWiFiSettings
echo.
echo Opening Wi-Fi Settings...
start ms-settings:network-wifi
goto :main

:openBluetoothSettings
echo.
echo Opening Bluetooth & Devices Settings...
start ms-settings:bluetooth
goto :main

:openNetworkSettings
echo.
echo Opening Network & Internet Settings...
start ms-settings:network
goto :main

:openIPSettings
echo.
echo Opening IP Settings...
start ms-settings:network-status
goto :main

:openPrivacySettings
echo.
echo Opening Privacy Settings...
start ms-settings:privacy
goto :main

:openSoundSettings
echo.
echo Opening Sound Settings...
start ms-settings:sound
goto :main

:openBatterySettings
echo.
echo Opening Battery & Power Settings...
start ms-settings:batterysaver
goto :main

:openStorageSettings
echo.
echo Opening Storage Settings...
start ms-settings:storagesense
goto :main

:openRegionSettings
echo.
echo Opening Region & Language Settings...
start ms-settings:regionformatting
goto :main

:openUpdateSettings
echo.
echo Opening Windows Update Settings...
start ms-settings:windowsupdate
goto :main

:openAppsSettings
echo.
echo Opening Apps & Features Settings...
start ms-settings:appsfeatures
goto :main

:showList
cls
echo ==================================================
echo                  Available Commands                
echo ==================================================
echo 1. Display Settings
echo 2. Wi-Fi Settings
echo 3. Bluetooth Settings
echo 4. Network Settings
echo 5. IP Settings (opens network status page)
echo 6. Privacy Settings
echo 7. Sound Settings
echo 8. Battery Settings
echo 9. Storage Settings
echo 10. Region Settings
echo 11. Windows Update Settings
echo 12. Apps Settings
echo 13. List (show this list)
echo ==================================================
echo.
echo Press any key to return to the main menu...
pause >nul
goto :main

:exit
cls
echo ===========================================================
echo          Goodbye and thank you for visiting! ~Anthony
echo ===========================================================
ping 127.0.0.1 -n 6 >nul
exit
