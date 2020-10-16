@echo off
::Fun fact, the following code was rewritten 54 times, and took 5 hours. (It also used to be around 1000 lines)
mode con: cols=130 lines=3
if not exist ConnectKey.dll goto ManualLogin
echo Would you like to AUTO-CONNECT to the server you were last in or connect manually?
echo.
echo 1. Auto Login
echo 2. Manual Login
set /p menuchoice=
if %menuchoice% == 1 goto AutoLogin
:ManualLogin
echo Please enter the Hostname of the FTP server:
set /p HostName=
echo.
echo Please enter the Username for the FTP server:
set /p Username=
echo.
echo Please enter the Password for the FTP server:
set /p Password=
echo.

:SaveLogin
del "ConnectKey.dll" /s /f /q
echo Saving....
echo ftps://%Username%:%Password%@%HostName%> ConnectKey.dll
echo Saved!
goto ManualStart

:AutoLogin
cls 
echo Auto login file detected!
echo Attempting to contact FTP server!
set /p Autologin=<ConnectKey.dll
start %~dp0\BatchCord.bat
goto AutoRefresh

:ManualStart
start %~dp0\BatchCord.bat
set /p Autologin=<ConnectKey.dll
goto ManualRefresh

:AutoRefresh
timeout 5 > NUL
cd Servers
set /p Server=<CurrentServer.dll
set /p ServerFTP=<%Server%.dll
cd %~dp0
del "ConnectKey.dll" /s /f /q
echo %ServerFTP%> ConnectKey.dll
set /p Autologin=<ConnectKey.dll
:PostWait
del "%~dp0\chat.txt"
"%~dp0\WinSCP.com" ^
  /command ^
    "open %AutoLogin% -certificate=""52:5c:94:aa:01:8a:a3:8c:77:76:3e:3d:fb:0b:18:90:e9:63:94:9d""" ^
    "get /chat.txt %~dp0\" ^
    "exit"

del "%~dp0\DisplayChat.txt" /s /f /q
type Message.txt>>Chat.txt
del "%~dp0\Message.txt" /s /f /q
type %~dp0\Chat.txt>%~dp0\DisplayChat.txt


"%~dp0\WinSCP.com" ^
  /command ^
    "open %AutoLogin% -certificate=""52:5c:94:aa:01:8a:a3:8c:77:76:3e:3d:fb:0b:18:90:e9:63:94:9d""" ^
    "rm /chat.txt" ^
    "put %~dp0\chat.txt /" ^
    "exit"
goto AutoRefresh


set WINSCP_RESULT=%ERRORLEVEL%
if %WINSCP_RESULT% equ 0 (
  echo Success
) else (
  echo Error
)

exit /b %WINSCP_RESULT%

:ManualRefresh
timeout 5 > NUL
:PostWait
del "%~dp0\chat.txt"
"%~dp0\WinSCP.com" ^
  /command ^
    "open %AutoLogin% -certificate=""52:5c:94:aa:01:8a:a3:8c:77:76:3e:3d:fb:0b:18:90:e9:63:94:9d""" ^
    "get /chat.txt %~dp0\" ^
    "exit"

del "%~dp0\DisplayChat.txt" /s /f /q
type Message.txt>>Chat.txt
del "%~dp0\Message.txt" /s /f /q
type %~dp0\Chat.txt>%~dp0\DisplayChat.txt


"%~dp0\WinSCP.com" ^
  /command ^
    "open %AutoLogin% -certificate=""52:5c:94:aa:01:8a:a3:8c:77:76:3e:3d:fb:0b:18:90:e9:63:94:9d""" ^
    "rm /chat.txt" ^
    "put %~dp0\chat.txt /" ^
    "exit"
goto ManualRefresh


::But how did you manage to finish the script?
::D E T E R M I N A T I O N