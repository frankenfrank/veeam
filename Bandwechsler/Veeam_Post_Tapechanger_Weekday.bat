@ECHO OFF
REM https://github.com/frankenfrank/veeam/tree/main/Bandwechsler
COLOR 1F

SET FOLDER=c:\temp

IF NOT EXIST %FOLDER%\*.veeam GOTO ERROR 1

:WEEKDAY
REM Looking for File with name of weekday
IF EXIST %FOLDER%\MONDAY.veeam SET JOBID=
IF EXIST %FOLDER%\TUESDAY.veeam SET JOBID=
IF EXIST %FOLDER%\WEDNESDAY.veeam SET JOBID=
IF EXIST %FOLDER%\THURSDAY.veeam SET JOBID=
IF EXIST %FOLDER%\FRIDAY.veeam SET JOBID=
::IF EXIST %FOLDER%\SATURDAY.veeam GOTO EOF
::IF EXIST %FOLDER%\SUNDAY.veeam GOTO EOF

IF NOT EXIST %FOLDER%\*.veeam GOTO ERROR1
GOTO EOF

:JOBSTART
dir %FOLDER% /b | find "veeam"
"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup %JOBID%
GOTO EOF

:EOF
ECHO Script End
TIMEOUT /T 3 /NOBREAK
EXIT

:ERROR1
REM ERRORHANDLUNG, If there is no file.
SET LOGERROR1=%FOLDER%\VEEAM-TAPEJOB-ERROR1.log
ECHO %DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%;%time:~0,-3%;FILE_NOT_FOUND >>%ERROR1%
ECHO Cant find appropriate file with Day of Week. >>%ERROR1%
GOTO EOF
