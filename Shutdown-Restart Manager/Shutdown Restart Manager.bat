@echo off
setlocal enabledelayedexpansion

:: Set color scheme
color 0A
cls

:welcome
echo =================================================================
echo                     Welcome to Anthony's 
echo          Restart/Shutdown Assistant - Version 1.2
echo =================================================================
echo.
set /p "name=Enter your name: "

if /I "%name%"=="" (
    goto :menu
) else if /I "%name%"=="actuallyAnthony" (
    goto :admin_menu
) else (
    echo.
    echo Welcome, %name%! Proceeding to the menu...
    pause
    goto :menu
)

:menu
cls
echo ======================================================
echo              Anthony's Restart/Shutdown Assistant
echo ======================================================
echo                           Version 1.2
echo.
echo          Type 'Anthony is my god' for a special message.
echo.
echo   [1] Shutdown
echo   [2] Restart
echo   [3] Exit
echo.

set /p choice="Enter your choice: "

if "%choice%"=="1" goto :shutdown
if "%choice%"=="2" goto :restart
if "%choice%"=="3" goto :exit
if "%choice%"=="help" echo Yikes idiot, search "list"?
if "%choice%"=="list" echo It's the main menu idiot.
if /I "%choice%"=="Anthony is my god" goto :love_message
if /I "%choice%"=="Anthony is not my god" goto :fake_warning

echo Invalid choice, please select again.
pause
goto :menu

:fake_warning
cls
echo =================================================================
echo                          WARNING: SYSTEM MESSAGE
echo        Windows is busy deleting critical system files...
echo            Please wait while we complete this operation.
echo =================================================================
timeout /t 2 >nul

echo Deleting files...
for /l %%i in (1,1,100) do (
    set /a "progress=%%i"
    set "bar=["
    for /l %%j in (1,1,%%i/2) do set "bar=!bar!#"
    for /l %%j in (%%i/2,1,50) do set "bar=!bar! "
    set "bar=!bar!] %%i%%"
    cls
    echo =================================================================
    echo Windows is busy deleting critical system files...
    timeout /t 0.1 >nul
)

echo.
echo Deletion complete. Please restart your system.
timeout /t 2 >nul
goto :exit

:shutdown
cls
echo *** Shutdown Options ~Anthony ***
echo.
echo   [1] Seconds
echo   [2] Minutes
echo   [3] Hours
echo   [4] Back to menu
echo.

set /p "time_choice=Choose the time unit (1-4): "

if "%time_choice%"=="1" goto :shutdown_seconds
if "%time_choice%"=="2" goto :shutdown_minutes
if "%time_choice%"=="3" goto :shutdown_hours
if "%time_choice%"=="4" goto :menu

echo Invalid choice, please select again.
pause
goto :shutdown

:shutdown_seconds
cls
set /p "seconds=Enter delay in seconds before shutdown: "
if "%seconds%"=="" set "seconds=0"
echo.
echo Shutdown scheduled in %seconds% seconds.
timeout /t %seconds% /nobreak
shutdown /s /t 0
goto :menu

:shutdown_minutes
cls
set /p "minutes=Enter delay in minutes before shutdown: "
if "%minutes%"=="" set "minutes=0"
set /a "seconds=%minutes% * 60"
echo.
echo Shutdown scheduled in %minutes% minutes.
timeout /t %seconds% /nobreak
shutdown /s /t 0
goto :menu

:shutdown_hours
cls
set /p "hours=Enter delay in hours before shutdown: "
if "%hours%"=="" set "hours=0"
set /a "seconds=%hours% * 3600"
echo.
echo Shutdown scheduled in %hours% hours.
timeout /t %seconds% /nobreak
shutdown /s /t 0
goto :menu

:restart
cls
echo *** Restart Options ~Anthony ***
echo.
echo   [1] Seconds
echo   [2] Minutes
echo   [3] Hours
echo   [4] Back to menu
echo.

set /p "time_choice=Choose the time unit (1-4): "

if "%time_choice%"=="1" goto :restart_seconds
if "%time_choice%"=="2" goto :restart_minutes
if "%time_choice%"=="3" goto :restart_hours
if "%time_choice%"=="4" goto :menu

echo Invalid choice, please select again.
pause
goto :restart

:restart_seconds
cls
set /p "seconds=Enter delay in seconds before restart: "
if "%seconds%"=="" set "seconds=0"
echo.
echo Restart scheduled in %seconds% seconds.
timeout /t %seconds% /nobreak
shutdown /r /t 0
goto :menu

:restart_minutes
cls
set /p "minutes=Enter delay in minutes before restart: "
if "%minutes%"=="" set "minutes=0"
set /a "seconds=%minutes% * 60"
echo.
echo Restart scheduled in %minutes% minutes.
timeout /t %seconds% /nobreak
shutdown /r /t 0
goto :menu

:restart_hours
cls
set /p "hours=Enter delay in hours before restart: "
if "%hours%"=="" set "hours=0"
set /a "seconds=%hours% * 3600"
echo.
echo Restart scheduled in %hours% hours.
timeout /t %seconds% /nobreak
shutdown /r /t 0
goto :menu

:admin_menu
cls
echo *** Admin Menu ~Anthony ***
echo.
echo   [1] View System Information
echo   [2] Exit Admin Mode
echo   [3] Back to main menu
echo.

set /p admin_choice="Enter your choice (1-3): "

if "%admin_choice%"=="1" goto :view_system_info
if "%admin_choice%"=="2" goto :exit_admin_mode
if "%admin_choice%"=="3" goto :menu

echo Invalid choice, please select again.
pause
goto :admin_menu

:view_system_info
cls
echo *** System Information ~Anthony ***
echo.
systeminfo
pause
goto :admin_menu

:exit_admin_mode
cls
echo Exiting admin mode.
pause
goto :menu

:love_message
cls
echo *** Special Message ~Anthony ***
echo.
echo I am the one and only god,
echo The deity who shall save you from harm,
echo And bring prosperity to your life.
echo.
echo Embrace my guidance and you shall find peace.
pause
goto :menu

:exit
cls
echo Thank you for using my software! Redirecting you to the support page...
timeout /t 2 /nobreak
start "" "https://github.com/AnthonyLikesCode/TheAnthonyWorld"
exit /b
