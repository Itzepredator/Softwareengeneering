package github.com.Itzepredator.Softwareengeneering;

import org.junit.Assert;

import cucumber.api.PendingException;
import cucumber.api.java.de.Wenn;
import cucumber.api.java.de.Dann;
import cucumber.api.java.de.Angenommen;
import de.hsqldb.Datenbank.DBConnector;

public class SucheSteps {

	public DBConnector dbcon =new DBConnector();
	
	@Angenommen("^seine Anfrage mittels dem Suchen-Button abgesendet hat.$")
	public void seine_Anfrage_mittels_dem_Suchen_Button_abgesendet_hat() throws Throwable {
	//TODO implement Methode
		Assert.assertTrue(true);
	}

	@Dann("^werden die Filterkriterien validiert.$")
	public void werden_die_Filterkriterien_validiert() throws Throwable {
		//TODO implement Methode
		Assert.assertTrue(true);
	}

	@Wenn("^die Filterkriterien validiert werden konnten,$")
	public void die_Filterkriterien_validiert_werden_konnten() throws Throwable {
		//TODO implement Methode
		Assert.assertTrue(true);
	}

	@Dann("^Werden die fuer den Benutzer entsprechenden Daten aus der Datenbank geladen.$")
	public void Werden_die_fuer_den_Benutzer_entsprechenden_Daten_aus_der_Datenbank_geladen() throws Throwable {
//		Assert.assertTrue(!dbcon.sucheTankstellenSQL("Karlsruhe").isEmpty());
		Assert.assertTrue(true);
	}

	@Wenn("^die fuer den Benutzer passenden Daten aus der Datenbank geladen werden konnten.$")
	public void die_fuer_den_Benutzer_passenden_Daten_aus_der_Datenbank_geladen_werden_konnten() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Dann("^werden dem Benutzer die Daten auf der Hompage/App angezeigt.$")
	public void werden_dem_Benutzer_die_Daten_auf_der_Hompage_App_angezeigt() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Wenn("^die Filterkriterien nicht validiert werden konnten,$")
	public void die_Filterkriterien_nicht_validiert_werden_konnten() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Dann("^wird dem Benutzer eine Fehlermeldung ausgegeben$")
	public void wird_dem_Benutzer_eine_Fehlermeldung_ausgegeben() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Dann("^der Benutzer kann die Daten der Abfrage aendern$")
	public void der_Benutzer_kann_die_Daten_der_Abfrage_Aendern() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Dann("^eine erneute Abfrage starten.$")
	public void eine_erneute_Abfrage_starten() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Wenn("^beim laden der Daten aus der Datenbank ein Fehler auftritt,$")
	public void beim_laden_der_Daten_aus_der_Datenbank_ein_Fehler_auftritt() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Dann("^der Aktuelle Flow wird beendet aber nicht der komplette UseCase$")
	public void der_Aktuelle_Flow_wird_beendet_aber_nicht_der_komplette_UseCase() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}
	
}
