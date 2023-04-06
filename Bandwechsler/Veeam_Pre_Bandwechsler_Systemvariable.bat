@echo off
color 1F


REM Diese Datei wird vor jeder Tagessicherung gestartet. Es wird die Systemvariable "Wochentag" erstellt und der jetzige Wochentag wir reingeschrieben.
REM Dann läuft der Job, egal wie lange. Nach der Tagessicherung wird das Script "Veeam_Post_Bandwechsler_Tapejob.bat" ausgeführt.
REM Das Script schaut nach, welcher Wochentag geschrieben wurde und nimmt das korrekte Band in den Wechsler.



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

