@ECHO OFF
REM https://github.com/frankenfrank/veeam/tree/main/Bandwechsler
COLOR 1F

IF NOT EXIST c:\temp\*.veeam GOTO ERROR 1

:WEEKDAY
REM Die Systemvariable WOCHENTAG wird ausgelesen
IF EXIST c:\temp\MONTAG.veeam SET JOBID=5abc962e-2637-4206-84a0-776b333fd036
IF EXIST c:\temp\DIENSTAG.veeam SET JOBID=c5b76380-fe3d-45e5-8d06-e9d144fdd733
IF EXIST c:\temp\MITTWOCH.veeam SET JOBID=71892983-488b-4bbc-860c-e8bb27803da1
IF EXIST c:\temp\DONNERSTAG.veeam SET JOBID=7bee2e49-95ce-4664-8edd-b71aee1bb790
IF EXIST c:\temp\FREITAG.veeam SET JOBID=b2ee7171-c878-493c-93a2-7d656b30ce07
IF EXIST c:\temp\SAMSTAG.veeam SET JOBID=
IF EXIST c:\temp\SONNTAG.veeam SET JOBID=

IF NOT EXIST c:\temp\*.veeam GOTO ERROR1

REM Job wird mit passender Job-ID gestartet
:JOBSTART
"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup %JOBID%
GOTO EOF

:EOF
ECHO Script Ende
TIMEOUT /T 3 /NOBREAK
EXIT


:ERROR1
REM Fehlerbehandlung wenn keine Datei geschrieben wurde.
SET LOGERROR1=c:\temp\TAPEJOB-ERROR1.log
ECHO Keine Datei mit dem Wochentag gefunden. >%ERROR1%
ECHO %date% - %time:~0,-3% Uhr >>%ERROR1%
GOTO EOF
