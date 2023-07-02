@ECHO OFF
REM https://github.com/frankenfrank/veeam/tree/main/Tapechanger
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
