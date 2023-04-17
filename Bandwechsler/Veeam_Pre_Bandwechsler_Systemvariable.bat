@echo off
ECHO https://github.com/frankenfrank/veeam/tree/main/Bandwechsler
color 1F
IF NOT EXIST c:\temp MD c:\temp
CLS


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


REM Es wird der aktuelle Wochentag als Datei gespeichert
REM Dann legen wir eine Datei unter c:\temp an, löschen aber vorher, falls es noch altlasten gibt.
DEL c:\temp\*.veeam /q
TIMEOUT /T 2 /NOBREAK

ECHO %WOCHENTAG% >C:\temp\%WOCHENTAG%.veeam
ECHO WOCHENTAG %WOCHENTAG% >C:\temp\veeam_wochentag.log

GOTO EOF


:EOF
ECHO.
ECHO.
ECHO Wird beendet
TIMEOUT /T 2 /NOBREAK
EXIT

