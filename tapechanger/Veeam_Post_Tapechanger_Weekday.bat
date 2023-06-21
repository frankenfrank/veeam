@ECHO OFF
REM https://github.com/frankenfrank/veeam/tree/main/tapechanger
COLOR 1F

SET FOLDER=c:\temp

IF NOT EXIST %FOLDER%\*.veeam GOTO ERROR 1

:WEEKDAY
REM Lookong for File with Name of Weekday
IF EXIST %FOLDER%\MONDAY.veeam SET JOBID=PUT_JOB-ID_HERE
IF EXIST %FOLDER%\TUESDAY.veeam SET JOBID=PUT_JOB-ID_HERE
IF EXIST %FOLDER%\WEDNESDAY.veeam SET JOBID=PUT_JOB-ID_HERE
IF EXIST %FOLDER%\THURSDAY.veeam SET JOBID=PUT_JOB-ID_HERE
IF EXIST %FOLDER%\FRIDAY.veeam SET JOBID=PUT_JOB-ID_HERE
IF EXIST %FOLDER%\SATURDAY.veeam GOTO EOF
IF EXIST %FOLDER%\SUNDAY.veeam GOTO EOF

IF NOT EXIST %FOLDER%\*.veeam GOTO ERROR1
GOTO EOF

:JOBSTART
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
