@ECHO OFF
REM https://github.com/frankenfrank/veeam/tree/main/tapechanger

set PScmd=%0
set PSscript=PowerShell -WindowStyle Hidden -NoProfile -ExecutionPolicy Bypass -Command -
echo %0 %PSscript%

REM The number after the plus sign determines from which line the code is passed to a PowerShell script.
more +12 %0 | %PSscript%

###Powershell Script starts here ###

### Define Work-Folder or create if not exist
$FolderPath = "c:\temp\"
if (-not (Test-Path -Path $FolderPath -PathType Container)) {
    New-Item -Path $FolderPath -ItemType Directory
}

### Define FileExtension
$FileExtension = ".veeam"


### Delete old Files with file extension "veeam".
Get-ChildItem -Path "$FolderPath" -Filter $FileExtension | Remove-Item -Force


### Get a list of files with the specified extension
$FilesToDelete = Get-ChildItem -Path $FolderPath -Filter "*$FileExtension"

### Delete the files
foreach ($File in $FilesToDelete) {
    Remove-Item $File.FullName -Force
}

### Retrieve current Day of Week in English
$CurrentDate = Get-Date
$DayOfWeek = $CurrentDate.ToString("dddd", [System.Globalization.CultureInfo]::InvariantCulture)
$FileName = "$DayOfWeek"

### Combain Foldername, Filename and FileExtension
$WeekdayFileName = $FolderPath + $DayOfWeek + $FileExtension

### Create File
New-Item -Path $WeekdayFileName -ItemType File

EXIT
