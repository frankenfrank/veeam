First Job starts on specific Weekday, but next Job at next Day but Tapejob will be write the first day.

Script reads actual Weekday, when first Job starts and write a file with name for example "tuesday.veeam". 

After the second job, Post-Script read the filename and run the job with the correct Job-ID.

Changelog:
2023-11 Now use Powershell instead of Batch.


INSTALLATION:

1. Copy the Code
2. Paste into a new File in Powershell ISE
3. Save the File on your Backup-Server (for example: c:\Scripts\filename.ps1 )
4. In Veeam B&R go to "Job Settings -> Storage -> Advanced -> Scripts" and enter the complete file path into the line
