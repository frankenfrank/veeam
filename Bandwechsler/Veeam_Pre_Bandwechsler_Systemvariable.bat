@echo off
color 1F


set DAYOFWEEK=
REM Aktuellen Wochentag auslesen
for /f %%g in ('wmic path win32_localtime get dayofweek^|findstr /v /r "^$"') do (
set DAYOFWEEK=%%g)
if %DAYOFWEEK%==0 set WOCHENTAG=SONNTAG
if %DAYOFWEEK%==1 set WOCHENTAG=MONTAG
if %DAYOFWEEK%==2 set WOCHENTAG=DIENSTAG
if %DAYOFWEEK%==3 set WOCHENTAG=MITTWOCH
if %DAYOFWEEK%==4 set WOCHENTAG=DONNERSTAG
if %DAYOFWEEK%==5 set WOCHENTAG=FREITAG
if %DAYOFWEEK%==6 set WOCHENTAG=SAMSTAG


REM Es wird der aktuelle Wochentag als Systemvariable gesetzt
ECHO Heute ist %WOCHENTAG%
setx WOCHENTAG %WOCHENTAG%
GOTO EOF


:EOF
ECHO.
ECHO.
ECHO Wird beendet
TIMEOUT /T 1 /NOBREAK
EXIT

