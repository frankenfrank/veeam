Die Datei "Veeam_Pre_Bandwechsler_Wochentag.bat" wird vor jeder Tagessicherung gestartet und erzeugt eine Datei "c:\temp\%WOCHENTAG%.veeam".

Veeam_Post_Bandwechsler_Tapejob.bat dann nach der Tagessicherung ausgeführt und prüft, ob welche Datei erzeugt wurde ( z.B. DONNERSTAG.veeam ).

Der jeweilige Wochentag hat eine Sprungmarke und es wird die Kommandozeile den richtigen Tapejob geladen.
Sollte die Tagessicherung z.B. Mittwoch um 19 uhr starten und wird um 23:59 uhr fertig steht in der Systemvariable "Mittwoch",
wird der Job aber erst nach Mitternacht fertig, würde beim klassischen "Welcher Tag ist heute"-Abfrage Donnerstag ausgelesen werden,
durch das Schreiben der Datei vor dem Start existiert eine Datei mit Namen MITTWOCH.veeam und es wird das Band geladen, was sich in der Tape-Library im Ordner Mittwoch befindet.
