@echo off
REM https://github.com/frankenfrank/veeam/tree/main/Bandwechsler
color 1F
IF NOT EXIST c:\temp MD c:\temp
CLS

REM Erstmal löschen wir Altlasten.
DEL c:\temp\*.veeam /q


:DAYOFWEEK
set DAYOFWEEK=
REM Aktuellen Wochentag auslesen
for /f %%g in ('wmic path win32_localtime get dayofweek^|findstr /v /r "^$"') do (
set DAYOFWEEK=%%g)
if %DAYOFWEEK%==0 ECHO SONNTAG>C:\temp\SONNTAG.veeam
if %DAYOFWEEK%==1 ECHO MONTAG >C:\temp\MONTAG.veeam
if %DAYOFWEEK%==2 ECHO DIENSTAG >C:\temp\DIENSTAG.veeam
if %DAYOFWEEK%==3 ECHO MITTWOCH >C:\temp\MITTWOCH.veeam
if %DAYOFWEEK%==4 ECHO DONNERSTAG >C:\temp\DONNERSTAG.veeam
if %DAYOFWEEK%==5 ECHO FREISTAG >C:\temp\FREITAG.veeam
if %DAYOFWEEK%==6 ECHO SAMSTAG >C:\temp\SAMSTAG.veeam

GOTO EOF

:EOF
ECHO.
ECHO.
ECHO Script Ende
TIMEOUT /T 3 /NOBREAK
EXIT
