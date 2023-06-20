@ECHO OFF
TITLE VBRTapeJob-IDs
REM https://helpcenter.veeam.com/docs/backup/powershell/get-vbrtapejob.html
SET PS-FILE=Veeam-GetVBRTapeJob.ps1
SET JOBIDS=Veeam-TapeJobIDs.txt
SET FOLDER=c:\temp
ECHO Get-VBRTapeJob ^| format-table -AutoSize -Property ID,Description ^| Out-File -FilePath %FOLDER%\%JOBIDS% >%FOLDER%\%PS-FILE%
ECHO Read Tape-Jobs, this takes a while...
PowerShell.exe -Command "& '%FOLDER%\%PS-FILE%'"
del %FOLDER%\%PS-FILE% /q


:CMDOUTPUT
for /F "skip=2 delims==" %%a in ('find /I "Monday" %FOLDER%\%JOBIDS%') do SET JOBID-MONDAY=%%a
for /F "skip=2 delims==" %%b in ('find /I "Tuesday" %FOLDER%\%JOBIDS%') do SET JOBID-TUESDAY=%%b 
for /F "skip=2 delims==" %%c in ('find /I "Wednesday" %FOLDER%\%JOBIDS%') do SET JOBID-WEDNESDAY=%%c
for /F "skip=2 delims==" %%d in ('find /I "Thursday" %FOLDER%\%JOBIDS%') do SET JOBID-THURSDAY=%%d
for /F "skip=2 delims==" %%e in ('find /I "Friday" %FOLDER%\%JOBIDS%') do SET JOBID-FRIDAY=%%e
ECHO.
ECHO VEEAM TAPEJOB-IDS
ECHO      can also find in '%FOLDER%\%JOBIDS%'
ECHO.
ECHO.
ECHO.
ECHO Monday:    %JOBID-MONDAY:~1,35%
ECHO Tuesday:   %JOBID-TUESDAY:~1,35%
ECHO Wednesday: %JOBID-WEDNESDAY:~1,35%
ECHO Thursday:  %JOBID-THURSDAY:~1,35%
ECHO Friday:    %JOBID-FRIDAY:~1,35%
ECHO.
GOTO EOF



:EOF
ECHO.
ECHO.
ECHO.
ECHO.
SET /P EOF=Press Button for Exit
exit
