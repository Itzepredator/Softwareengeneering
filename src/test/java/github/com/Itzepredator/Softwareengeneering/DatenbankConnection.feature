# language: de

Funktionalit�t: Verbindung zur Datenbank kann aufgebaut werden
	der DatenbankConnector m�chte eine Verbindung zur Db aufbauen
	der DBConnector kann eine verbindung aufbauen
	
Szenario:(Mainflow) Wenn der DatenbankConnector ausgef�hrt wird
					Dann wird eine Verbindung zur Datenbank hergestellt.
					Und es wird ein TestSQL abgesetzt.
					
Szenario:(Alternative 1) Wenn der DatenbankConnector ausgef�hrt wird
					Dann wird eine Verbindung zur Datenbank hergestellt.
					Wenn diese Verbindung fehlschl�gt,
					Dann wird ein Fehler geworfen.