Die Datei "Veeam_Pre_Bandwechsler_Wochentag.bat" wird vor jeder Tagessicherung gestartet und erzeugt eine Datei "c:\temp\%WOCHENTAG%.veeam".

Veeam_Post_Bandwechsler_Tapejob.bat dann nach der Tagessicherung ausgeführt und prüft, ob welche Datei erzeugt wurde ( z.B. c:\temp\DONNERSTAG.veeam ).

Wird die Datei mit dem Namen des Wochentages gefunden, an dem das Backup angefangen wurde, wird die Job-ID gesetzt un der Job ausgeführt.

Sollte die Tagessicherung z.B. Mittwoch um 19 Uhr  um 23:59 Uhr fertig werden, würde der korrekte Tape Job starten. Es kann aber passieren, dass der Job erst nach Mitternacht fertig wird, somit würde das Band des Folgetages geladen werden. Um das zu verhindern gibt es dieses Repository, denn hier wird das Band geladen, von dem Tag an dem der Sicherungsjob gestartet wurde.
