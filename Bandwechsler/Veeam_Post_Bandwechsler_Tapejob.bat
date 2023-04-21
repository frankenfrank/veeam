@ECHO OFF
ECHO https://github.com/frankenfrank/veeam/tree/main/Bandwechsler
ECHO 1F


:FILE
REM Als Backup wird der die Datei mit dem Wochentag abgefragt
IF EXIST c:\temp\SONNTAG.veeam GOTO Sonntagsband
IF EXIST c:\temp\MONTAG.veeam GOTO Montagsband
IF EXIST c:\temp\DIENSTAG.veeam GOTO Dienstagsband
IF EXIST c:\temp\MITTWOCH.veeam GOTO Mittwochsband
IF EXIST c:\temp\DONNERSTAG.veeam GOTO Donnerstagsband
IF EXIST c:\temp\FREITAG.veeam GOTO Freitagsband
IF EXIST c:\temp\SAMSTAG.veeam GOTO Samstagsband

:SYSVAR
REM Das mit der Systemvariable ist noch im Beta Stadium.
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
"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup 5abc962e-2637-4206-84a0-776b333fd036
GOTO EOF

:Dienstagsband
"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup c5b76380-fe3d-45e5-8d06-e9d144fdd733
GOTO EOF

:Mittwochsband
"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup 71892983-488b-4bbc-860c-e8bb27803da1
GOTO EOF

:Donnerstagsband
"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup 7bee2e49-95ce-4664-8edd-b71aee1bb790
GOTO EOF

:Freitagsband
"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup b2ee7171-c878-493c-93a2-7d656b30ce07
GOTO EOF

:Samstagsband
ECHO kein Job heute
GOTO EOF

:Sonntagsband
ECHO Kein Job heute
GOTO EOF


GOTO ERROR1


:EOF
DEL c:\temp\*.veeam /q

ECHO.
ECHO.
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
