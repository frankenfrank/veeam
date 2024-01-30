#Set Names of your Tapejobs
$TapeJobMonday = "YOUR TAPEJOBNAME HERE"
$TapeJobTuesday = "YOUR TAPEJOBNAME HERE"
$TapeJobWednesday = "YOUR TAPEJOBNAME HERE"
$TapeJobThursday = "YOUR TAPEJOBNAME HERE"
$TapeJobFriday = "YOUR TAPEJOBNAME HERE"

$FolderPath = "c:\temp"

if (Test-Path $folderPath\Monday.veeam) { $TapeJobName = "$TapeJobMonday" }
if (Test-Path $folderPath\Tuesday.veeam) { $TapeJobName = "$TapeJobTuesday" }
if (Test-Path $folderPath\Wednesday.veeam) { $TapeJobName = "$TapeJobWednesday" }
if (Test-Path $folderPath\Thursday.veeam) { $TapeJobName = "$TapeJobThursday" }
if (Test-Path $folderPath\Friday.veeam) { $TapeJobName = "$TapeJobFriday" }

Get-VBRTapeJob -Name "$TapeJobName" | Start-VBRJob

Exit
