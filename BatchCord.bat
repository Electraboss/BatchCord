@echo off
mode con: cols=100 lines=64

::OMG IT'S A STACK OF LINES!!!!!!!

:MainScreen
cls
set /p Theme=<Theme.txt
color %Theme%
title Incoming Messages
cls
echo   _________________________
echo  ^| BatchCord by Electraboss^|
echo  -------------------------------------------------------------------------------------------------
echo.
type .\DisplayChat.txt
echo.
echo  ___________________________
echo ^| Change Server [Server]    ^|								
echo ^|---------------------------^|_____________________________________________________________________
echo ^|( ) A Name [Mic] [Settings]^| [Add File]			                           [Emoji]^|
echo ^|___________________________^|_____________________________________________________________________^|
timeout 5 > NUL
goto MainScreen




