@ECHO OFF
REM @ECHO OFF
REM https://github.com/frankenfrank/veeam/tree/main/Bandwechsler


set PScmd=%0
set PSscript=PowerShell -WindowStyle Hidden -NoProfile -ExecutionPolicy Bypass -Command -
echo %0 %PSscript%
cmd /c more +7 %0 | %PSscript%
exit /b

### PowerShell script starts here ###


COLOR 1F
SET FOLDER=c:\temp
IF NOT EXIST %FOLDER%\*.veeam GOTO ERROR 1

:WEEKDAY
REM Lookong for File with Name of Weekday
IF NOT EXIST %FOLDER%\*.veeam GOTO ERROR1
IF EXIST %FOLDER%\MONDAY.veeam SET JOBID=1_Montagsband
IF EXIST %FOLDER%\TUESDAY.veeam SET JOBID=2_Dienstagsband
IF EXIST %FOLDER%\WEDNESDAY.veeam SET JOBID=3_Mittwochsband
IF EXIST %FOLDER%\THURSDAY.veeam SET JOBID=4_Donnerstagsband
IF EXIST %FOLDER%\FRIDAY.veeam SET JOBID=5_Freitagsband
IF EXIST %FOLDER%\SATURDAY.veeam GOTO EOF
IF EXIST %FOLDER%\SUNDAY.veeam GOTO EOF
GOTO JOBSTART
GOTO ERROR2

:JOBSTART
::"C:\Program Files\Veeam\Backup and Replication\Backup\Veeam.Backup.Manager.exe" backup %JOBID%
Get-VBRTapeJob -Name "%JOBID%" | Start-VBRJob
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
