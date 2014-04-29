package de.hsqldb.Datenbank;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
 
public class DBConnector
{
	private static Connection con=null;
 



	public DBConnector()
    { 
		boolean ergebnis = false;
          
	    ergebnis = ladenDerTreiberKlasse();
		  
    try
    {
      con = DriverManager.getConnection( 
              "jdbc:hsqldb:file:C:\\Users\\Marvin\\Documents\\HSQLDB\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DB; shutdown=true", "dbuser", "dbuser" );
      //Sql zusammenbauen und ausf�hren
//     testSQLAusfuehren(con);
//      LoginSQL lsql= new LoginSQL(con.createStatement(),con, "Select l.* from login l");
//      lsql.sqlAusf�hren("");
    }
    catch ( SQLException e )
    {
      e.printStackTrace();
    }
    finally
    {
      if ( con != null )
      {
        try {
            con.close();
            } catch ( SQLException e ) {
                e.printStackTrace();
            }
      }
    }
    }


	public boolean loginCheck(String benutzerName, String passwort, String eMail)
    {
		boolean ergebnis = false;
          
	     ergebnis = ladenDerTreiberKlasse();
  
    try
    {
      con = DriverManager.getConnection( 
    		  "jdbc:hsqldb:file:C:\\Users\\Marvin\\Documents\\HSQLDB\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DB; shutdown=true", "dbuser", "dbuser" );
      
      //Sql zusammenbauen und ausf�hren
//     testSQLAusfuehren(con);
      LoginSQL lsql= new LoginSQL(con.createStatement(),con, "Select l.passwort from login l where l.benutzername ='" +benutzerName+ "'");
  	ergebnis =  lsql.sqlAusf�hren(passwort);
    }
    catch ( SQLException e )
    {
      e.printStackTrace();
    }
    finally
    {
      if ( con != null )
      {
        try {
            con.close();
            } catch ( SQLException e ) {
                e.printStackTrace();
            }
      }
    }
	return ergebnis;

    }

	public boolean registrierung(String benutzerName, String passwort, String nachname, String vorname, String eMail)
    {
		boolean ergebnis = false;
          
		ergebnis= ladenDerTreiberKlasse();
		   
  
    try
    {
      con = DriverManager.getConnection( 
    		  "jdbc:hsqldb:file:C:\\Users\\Marvin\\Documents\\HSQLDB\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DB; shutdown=true", "dbuser", "dbuser" );
      
      //Sql zusammenbauen und ausf�hren
//     testSQLAusfuehren(con);

      LoginSQL lsql= new LoginSQL(con.createStatement(),con, "INSERT INTO LOGIN(BENUTZERNAME, PASSWORT, NACHNAME, VORNAME, EMAIL) VALUES ( '"+benutzerName+"','"+passwort+"','"+nachname+"','"+vorname+"','"+eMail+"')");
     ergebnis= lsql.sqlAusf�hren();
    }
    catch ( SQLException e )
    {
      e.printStackTrace();
    }
    finally
    {
      if ( con != null )
      {
        try {
            con.close();
            return ergebnis;
            } catch ( SQLException e ) {
                e.printStackTrace();
            }
      }
    }
	return ergebnis;

    }
	
	public static ArrayList<ArrayList<String>> sucheTankstellenSQL(String ort)
    { ArrayList<ArrayList<String>> listErgebnis = new ArrayList<ArrayList<String>>();
		boolean ergebnis = false;
     ergebnis = ladenDerTreiberKlasse();
 
  
    try
    {
      con = DriverManager.getConnection( 
    		  "jdbc:hsqldb:file:C:\\Users\\Marvin\\Documents\\HSQLDB\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DB; shutdown=true", "dbuser", "dbuser" );
      
      //Sql zusammenbauen und ausf�hren
      //testSQLAusfuehren(con);
      SuchenSQL lsql= new SuchenSQL(con.createStatement(),con, "Select t.* from tankstelle t where t.ort='" +ort+ "'");
     
      listErgebnis=lsql.sqlAusfuehren();
  	  
  	  //TODO Verarbeitung der Suche
    }
    catch ( SQLException e )
    {
      e.printStackTrace();
    }
    finally
    {
      if ( con != null )
      {
        try {
            con.close();
            } catch ( SQLException e ) {
                e.printStackTrace();
            }
      }
    }
	 return listErgebnis;
    }


	/**
	 * 
	 */
	public static boolean ladenDerTreiberKlasse() {
		boolean erg = false;
		try
		{
		    // Treiberklasse laden
		  Class.forName( "org.hsqldb.jdbcDriver" );
		  erg=true;
		}
		catch ( ClassNotFoundException e )
		{
		  System.err.println( "Treiberklasse nicht gefunden!" );
		  
		}
		return erg;
	}

	

	public void testSQLAusfuehren(Connection con) throws SQLException {
		TestSQL tsql=new TestSQL(con.createStatement(),con,"SELECT c.* FROM Customer c");
		tsql.testSqlAusf�hren();
	}
	
	public boolean verbindungAufgebaut (Connection con) throws SQLException{
		if(con!=null){
			return true;
		}
		return false;
	}

	
    public static void main(String[] args)
    {
        new DBConnector();
    }
    
    public Connection getCon() {
 		return con;
 	}
    public boolean verbindungsaufbauTesten(String connection) throws ClassNotFoundException, SQLException{
    	
    	  try
    	    {
    	        // Treiberklasse laden
    	      Class.forName( "org.hsqldb.jdbcDriver" );
    	    }
    	    catch ( ClassNotFoundException e )
    	    {
    	   throw new ClassNotFoundException();
    	    }
    	    try
    	    {
    	      con = DriverManager.getConnection(connection );
    	      }
    	      
  	    catch ( SQLException e )
    	    {
    	  throw new SQLException();
    	    }
    	return true;
    }
    public boolean verbindungsaufbauTesten(String one, String two, String three) throws ClassNotFoundException, SQLException{
    	
  	  try
  	    {
  	        // Treiberklasse laden
  	      Class.forName( "org.hsqldb.jdbcDriver" );
  	    }
  	    catch ( ClassNotFoundException e )
  	    {
  	   throw new ClassNotFoundException();
  	    }
  	    try
  	    {
  	      con = DriverManager.getConnection(one,two,three );
  	      }
  	      
	    catch ( SQLException e )
  	    {
  	  throw new SQLException();
  	    }
  	return true;
  }

 	public void setCon(Connection con) {
 		this.con = con;
 	}
}
