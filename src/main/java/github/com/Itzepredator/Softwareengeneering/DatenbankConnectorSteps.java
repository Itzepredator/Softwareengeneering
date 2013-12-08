package github.com.Itzepredator.Softwareengeneering;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import cucumber.api.PendingException;
import cucumber.api.java.de.Dann;
import cucumber.api.java.de.Wenn;
import de.hsqldb.Datenbank.DBConnector;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertFalse;


public class DatenbankConnectorSteps {
	@Dann("^wird eine Verbindung zur Datenbank hergestellt.$")
	public void wird_eine_Verbindung_zur_Datenbank_hergestellt() throws Throwable {
	  new DBConnector();
	    
	}

	@Dann("^es wird ein TestSQL abgesetzt.$")
	public void es_wird_ein_TestSQL_abgesetzt() throws Throwable {
	    
	      
	    DBConnector connector = new DBConnector();
	    connector.testSQLAusfuehren(verbindungZurDatenbankAufbauen());
	}

	private Connection verbindungZurDatenbankAufbauen() throws SQLException {
		Connection con = DriverManager.getConnection( 
	              "jdbc:hsqldb:file:C:\\Users\\Andreas\\Downloads\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DBTreiber; shutdown=true", "heinen", "FDSha388" );
		return con;
	}

	@Wenn("^diese Verbindung fehlschlaegt")
	public void diese_Verbindung_fehlschlaegt() throws Throwable {
		DBConnector connector =new DBConnector();
		boolean thrown = false;
		try{
			connector.verbindungsaufbauTesten(
			          "Hier sollte ein Fehler auftreten");
}catch (ClassNotFoundException e) {
thrown =true;
}catch ( SQLException e ){
	thrown =true;
}
assertTrue(thrown);
	
	}


	@Dann("^wird ein Fehler geworfen.$")
	public void wird_ein_Fehler_geworfen() throws Throwable {
		DBConnector connector =new DBConnector();
		boolean thrown = false;
		try{
			connector.verbindungsaufbauTesten(
			          "Wurde ein Fehler geworfen?");
}catch (ClassNotFoundException e) {
thrown =true;
}catch ( SQLException e ){
	thrown =true;
}
assertTrue(thrown);
	}
	
	
}

