@echo off
color 1F


REM Die Datei "Veeam_Pre_Bandwechsler_Systemvariable.bat" schreibt die Systemvariable "Wochentag" den Tag rein, an dem der Job gestartet wurde
REM Dieses Script hier wird dann nach der Tagessicherung ausgeführt und scvhaut, welche Variable ist gesetzt und dann wird das korrekte Band geladen.
REM Sollte die Tagessicherung v z.B. Mittwoch um 19 uhr starten und wird um 23:59 uhr fertig steht in der Systemvariable "Mittwoch",
REM wird der Job aber erst nach Mitternacht fertig, würde Donnerstag ausgelesen werden, durch das Schreiben der Variable vor dem Start wird trotzdem das Mittwochsband genommen.
REM Weil eben nicht der Wochentag ausgessen wird sondern die Systemvariable und die ist ja abhängig nicht vom aktuellen Tag sondern vom Tag des Starts.


REM Die Systemvariable WOCHENTAG wird ausgelesen
if %WOCHENTAG%==SONNTAG GOTO Sonntagsband
if %WOCHENTAG%==MONTAG GOTO Montagsband
if %WOCHENTAG%==DIENSTAG GOTO Dienstagsband
if %WOCHENTAG%==MITTWOCH GOTO Mittwochsband
if %WOCHENTAG%==DONNERSTAG GOTO Donnerstagsband 
if %WOCHENTAG%==FREITAG GOTO Freitagsband
if %WOCHENTAG%==SAMSTAG GOTO Samstagsband


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

:Sonntagsbandband
ECHO Kein Job heute
GOTO EOF


GOTO ERROR1


:EOF
ECHO.
ECHO.
ECHO Wird beendet
TIMEOUT /T 10 /NOBREAK
EXIT


:ERROR1
color 4f
ECHO.
ECHO Kein Wochentag gefunden
ECHO.
GOTO EOF