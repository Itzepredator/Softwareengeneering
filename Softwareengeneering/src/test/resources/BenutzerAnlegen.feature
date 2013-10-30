# language: de

Funktionalität: Benutzer anlegen
	als ein nicht registrierter Benutzer
	um einen Benutzer in der App/Hompage anzulegen
	Der unregistrierte Benutzer möchte einen Benutzer anlegen um auf alle Funktionen zugriff zu haben 
	
Szenario:(Mainflow) Wenn Der unregistrierte Benutzer seine Persönlichen Informationen in das Formular eingibt
					Und diese absendet.
					Dann werden die Persönlichen Informationen validiert.
					Wenn die Validierung in Ordnung war,
					Dann werden die Informationen in der Datenbank gespeichert. 
					Wenn die Informationen gespeichert wurden,
					Dann bekommt der Benutzer eine Bestätigung, dass der Vorgang erfolgreich abgeschlossen wurde
					Und der Benutzer angelegt wurde.
					
Szenario:(Alternative 1) Wenn Der unregistrierte Benutzer seine Persönlichen Informationen in das Formular eingibt
					Und diese absendet.
					Dann werden die Informationen validiert.
					Wenn beim validieren der  Persönlichen Informationen ein Fehler auftritt,
					Dann bekommt der Benutzer eine Fehlermeldung 
					Und der Vorgang wird unterbrochen. 
					Dann hat der Benutzer die Möglichkeit seine Eingabe zu korrigieren.
					
Szenario:(Alternative 2) Wenn Der unregistrierte Benutzer seine Persönlichen Informationen in das Formular eingibt
					Und diese absendet.
					Wenn die Persönlichen Informationen validiert sind,
					Dann werden die Informationen in der Datenbank gespeichert. 
					Wenn beim Speichern in die Datenbank ein Fehler auftritt,
					Dann bekommt der Benutzer eine Fehlermeldung
					Und der Aktuelle "Flow" wird unterbrochen, jedoch nicht der komplette UseCase.
										