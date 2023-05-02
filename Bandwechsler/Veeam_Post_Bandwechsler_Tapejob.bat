@ECHO OFF
ECHO https://github.com/frankenfrank/veeam/tree/main/Bandwechsler
COLOR 1F
cls

REM Hier die Jpb-ID aus Veeam für jeden Wochentag eintragen
SET IDMONTAG=5abc962e-2637-4206-84a0-776b333fd036
SET IDDIENSTAG=c5b76380-fe3d-45e5-8d06-e9d144fdd733
SET IDMITTWOCH=71892983-488b-4bbc-860c-e8bb27803da1
SET IDDONNERSTAG=7bee2e49-95ce-4664-8edd-b71aee1bb790
SET IDFREITAG=b2ee7171-c878-493c-93a2-7d656b30ce07
SET IDSAMSTAG=
SET IDSONNTAG=


IF %VEEAMTAG%==FEIERTAG GOTO FEIERTAG


:TAPESTART
REM Die Systemvariable WOCHENTAG wird ausgelesen
IF %WOCHENTAG%==SONNTAG GOTO Sonntagsband
IF %WOCHENTAG%==MONTAG GOTO Montagsband
IF %WOCHENTAG%==DIENSTAG GOTO Dienstagsband
IF %WOCHENTAG%==MITTWOCH GOTO Mittwochsband
IF %WOCHENTAG%==DONNERSTAG GOTO Donnerstagsband 
IF %WOCHENTAG%==FREITAG GOTO Freitagsband
IF %WOCHENTAG%==SAMSTAG GOTO Samstagsband

GOTO ERROR 1


:Montagsband
ECHO %WOCHENTAG%
"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup %IDMONTAG%
GOTO EOF

:Dienstagsband
ECHO %WOCHENTAG%
"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup %IDDIENSTAG%
GOTO EOF

:Mittwochsband
ECHO %WOCHENTAG%
"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup %IDMITTWOCH%
GOTO EOF

:Donnerstagsband
ECHO %WOCHENTAG%
"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup %IDDONNERSTAG%
GOTO EOF

:Freitagsband
ECHO %WOCHENTAG%
"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup %IDFREITAG%
GOTO EOF

:Samstagsband
ECHO %WOCHENTAG%
ECHO kein Job heute
GOTO EOF

:Sonntagsband
ECHO %WOCHENTAG%
ECHO Kein Job heute
GOTO EOF


GOTO ERROR1

:FEIERTAG
ECHO %date% >c:\temp\%VEEAMTAG%.txt
GOTO EOF

:EOF
ECHO Wird beendet
TIMEOUT /T 3 /NOBREAK
EXIT


:ERROR1
COLOR 4F
ECHO.
IF NOT EXIST c:\temp MD c:\temp
ECHO Kein Wochentag gefunden. >>c:\temp\veeam-tapejob.log
ECHO Systemvariable WOCHENTAG prüfen >>c:\temp\veeam-tapejob.log
ECHO SYSTEMVARIABLE %WOCHENTAG% ist %WOCHENTAG% >>c:\temp\veeam-tapejob.log
ECHO oder die zweite Variante mit einer Datei als Sprungmarke hat nicht funktioniert. >>c:\temp\veeam-tapejob.log
ECHO Gibt es die Datei c:\temp\WOCHENTAG.veeam >>c:\temp\veeam-tapejob.log
ECHO.
GOTO EOF
