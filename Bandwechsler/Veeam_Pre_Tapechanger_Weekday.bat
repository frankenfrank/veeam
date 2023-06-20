@ECHO OFF
REM https://github.com/frankenfrank/veeam/tree/main/Bandwechsler
COLOR 1F
IF NOT EXIST c:\temp MD c:\temp
CLS

REM Delete old Files with file extension "veeam".
DEL c:\temp\*.test

:DAYOFWEEK
for /f %%i in ('powershell ^(get-date^).DayOfWeek') do echo %%i >c:\temp\%%i.test

GOTO EOF

:EOF
ECHO.
ECHO.
ECHO Script End
TIMEOUT /T 3 /NOBREAK
EXIT
