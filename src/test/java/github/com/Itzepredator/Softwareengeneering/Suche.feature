# language: de

Funktionalität: Suche
	als ein Benutzer
	um den anhand verschiedener Kriterien(Benzinsorte, Marke, Umkreis) eine Tankstelle suchen und finden zu können.
	Der Benutzer möchte eine Tankstelle anhand verschiedener Kriterien suchen.
	
Szenario:(Mainflow) Wenn Der Benutzer vordefinierte Filterkriterien ausgewählt hat
					Und seine Anfrage mittels dem Suchen-Button abgesendet hat.
					Dann werden die Filterkriterien validiert. 
					Wenn die Filterkriterien validiert werden konnten,
					Dann Werden die für den Benutzer entsprechenden Daten aus der Datenbank geladen.
					Wenn die für den Benutzer passenden Daten aus der Datenbank geladen werden konnten.
					Dann werden dem Benutzer die Daten auf der Hompage/App angezeigt.
					
Szenario:(Alternative 1) Wenn Der Benutzer vordefinierte Filterkriterien ausgewählt hat
					Und seine Anfrage mittels dem Suchen-Button abgesendet hat.
					Dann werden die Filterkriterien validiert. 
					Wenn die Filterkriterien nicht validiert werden konnten,
					Dann wird dem Benutzer eine Fehlermeldung ausgegeben
					Und der Benutzer kann die Daten der Abfrage ändern
					Und eine erneute Abfrage starten.
					
Szenario:(Alternative 2) Wenn Der Benutzer vordefinierte Filterkriterien ausgewählt hat
					Und seine Anfrage mittels dem Suchen-Button abgesendet hat.
					Dann werden die Filterkriterien validiert. 
					Wenn die Filterkriterien validiert werden konnten,
					Dann Werden die für den Benutzer entsprechenden Daten aus der Datenbank geladen.
					Wenn beim laden der Daten aus der Datenbank ein Fehler auftritt,
					Dann bekommt der Benutzer eine Fehlermeldung
					Und der Aktuelle Flow wird beendet aber nicht der komplette UseCase
					