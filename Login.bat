@echo off
mode con: cols=43 lines=23
cd users
if not exist *.dll goto nousers
:Login
cls
echo  _________________________________________
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|               BatchCord                 ^|
echo ^|                (Login)                  ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|       Username:                         ^|
set /p Username=
cls
echo  _________________________________________
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|               BatchCord                 ^|
echo ^|                (Login)                  ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|       Username:                         ^|
echo ^|     ________________________________    ^|
echo ^|    ^| %Username%		      ^|   ^|
echo ^|    ^|________________________________^|   ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|       Password:                         ^|
set /p Password=
cls
echo  _________________________________________
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|               BatchCord                 ^|
echo ^|                (Login)                  ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|       Username:                         ^|
echo ^|     ________________________________    ^|
echo ^|    ^| %Username%		      ^|   ^|
echo ^|    ^|________________________________^|   ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|       Password:                         ^|
echo ^|     ________________________________    ^|
echo ^|    ^| %Password%		      ^|   ^|
echo ^|    ^|________________________________^|   ^|
echo ^|                                         ^|
echo ^|_________________________________________^|
echo Are these details correct? (Y/N)
choice /c YN /n
if %errorlevel%==2 goto Login
echo Finding users...
cls
goto TryDetails

:nousers
echo No users have been created yet, would you like to create one? (Y/N)
choice /c YN /n
if %errorlevel%==2 goto Hello
goto CreateUser

:CreateUser 
cls
echo  _________________________________________
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|               BatchCord                 ^|
echo ^|            (Create account)             ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|       Username:                         ^|
set /p NewUsername=
cls
echo  _________________________________________
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|               BatchCord                 ^|
echo ^|            (Create account)             ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|       Username:                         ^|
echo ^|     ________________________________    ^|
echo ^|    ^| %NewUsername%		      ^|   ^|
echo ^|    ^|________________________________^|   ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|       Password:                         ^|
set /p NewPassword=
cls
echo  _________________________________________
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|               BatchCord                 ^|
echo ^|            (Create account)             ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|       Username:                         ^|
echo ^|     ________________________________    ^|
echo ^|    ^| %NewUsername%		      ^|   ^|
echo ^|    ^|________________________________^|   ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|                                         ^|
echo ^|       Password:                         ^|
echo ^|     ________________________________    ^|
echo ^|    ^| %NewPassword%		      ^|   ^|
echo ^|    ^|________________________________^|   ^|
echo ^|                                         ^|
echo ^|_________________________________________^|
echo Are you happy with these details? (Y/N)
choice /c YN /n
if %errorlevel%==2 goto CreateUser
echo Creating account...
echo %NewPassword%> %NewUsername%.dll
echo Account created!
pause
goto Login

:TryDetails
echo Attempting login...
if not exist %Username%.dll goto NoUser
echo Checking password...
set /p RealPass=<%Username%.dll
if %RealPass% == %Password% goto CorrectLogin
echo Incorrect Password!
pause
goto Login

:NoUser
echo No user with the name '%Username%' found.
echo Create a user? (Y/N)
choice /c YN /n
if %errorlevel%==1 goto CreateUser
goto Login

pause
goto Login

:CorrectLogin
echo Successfully logged in!
cd %~dp0
start FTPLOADER.bat
title Logged in as %username%
:Starting
if not exist chat.txt goto Starting
echo. >>.\Message.txt
if not exist chat.txt goto Starting
echo %username% has joined the room >>Message.txt
if not exist chat.txt goto Starting
echo. >>.\Message.txt


:read_messages
cls
mode con: cols=40 lines=6
set /p "input=Message:"
pause
::if input is nothing, go back
if "%input%"=="" goto read_messages
pause
::If input is exit, exit the program.
if "%input%" == "[Mic]" goto Mic
pause
if "%input%" == "[Stream]" goto Stream
pause
if "%input%" == "[Gift Nitro]" goto NitroGift
pause
if "%input%" == "[Settings]" goto Settings
pause
if "%input%" == "[Server]" goto ServerChange
pause
if "%input%" == "[Nyan.exe]" goto Nyan
pause
goto Write

:Mic
echo Mic On/Off?
set /p menuchoice=
if %menuchoice% == on goto MicOn
if %menuchoice% == On goto MicOn
if %menuchoice% == off goto MicOff
if %menuchoice% == Off goto MicOff
echo Invalid Command
pause 
goto MainScreen

:MicOn
echo.
echo Mic Unmuted!
pause
goto MainScreen

:MicOff
echo.
echo Mic Muted!
pause
goto MainScreen

:Stream
echo.
echo What resolution?
echo.
echo 1. 720p 60fps
echo 2. 720p 30fps
echo 3. 480p 60fps
echo 4. 480p 30fps
set /p menuchoice=
if %menuchoice% == 1 goto Stream72060
if %menuchoice% == 2 goto Stream72030
if %menuchoice% == 3 goto Stream48060
if %menuchoice% == 4 goto Stream48030

:Stream72060
echo.
echo Now streaming at 720p 60fps
echo Stream join code: 65m7-3c4v-a56s-9o20
pause
goto MainScreen

:Stream72030
echo.
echo Now streaming at 720p 30fps
echo Stream join code: 65m7-3c4v-a56s-9o20
pause
goto MainScreen

:Stream48060
echo.
echo Now streaming at 480p 60fps
echo Stream join code: 65m7-3c4v-a56s-9o20
pause
goto MainScreen

:Stream48030
echo.
echo Now streaming at 480p 30fps
echo Stream join code: 65m7-3c4v-a56s-9o20
pause
goto MainScreen

:NitroGift
echo Send someone a year of Nitro for AUD$30!
echo Would you like to continue?
echo Yes/No?
set /p menuchoice=
if %menuchoice% == no goto Cancel
if %menuchoice% == No goto Cancel
if %menuchoice% == Yes goto GiftNitroYes
if %menuchoice% == yes goto GiftNitroYes

:GiftNitroYes
echo Please enter your email for paypal:
set /p PayPalEmail=
echo Please enter your password for paypal:
set /p PayPalPass=
echo Purchasing...
timeout 1 > NUL
timeout 1 > NUL
timeout 1 > NUL
echo Successfully purchased!
timeout 1 > NUL
echo Shareable Nitro Code: 55d4-3n7k-6b6s-90wm
echo Thanks for purchasing!
pause
goto MainScreen

:Cancel
goto MainScreen

:Settings
cls
echo Welcome to the settings menu!
echo.
echo 1. Change Theme
echo 2. Change Username
echo 3. Change Password
echo 4. Exit
set /p menuchoice=
if %menuchoice% == 4 goto Cancel
if %menuchoice% == 3 goto ChangePass
if %menuchoice% == 2 goto ChangeUsr
if %menuchoice% == 1 goto ChangeTheme

:ChangePass
echo What would you like to change your PASSWORD to?
set /p NewPass=
echo Changed PASSWORD to: %NewPass%
echo Email Confirmation has also been sent, please check that to activate the new password!
pause
goto MainScreen

:ChangeUsr
echo What would you like to change your USERNAME to?
set /p NewUser=
echo Changed USERNAME to: %NewUser%
pause
goto MainScreen

:ChangeTheme
cls
echo What theme would you like?
echo.
echo 1. Green and black
echo 2. Blue and black
echo 3. White and black
echo 4. Cancel
set /p menuchoice=
if %menuchoice% == 4 goto Cancel
if %menuchoice% == 3 goto WhiteBlack
if %menuchoice% == 2 goto BlueBlack
if %menuchoice% == 1 goto GreenBlack

:WhiteBlack
cls
echo 0f> Theme.txt
color 0f
echo Changed successfully!
pause
goto MainScreen

:BlueBlack
cls
echo 09> Theme.txt
color 09
echo Changed successfully!
pause
goto MainScreen

:GreenBlack
cls
echo 0a> Theme.txt
color 0a
echo Changed successfully!
pause
goto MainScreen


:Write
if not exist ConnectKey.dll goto ErrorFTP
set /p Autologin=<ConnectKey.dll
::Input message into chat file
if not exist chat.txt goto Write
for /F "tokens=2" %%i in ('date /t') do set mydate=%%i

:startmsg
echo ( ) %username% [%mydate%] >>Message.txt

:Actualmsg
if not exist chat.txt goto Actualmsg
echo    %input% >>Message.txt

:Endmsg
if not exist chat.txt goto Endmsg
echo. >>Message.txt

::reset the input to prevent spam
set input=
goto read_messages

:ErrorFTP
echo Cannot communicate with FTP server, login with FTPLOADER.bat and try again!
pause

:Nyan
mode con: cols=300 lines=150
echo WARNING FLASHING COLORS!
timeout 1 > NUL
cd prog                        
set "file=SoundEffect.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
:Rainbow
type Prog.dll
timeout 1 > NUL
color 01
timeout 1 > NUL
color 02
timeout 1 > NUL                                                                                                                                           
color 04
timeout 1 > NUL
color 05
timeout 1 > NUL                                                                                                                                                    
color 06
goto Rainbow                                                                                                                                                      

:ServerEmpty
echo The server you chose has not been added yet, would you like to add it now?
set /p addserver
if %addserver% == yes goto addnewserver
if %addserver% == Yes goto addnewserver
if %addserver% == y goto addnewserver
if %addserver% == Y goto addnewserver
if %addserver% == no goto ServerChange
if %addserver% == No goto ServerChange
if %addserver% == n goto ServerChange
if %addserver% == N goto ServerChange
echo %addserver% is not a valid response
pause
cls
goto ServerEmpty

:ServerChange
echo Which server would you like to load? (1-5)
set /p ServerChange=
if %ServerChange% == 1 goto Server1
if %ServerChange% == 2 goto Server2
if %ServerChange% == 3 goto Server3
if %ServerChange% == 4 goto Server4
if %ServerChange% == 5 goto Server5
echo Not a valid server.
pause
cls
goto ServerChange

:Server1
echo Loading Server 1...
IF [%Server1] == [] GOTO ServerEmpty
cd Servers
del "CurrentServer.dll" /s /f /q
echo Server1> CurrentServer.dll
cd %~dp0 
goto read_messages

:Server2
echo Loading Server 2...
IF [%Server2] == [] GOTO ServerEmpty
cd Servers
del "CurrentServer.dll" /s /f /q
echo Server2> CurrentServer.dll
cd %~dp0 
goto read_messages

:Server3
echo Loading Server 3...
IF [%Server3] == [] GOTO ServerEmpty
cd Servers
del "CurrentServer.dll" /s /f /q
echo Server3> CurrentServer.dll
cd %~dp0 
goto read_messages

:Server4
echo Loading Server 4...
IF [%Server4] == [] GOTO ServerEmpty
cd Servers
del "CurrentServer.dll" /s /f /q
echo Server4> CurrentServer.dll
cd %~dp0 
goto read_messages

:Server5
echo Loading Server 5...
IF [%Server5] == [] GOTO ServerEmpty
cd Servers
del "CurrentServer.dll" /s /f /q
echo Server5> CurrentServer.dll
cd %~dp0 
goto read_messages

:addnewserver
cd Servers
echo Please enter the Hostname of the FTP server:
set /p HostName=
echo.
echo Please enter the Username for the FTP server:
set /p UsernameFTP=
echo.
echo Please enter the Password for the FTP server:
set /p PasswordFTP=
echo.
IF [%ServerChange] == [] GOTO ServerEmpty
del "CurrentServer.dll" /s /f /q
if %ServerChange% == 1 goto Server1Add
if %ServerChange% == 2 goto Server2Add
if %ServerChange% == 3 goto Server3Add
if %ServerChange% == 4 goto Server4Add
if %ServerChange% == 5 goto Server5Add

:Server1Add
del "Server1" /s /f /q
echo ftps://%UsernameFTP%:%PasswordFTP%@%HostName%> Server1.dll
echo Server1> CurrentServer.dll
echo Server added! 
pause
cls
goto read_messages

:Server2Add
del "Server2" /s /f /q
echo ftps://%UsernameFTP%:%PasswordFTP%@%HostName%> Server2.dll
echo Server2> CurrentServer.dll
echo Server added! 
pause
cls
goto read_messages

:Server3Add
del "Server3" /s /f /q
echo ftps://%UsernameFTP%:%PasswordFTP%@%HostName%> Server3.dll
echo Server3> CurrentServer.dll
echo Server added! 
pause
cls
goto read_messages

:Server4Add
del "Server4" /s /f /q
echo ftps://%UsernameFTP%:%PasswordFTP%@%HostName%> Server4.dll
echo Server4> CurrentServer.dll
echo Server added! 
pause
cls
goto read_messages

:Server5Add
del "Server5" /s /f /q
echo ftps://%UsernameFTP%:%PasswordFTP%@%HostName%> Server5.dll
echo Server5> CurrentServer.dll
echo Server added! 
pause
cls
goto read_messages
