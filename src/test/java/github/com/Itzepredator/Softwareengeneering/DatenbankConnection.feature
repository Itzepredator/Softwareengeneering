# language: de

Funktionalität: Verbindung zur Datenbank kann aufgebaut werden
	der DatenbankConnector möchte eine Verbindung zur Db aufbauen
	der DBConnector kann eine verbindung aufbauen
	
Szenario:(Mainflow) Wenn der DatenbankConnector ausgeführt wird
					Dann wird eine Verbindung zur Datenbank hergestellt.
					Und es wird ein TestSQL abgesetzt.
					
Szenario:(Alternative 1) Wenn der DatenbankConnector ausgeführt wird
					Dann wird eine Verbindung zur Datenbank hergestellt.
					Wenn diese Verbindung fehlschlägt,
					Dann wird ein Fehler geworfen.