@echo off
ECHO https://github.com/frankenfrank/veeam/tree/main/Bandwechsler
color 1F

REM Hier die Job-IDs von Veeam eintragen
SET JOBID-Montag=
SET JOBID-Dienstag=
SET JOBID-Mittwoch=
SET JOBID-Donnerstag=
SET JOBID-Freitag=


REM Die Systemvariable WOCHENTAG wird ausgelesen
IF EXIST c:\temp\SONNTAG.veeam GOTO Sonntagsband
IF EXIST c:\temp\MONTAG.veeam GOTO Montagsband
IF EXIST c:\temp\DIENSTAG.veeam GOTO Dienstagsband
IF EXIST c:\temp\MITTWOCH.veeam GOTO Mittwochsband
IF EXIST c:\temp\DONNERSTAG.veeam GOTO Donnerstagsband
IF EXIST c:\temp\FREITAG.veeam GOTO Freitagsband
IF EXIST c:\temp\SAMSTAG.veeam GOTO Samstagsband

GOTO ERROR 1

:Montagsband
"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup %JOBID-Montag%6
GOTO EOF

:Dienstagsband
"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup %JOBID-Dienstag%
GOTO EOF

:Mittwochsband
"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup %JOBID-Mittwoch%
GOTO EOF

:Donnerstagsband
"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup %JOBID-Donnerstag%
GOTO EOF

:Freitagsband
"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup %JOBID-Freitag%
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
color 4f
ECHO.
IF NOT EXIST c:\temp MD c:\temp
ECHO Kein Wochentag gefunden. >>c:\temp\veeam-tapejob.log
ECHO Systemvariable WOCHENTAG prüfen >>c:\temp\veeam-tapejob.log
ECHO SYSTEMVARIABLE %WOCHENTAG% ist %WOCHENTAG% >>c:\temp\veeam-tapejob.log
ECHO oder die zweite Variante mit einer Datei als Sprungmarke hat nicht funktioniert. >>c:\temp\veeam-tapejob.log
ECHO Gibt es die Datei c:\temp\WOCHENTAG.veeam >>c:\temp\veeam-tapejob.log
ECHO.
GOTO EOF
