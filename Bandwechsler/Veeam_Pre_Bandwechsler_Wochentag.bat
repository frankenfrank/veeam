@ECHO OFF
ECHO https://github.com/frankenfrank/veeam/tree/main/Bandwechsler
COLOR 1F
IF NOT EXIST c:\temp MD c:\temp
CLS


SET DAYOFWEEK=
REM Aktuellen Wochentag auslesen
FOR /f %%g in ('wmic path win32_localtime get dayofweek^|findstr /v /r "^$"') do (
SET DAYOFWEEK=%%g)
IF %DAYOFWEEK%==0 SET WOCHENTAG=SONNTAG
IF %DAYOFWEEK%==1 SET WOCHENTAG=MONTAG
IF %DAYOFWEEK%==2 SET WOCHENTAG=DIENSTAG
IF %DAYOFWEEK%==3 SET WOCHENTAG=MITTWOCH
IF %DAYOFWEEK%==4 SET WOCHENTAG=DONNERSTAG
IF %DAYOFWEEK%==5 SET WOCHENTAG=FREITAG
IF %DAYOFWEEK%==6 SET WOCHENTAG=SAMSTAG


REM Es wird der aktuelle Wochentag als Datei gespeichert
REM Dann legen wir eine Datei unter c:\temp an, löschen aber vorher, falls es noch Altlasten gibt.
DEL c:\temp\*.veeam /q
TIMEOUT /T 2 /NOBREAK

ECHO %WOCHENTAG% >C:\temp\%WOCHENTAG%.veeam
ECHO WOCHENTAG %WOCHENTAG% >C:\temp\veeam_wochentag.log

REM Das mit der Systemvariable ist noch im Beta Stadium.
SETX WOCHENTAG %WOCHENTAG% /m


GOTO EOF


:EOF
ECHO.
ECHO.
ECHO Wird beendet
TIMEOUT /T 2 /NOBREAK
EXIT
