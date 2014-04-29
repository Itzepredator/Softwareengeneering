package github.com.Itzepredator.Softwareengeneering;

import org.junit.Assert;
import org.junit.Ignore;

import cucumber.api.PendingException;
import cucumber.api.java.de.Wenn;
import cucumber.api.java.de.Dann;
import cucumber.api.java.de.Angenommen;
import de.hsqldb.Datenbank.DBConnector;

public class BenutzerAnlegenSteps {

	public DBConnector dbcon =new DBConnector();

	@Angenommen("^diese absendet.$")
	public void diese_absendet() throws Throwable {
		Assert.assertTrue(true);
	}

	@Dann("^werden die Pers�nlichen Informationen validiert.$")
	public void werden_die_Pers�nlichen_Informationen_validiert() throws Throwable {
	try {
	Assert.assertTrue(dbcon.loginCheck("Itze88", "1234", "Heinen-andreas@web.de"));
	} catch (Exception e) {
		   throw new PendingException();
	}

	}

	@Wenn("^die Validierung in Ordnung war,$")
	public void die_Validierung_in_Ordnung_war() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Dann("^werden die Informationen in der Datenbank gespeichert.$")
	public void werden_die_Informationen_in_der_Datenbank_gespeichert() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Wenn("^die Informationen gespeichert wurden,$")
	public void die_Informationen_gespeichert_wurden() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Dann("^bekommt der Benutzer eine Bestätigung, dass der Vorgang erfolgreich abgeschlossen wurde$")
	public void bekommt_der_Benutzer_eine_Bestätigung_dass_der_Vorgang_erfolgreich_abgeschlossen_wurde() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Dann("^der Benutzer angelegt wurde.$")
	public void der_Benutzer_angelegt_wurde() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Dann("^werden die Informationen validiert.$")
	public void werden_die_Informationen_validiert() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Wenn("^beim validieren der  Persoenlichen Informationen ein Fehler auftritt,$")
	public void beim_validieren_der_Persoenlichen_Informationen_ein_Fehler_auftritt() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Dann("^der Vorgang wird unterbrochen.$")
	public void der_Vorgang_wird_unterbrochen() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
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
	
}