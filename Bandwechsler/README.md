Die Datei "Veeam_Pre_Bandwechsler_Systemvariable.bat" wird vor jeder Tagessicherung gestartet und schreibt in die Systemvariable "Wochentag" den Tag rein,
an dem der Job gestartet wurde.

Veeam_Post_Bandwechsler_Tapejob.bat dann nach der Tagessicherung ausgeführt und schaut, welcher Wert in der Systemvariable "Wochentag"gesetzt ist.

Der jeweilige Wochentag hat eine Sprungmarke und es wird die Kommandozeile den richtigen Tapejob geladen.
Sollte die Tagessicherung z.B. Mittwoch um 19 uhr starten und wird um 23:59 uhr fertig steht in der Systemvariable "Mittwoch",
wird der Job aber erst nach Mitternacht fertig, würde beim klassischen "Welcher Tag ist heute"-Abfrage Donnerstag ausgelesen werden,
durch das Schreiben der Variable vor dem Start steht in der Systemvariable "Mittwoch" und eswird das Mittwochsband genommen.
Weil eben nicht der Wochentag ausgessen wird sondern die Systemvariable und die ist ja abhängig nicht vom aktuellen Tag sondern vom Tag des Start der Tagessicherung.
