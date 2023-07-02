@ECHO OFF
REM @ECHO OFF
REM https://github.com/frankenfrank/veeam/tree/main/Bandwechsler
COLOR 1F

SET FOLDER=c:\temp

IF NOT EXIST %FOLDER% MD %FOLDER%

REM Delete old Files with file extension "veeam".
DEL c:\temp\*.veeam /q

:DAYOFWEEK
for /f %%i in ('powershell ^(get-date^).DayOfWeek') do echo %%i >%FOLDER%\%%i.veeam
GOTO EOF

:EOF
ECHO.
ECHO.
dir /b %FOLDER% | find ".veeam"
ECHO.
ECHO Script End
TIMEOUT /T 3 /NOBREAK
EXIT

COLOR 1F
SET FOLDER=c:\temp
IF NOT EXIST %FOLDER%\*.veeam GOTO ERROR 1

:WEEKDAY
REM Lookong for File with Name of Weekday
IF NOT EXIST %FOLDER%\*.veeam GOTO ERROR1
IF EXIST %FOLDER%\MONDAY.veeam SET JOBID=5abc962e-2637-4206-84a0-776b333fd036
IF EXIST %FOLDER%\TUESDAY.veeam SET JOBID=c5b76380-fe3d-45e5-8d06-e9d144fdd733
IF EXIST %FOLDER%\WEDNESDAY.veeam SET JOBID=71892983-488b-4bbc-860c-e8bb27803da1
IF EXIST %FOLDER%\THURSDAY.veeam SET JOBID=7bee2e49-95ce-4664-8edd-b71aee1bb790
IF EXIST %FOLDER%\FRIDAY.veeam SET JOBID=b2ee7171-c878-493c-93a2-7d656b30ce07
IF EXIST %FOLDER%\SATURDAY.veeam GOTO EOF
IF EXIST %FOLDER%\SUNDAY.veeam GOTO EOF
GOTO JOBSTART
GOTO ERROR2

:JOBSTART
"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup %JOBID%
GOTO EOF

:EOF
ECHO.
dir /b %FOLDER% | find ".veeam"
ECHO.
ECHO Script End
TIMEOUT /T 3 /NOBREAK
EXIT

:ERROR1
COLOR 4F
REM ERRORHANDLUNG, If there is no file.
SET LOGERROR=%FOLDER%\VEEAM-TAPEJOB-ERROR1.log
ECHO %DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%;%time:~0,-3%;FILE_NOT_FOUND >>%ERROR1%
ECHO Cant find appropriate file with Day of Week. >>%ERROR1%
GOTO EOF

:ERROR2
COLOR 4F
REM ERRORHANDLUNG, If there is no Job.
SET LOGERROR=%FOLDER%\VEEAM-TAPEJOB-ERROR2.log
ECHO %DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%;%time:~0,-3%;JOB_NOT_FOUND >>%ERROR2%
ECHO Cant find a Job. >>%ERROR2%
GOTO EOF
