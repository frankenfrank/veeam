@echo off
ECHO https://github.com/frankenfrank/veeam/tree/main/Bandwechsler
color 1F
IF NOT EXIST c:\temp MD c:\temp
CLS

REM Bewegliche Feiertage anpassen!!!
REM FESTE FEIERTAGE
ECHO 01.01. >C:\temp\FEIERTAGE.txt
ECHO 06.01. >>C:\temp\FEIERTAGE.txt
ECHO 01.05. >>C:\temp\FEIERTAGE.txt
ECHO 08.08. >>C:\temp\FEIERTAGE.txt
ECHO 15.08. >>C:\temp\FEIERTAGE.txt
ECHO 03.10. >>C:\temp\FEIERTAGE.txt
ECHO 01.11. >>C:\temp\FEIERTAGE.txt
ECHO 24.12. >>C:\temp\FEIERTAGE.txt
ECHO 25.12. >>C:\temp\FEIERTAGE.txt
ECHO 26.12. >>C:\temp\FEIERTAGE.txt
REM BEWEGLICHE FEIERTAGE
REM Karfreitag
ECHO 07.04.2023 >>C:\temp\FEIERTAGE.txt
REM Ostermontag
ECHO 10.04.2023 >>C:\temp\FEIERTAGE.txt
REM Christi Himmelfahrt
ECHO 18.05.2023 >>C:\temp\FEIERTAGE.txt
REM Pfingstmontag
ECHO 29.05.2023 >>C:\temp\FEIERTAGE.txt
REM Fronleichnam
ECHO 08.06.2023 >>C:\temp\FEIERTAGE.txt


REM heutiges Datum in Liste suchen lassen
FIND C:\temp\FEIERTAGE.txt "%date%:~0,-4"
IF %ERRORLEVEL%==0 SETX VEEAMTAG FEIERTAG /m
IF %ERRORLEVEL%==1 SETX VEEAMTAG WERKTAG /m


:DAYOFWEEK
SET DAYOFWEEK=
REM Aktuellen Wochentag auslesen
FOR /f %%g in ('wmic path win32_localtime get dayofweek^|findstr /v /r "^$"') do (
SET DAYOFWEEK=%%g)
IF %DAYOFWEEK%==0 SETX /m WOCHENTAG SONNTAG
IF %DAYOFWEEK%==1 SETX /m WOCHENTAG MONTAG
IF %DAYOFWEEK%==2 SETX /m WOCHENTAG DIENSTAG
IF %DAYOFWEEK%==3 SETX /m WOCHENTAG MITTWOCH
IF %DAYOFWEEK%==4 SETX /m WOCHENTAG DONNERSTAG
IF %DAYOFWEEK%==5 SETX /m WOCHENTAG FREITAG
IF %DAYOFWEEK%==6 SETX /m WOCHENTAG SAMSTAG

REM Wenn der Freitag ein Feiertag ist, muss trotzdem ein Band geschrieben werden wiel es dann die Wochen- oder Monatssicherung sein kann.
IF %WOCHENTAG%==FREITAG SETX VEEAMTAG WERKTAG /m

GOTO EOF


:EOF
ECHO.
ECHO.
ECHO Wird beendet
TIMEOUT /T 2 /NOBREAK
pause
EXIT

