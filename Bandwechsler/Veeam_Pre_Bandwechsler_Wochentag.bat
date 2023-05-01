@echo off
ECHO https://github.com/frankenfrank/veeam/tree/main/Bandwechsler
color 1F
IF NOT EXIST c:\temp MD c:\temp
CLS

REM FEIERTAGE AUSLESEN
REM Hier die FEIERTAG eintragen, die werden dann in eine Datei geschrieben
REM Feiertage festes Datum
ECHO 01.01. >C:\temp\FEIERTAGE.txt
ECHO 06.01. >>C:\temp\FEIERTAGE.txt
ECHO 01.05. >>C:\temp\FEIERTAGE.txt
ECHO 18.05. >>C:\temp\FEIERTAGE.txt
ECHO 29.05. >>C:\temp\FEIERTAGE.txt
ECHO 08.06. >>C:\temp\FEIERTAGE.txt
ECHO 08.08. >>C:\temp\FEIERTAGE.txt
ECHO 15.08. >>C:\temp\FEIERTAGE.txt
ECHO 03.10. >>C:\temp\FEIERTAGE.txt
ECHO 01.11. >>C:\temp\FEIERTAGE.txt
ECHO 24.12. >>C:\temp\FEIERTAGE.txt
ECHO 25.12. >>C:\temp\FEIERTAGE.txt
ECHO 26.12. >>C:\temp\FEIERTAGE.txt
ECHO 31.12. >>C:\temp\FEIERTAGE.txt
REM Feiertage die sich ändern
ECHO 07.04.2023 >>C:\temp\FEIERTAGE.txt
ECHO 10.04.2023 >>C:\temp\FEIERTAGE.txt


REM heutiges Datum in Liste suchen lassen
find C:\temp\FEIERTAGE.txt "%date%:~0,-4"
IF ERRORLEVEL 0 GOTO FEIERTAG
GOTO WORKDAY

:FEIERTAG
ECHO %DATE% >C:\temp\FEIERTAG.bayern
del c:\temp\FEIERTAGE.txt /q



:WORKDAY
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
TIMEOUT /T 2 /NOBREAK >NUL

ECHO %WOCHENTAG% >C:\temp\%WOCHENTAG%.veeam

REM Systemvariable ist noch in Beta-Status
SETX VEEAM-WOCHENTAG "%WOCHENTAG%" /m


GOTO EOF


:EOF
ECHO.
ECHO.
ECHO Wird beendet
TIMEOUT /T 2 /NOBREAK
EXIT

