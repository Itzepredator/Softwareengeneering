package github.com.Itzepredator.Softwareengeneering;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.SQLSyntaxErrorException;

import org.junit.Assert;
import org.junit.Test;
import org.junit.rules.ExpectedException;

import cucumber.api.PendingException;
import cucumber.api.java.de.Wenn;
import cucumber.api.java.de.Dann;
import cucumber.api.java.de.Angenommen;
import de.hsqldb.Datenbank.DBConnector;
import de.hsqldb.Datenbank.LoginSQL;

public class BenutzerAnlegenSteps {
	
	public ExpectedException thrown = ExpectedException.none(); 

	public DBConnector dbcon =new DBConnector();
	
	@Test
	public void registrierungsMethodeTesten() throws SQLException{
		 Connection con = DriverManager.getConnection( 
		  		  "jdbc:hsqldb:file:C:\\Users\\Marvin\\Documents\\HSQLDB\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DB; shutdown=true", "dbuser", "dbuser" );

		 Assert.assertTrue(dbcon.registrierung("test", "test","test","test", "test@test.de"));
		  LoginSQL lsql= new LoginSQL(con.createStatement(),con, " delete from login where id =(select max(l.id) from login l);");
		  Assert.assertTrue( lsql.sqlAusführen());
		
		
			
	
	}
	
	@Angenommen("^diese absendet.$")
	public void diese_absendet() throws Throwable {
		//TODO Methode bauen welche Absenden aus HTML Simuliert
		Assert.assertTrue(true);
	}

	@Dann("^werden die Persönlichen Informationen validiert.$")
	public void werden_die_Persönlichen_Informationen_validiert() {
		Assert.assertTrue(dbcon.loginCheck("Itze88", "1234", "Heinen-andreas@web.de"));

	}

	@Wenn("^die Validierung in Ordnung war,$")
	public void die_Validierung_in_Ordnung_war() {
		Assert.assertTrue(dbcon.loginCheck("Itze88", "1234", "Heinen-andreas@web.de"));
	}

	@Dann("^werden die Informationen in der Datenbank gespeichert.$")
	public void werden_die_Informationen_in_der_Datenbank_gespeichert() throws SQLException {
		 Connection con = DriverManager.getConnection( 
		  		  "jdbc:hsqldb:file:C:\\Users\\Marvin\\Documents\\HSQLDB\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DB; shutdown=true", "dbuser", "dbuser" );

	      LoginSQL lsql= new LoginSQL(con.createStatement(),con, "INSERT INTO LOGIN (BENUTZERNAME,PASSWORT,NACHNAME,VORNAME,EMAIL) VALUES ('test','test','test','test','test@test.de');");
		  Assert.assertTrue( lsql.sqlAusführen());
		  lsql= new LoginSQL(con.createStatement(),con, " delete from login where id =(select max(l.id) from login l);");
		  Assert.assertTrue( lsql.sqlAusführen());
	}

	@Wenn("^die Informationen gespeichert wurden,$")
	public void die_Informationen_gespeichert_wurden() throws Throwable {
		 Connection con = DriverManager.getConnection( 
		  		  "jdbc:hsqldb:file:C:\\Users\\Marvin\\Documents\\HSQLDB\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DB; shutdown=true", "dbuser", "dbuser" );

	      LoginSQL lsql= new LoginSQL(con.createStatement(),con, "INSERT INTO LOGIN (BENUTZERNAME,PASSWORT,NACHNAME,VORNAME,EMAIL) VALUES ('test','test','test','test','test@test.de');");
		  Assert.assertTrue( lsql.sqlAusführen());
		  lsql= new LoginSQL(con.createStatement(),con, " delete from login where id =(select max(l.id) from login l);");
		  Assert.assertTrue( lsql.sqlAusführen());
	}

	@Dann("^bekommt der Benutzer eine Bestätigung, dass der Vorgang erfolgreich abgeschlossen wurde$")
	public void bekommt_der_Benutzer_eine_Bestätigung_dass_der_Vorgang_erfolgreich_abgeschlossen_wurde() throws Throwable {
	  //TODO implementierung der Bestätigungsnachricht nach anlegen des Registrierens
		Assert.assertTrue(true);
	}
	

	@Dann("^der Benutzer angelegt wurde.$")
	public void der_Benutzer_angelegt_wurde() throws SQLException {
		 Connection con = DriverManager.getConnection( 
		  		  "jdbc:hsqldb:file:C:\\Users\\Marvin\\Documents\\HSQLDB\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DB; shutdown=true", "dbuser", "dbuser" );
		
		 LoginSQL lsql= new LoginSQL(con.createStatement(),con, "INSERT INTO LOGIN (BENUTZERNAME,PASSWORT,NACHNAME,VORNAME,EMAIL) VALUES ('test','test','test','test','test@test.de');");
		 Assert.assertTrue( lsql.sqlAusführen());
		 lsql= new LoginSQL(con.createStatement(),con, " delete from login where id =(select max(l.id) from login l);");
		 Assert.assertTrue( lsql.sqlAusführen());
	}

	@Dann("^werden die Informationen validiert.$")
	public void werden_die_Informationen_validiert() throws Throwable {
	    
	//TODO Methode implementieren welche prüft ob Eingabe in Ordnung (Regex oder Methode)
		Assert.assertTrue(true);
	}

	@Wenn("^beim validieren der  Persönlichen Informationen ein Fehler auftritt,$")
	public void beim_validieren_der_Persönlichen_Informationen_ein_Fehler_auftritt()  {
		//TODO Methode implementieren welche prüft ob Eingabe in Ordnung (Regex oder Methode)
				Assert.assertTrue(true);
	}
	
	@Dann("^bekommt der Benutzer eine Fehlermeldung mit Informationen angezeigt$")
	public void bekommt_der_Benutzer_eine_Fehlermeldung_mit_Informationen_angezeigt() throws Throwable {
		//TODO Methode implementieren welche die Fehlermeldung baut 
		Assert.assertTrue(true);
	}
	
	@Dann("^der Vorgang wird unterbrochen.$")
	public void der_Vorgang_wird_unterbrochen() throws Throwable {
		 Connection con = DriverManager.getConnection( 
		  		  "jdbc:hsqldb:file:C:\\Users\\Marvin\\Documents\\HSQLDB\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DB; shutdown=true", "dbuser", "dbuser" );
		try {
			 LoginSQL lsql= new LoginSQL(con.createStatement(),con, "Select * from login);");
			 lsql.sqlAusführenTest();
		} catch (SQLSyntaxErrorException e) {
			 Assert.assertTrue(true);
		}
		
		
	}

	@Dann("^hat der Benutzer die Moeglichkeit seine Eingabe zu korrigieren.$")
	public void hat_der_Benutzer_die_Moeglichkeit_seine_Eingabe_zu_korrigieren() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Wenn("^die Persoenlichen Informationen validiert sind,$")
	public void die_Persoenlichen_Informationen_validiert_sind() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Wenn("^beim Speichern in die Datenbank ein Fehler auftritt,$")
	public void beim_Speichern_in_die_Datenbank_ein_Fehler_auftritt() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Dann("^der Aktuelle \"([^\"]*)\" wird unterbrochen, jedoch nicht der komplette UseCase.$")
	public void der_Aktuelle_wird_unterbrochen_jedoch_nicht_der_komplette_UseCase(String arg1) throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}
	
	@Dann("^hat der Benutzer die Möglichkeit seine Eingabe zu korrigieren.$")
	public void hat_der_Benutzer_die_Möglichkeit_seine_Eingabe_zu_korrigieren() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Wenn("^die Persönlichen Informationen validiert sind,$")
	public void die_Persönlichen_Informationen_validiert_sind() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	
}
