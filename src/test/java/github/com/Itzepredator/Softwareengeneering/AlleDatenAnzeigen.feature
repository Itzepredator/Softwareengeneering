# language: de

Funktionalität: Alle Daten anzeigen
	der Benutzer mÃ¶chte sich alle vorhandenen Daten anzeigen lassen
	Der Benutzer lÃ¤sst sich alle Daten anzeigen um alle Daten einsehen zu können
	
Szenario:(Mainflow) Wenn der Benutzer auf den "Alle Daten anzeigen" Button klickt
					Dann werden die Daten aus der Tabelle ausgelesen wurden,
					Wenn die Daten aus der Tabelle ausgelesen werden konnten,
					Dann bekommt der Benutzer das Ergebnis auf der App/Homepage prÃ¤sentiert.
					
Szenario:(Alternative 1) Wenn der Benutzer auf den "Alle Daten anzeigen" Button klickt
						 Dann werden die Daten aus der Tabelle ausgelesen.
						 Wenn beim auslesen der Daten ein Fehler aufgetreten ist,
						 Dann bekommt der Benutzer eine Fehlermeldung ausgegeben
						 Und der aktuelle flow wird beendet aber nicht der komplette UseCase.					