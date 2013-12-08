# language: de

Funktionalit�t: Feedback
	als ein Benutzer
	um von Ihm besuchte Tankstellen zu Bewerten
	Der Benutzer möchte eine Tankstelle bewerten.
	
Szenario:(Mainflow) Wenn Der Benutzer Informationen in das Feedbackformular eingetragen hat
					Und das Formular abgesendet hat,
					Dann werden die eingegebenen Daten Validiert.
					Wenn die Validierung abgeschlossen ist,
					Dann werden die Feedbackdaten in der Datenbank gespeichert.
					Und die Daten können in der Rubrik Feedback angezeigt werden.
					
Szenario:(Alternative 1) Wenn Der Benutzer Informationen in das Feedbackformular eingetragen hat
					Und das Formular abgesendet hat,
					Dann werden die eingegebenen Daten Validiert.
					Wenn bei der Validierung ein Fehler aufgetreten ist (z.B. Aufgrund nicht erlaubter Zeichen),
					Dann bekommt der Benutzer eine Fehlermeldung 
					Und sein Feedback anpassen 
					Und erneut absenden.
					
Szenario:(Alternative 2) Wenn Der Benutzer Informationen in das Feedbackformular eingetragen hat
					Und das Formular abgesendet hat,
					Dann werden die eingegebenen Daten Validiert.
					Wenn die Validierung abgeschlossen ist,
					Dann werden die Feedbackdaten in der Datenbank gespeichert.
					Wenn es beim Speichern der Daten zu einem Fehler kommt
					Dann bekommt der Benutzer eine Fehlermeldung angezeigt
					Und der aktuelle Flow wird unterbrochen, jedoch nicht der komplette UseCase beendet. 
																				
					