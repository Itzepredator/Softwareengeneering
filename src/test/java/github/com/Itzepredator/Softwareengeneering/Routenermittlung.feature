# language: de

Funktionalit�t: Routenermittlung
	als ein Benutzer
	um den kürzesten Weg zur ausgewählten Tankstelle zu finden
	Der Benutzer möchte den kürzesten Weg finden
	
Szenario:(Mainflow) Wenn Der Benutzer eine Tankstelle auswählt 
		  Und das Formular absendet, 
		  Dann wird die Tankstelle Validiert.
		  Wenn die Validierung richtig ist,
		  Dann wird der Aktuelle Standort ermittelt.
		  Wenn der Aktuelle Standort ermittel ist,
		  Dann wird die Route berechnet.
		  Wenn die Route berechnet ist,
		  Dann wird die Route an den Benutzer ausgegeben.
		  
Szenario:(Alternitivflow 1)  Wenn Der Benutzer eine Tankstelle auswählt 
		  Und das Formular absendet, 
		  Dann wird die Tankstelle Validiert.
		  Wenn die Validierung Fehlschlägt,
		  Dann bekommt der Benutzer eine Fehlermeldung 
		  Und kann eine neue Tankstelle auswählen
		  
Szenario:(Alternativflow 2) Wenn Der Benutzer eine Tankstelle auswählt 
		  Und das Formular absendet, 
		  Dann wird die Tankstelle Validiert.
		  Wenn die Validierung richtig ist,
		  Dann wird der Aktuelle Standort ermittelt.
		  Wenn der Aktuelle Standort nicht ermittelt werden kann,
		  Dann bekommt der Benutzer eine Fehlermeldung 
		  Und es wird weiter versucht den Standort zu ermitteln.
		  
Szenario:(Alternativflow 3)	 Wenn Der Benutzer eine Tankstelle auswählt 
		  Und das Formular absendet, 
		  Dann wird die Tankstelle Validiert.
		  Wenn die Validierung richtig ist,
		  Dann wird der Aktuelle Standort ermittelt.
		  Wenn der Aktuelle Standort ermittelt werden kann,
		  Dann wird die Route berechnet. 
		  Wenn es bei der Berechnung zu einem Fehler kommt
		  Dann wird der Benutzer mit einer Fehlermeldung benachrichtigt 
		  Und der aktuelle Flow wird unterbrochen, aber nicht der komplette UseCase beendet.	  
		  		  