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
          
    try
    {
        // Treiberklasse laden
      Class.forName( "org.hsqldb.jdbcDriver" );
    }
    catch ( ClassNotFoundException e )
    {
      System.err.println( "Treiberklasse nicht gefunden!" );
      return;
    }
  
    try
    {
      con = DriverManager.getConnection( 
              "jdbc:hsqldb:file:C:\\Users\\Andreas\\Downloads\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DBTreiber; shutdown=true", "heinen", "FDSha388" );
      
      //Sql zusammenbauen und ausführen
//     testSQLAusfuehren(con);
//      LoginSQL lsql= new LoginSQL(con.createStatement(),con, "Select l.* from login l");
//      lsql.sqlAusführen("");
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
          
    try
    {
        // Treiberklasse laden
      Class.forName( "org.hsqldb.jdbcDriver" );
    }
    catch ( ClassNotFoundException e )
    {
      System.err.println( "Treiberklasse nicht gefunden!" );
      return false;
    }
  
    try
    {
      con = DriverManager.getConnection( 
              "jdbc:hsqldb:file:C:\\Users\\Andreas\\Downloads\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DBTreiber; shutdown=true", "heinen", "FDSha388" );
      
      //Sql zusammenbauen und ausführen
//     testSQLAusfuehren(con);
      LoginSQL lsql= new LoginSQL(con.createStatement(),con, "Select l.passwort from login l where l.benutzername ='" +benutzerName+ "'");
  	ergebnis =  lsql.sqlAusführen(passwort);
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

	public boolean registrierung(String benutzerName, String passwort, String eMail)
    {
		boolean ergebnis = false;
          
    try
    {
        // Treiberklasse laden
      Class.forName( "org.hsqldb.jdbcDriver" );
    }
    catch ( ClassNotFoundException e )
    {
      System.err.println( "Treiberklasse nicht gefunden!" );
      return false;
    }
  
    try
    {
      con = DriverManager.getConnection( 
              "jdbc:hsqldb:file:C:\\Users\\Andreas\\Downloads\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DBTreiber; shutdown=true", "heinen", "FDSha388" );
      
      //Sql zusammenbauen und ausführen
//     testSQLAusfuehren(con);
      LoginSQL nrSql = new LoginSQL(con.createStatement(), con, "Select max(Id) from login");
     int nr= nrSql.sqlNr()+1;
      LoginSQL lsql= new LoginSQL(con.createStatement(),con, "INSERT INTO LOGIN( ID, BENUTZERNAME, PASSWORT, NACHNAME, VORNAME, EMAIL) VALUES ( "+ nr+", '"+benutzerName+"','"+passwort+"','"+benutzerName+"','"+benutzerName+"','"+eMail+"')");
      lsql.sqlAusführen();
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
	
	public static ArrayList<ArrayList<String>> sucheTankstellenSQL(String ort)
    {
		 ArrayList<ArrayList<String>> listErgebnis = new ArrayList<ArrayList<String>>();
    try
    {
        // Treiberklasse laden
      Class.forName( "org.hsqldb.jdbcDriver" );
    }
    catch ( ClassNotFoundException e )
    {
      System.err.println( "Treiberklasse nicht gefunden!" );
      
    }
  
    try
    {
      con = DriverManager.getConnection( 
              "jdbc:hsqldb:file:C:\\Users\\Andreas\\Downloads\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DBTreiber; shutdown=true", "heinen", "FDSha388" );
      
      //Sql zusammenbauen und ausführen
      //testSQLAusfuehren(con);
      SuchenSQL lsql= new SuchenSQL(con.createStatement(),con, "Select t.* from tankstelle t where t.ort='" +ort+ "'");
     
  	  listErgebnis =  lsql.sqlAusfuehren();
  	  if(!listErgebnis.isEmpty()){
  		  System.out.println(listErgebnis);
  	
  	  }
  
  	  
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

	

	public void testSQLAusfuehren(Connection con) throws SQLException {
		TestSQL tsql=new TestSQL(con.createStatement(),con,"SELECT c.* FROM Customer c");
		tsql.testSqlAusführen();
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