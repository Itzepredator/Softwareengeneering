package de.hsqldb.Datenbank;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
 
public class DBConnector
{
	private static Connection con=null;
	private String benutzer ="";
	private String passwort ="";
	private String email ="";
	private String vorname ="";
	private String nachname ="";
	private boolean login =false;
	private boolean registrierung =false;
	private String ort="";
	private String entfernung ="";
	private String sorte="";
	private String tankstelle="";
	private static ArrayList<ArrayList<String>> tankstellenList = new ArrayList<ArrayList<String>>();
 




	public DBConnector()
    { 
		sucheAlleTankstellenSQL();
    }


	public boolean loginCheck(String benutzerName, String passwort)
    {
		boolean ergebnis = false;
          
	     ergebnis = ladenDerTreiberKlasse();
  
    try
    {
      con = DriverManager.getConnection( 
    		  "jdbc:hsqldb:file:C:\\Users\\Andreas\\Documents\\HSQLDB\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DB; shutdown=true", "dbuser", "dbuser" );

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

	public boolean registrierung(String benutzerName, String passwort, String nachname, String vorname, String eMail)
    {
		boolean ergebnis = false;
          
		ergebnis= ladenDerTreiberKlasse();
		   
  
    try
    {
      con = DriverManager.getConnection( 
    		  "jdbc:hsqldb:file:C:\\Users\\Andreas\\Documents\\HSQLDB\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DB; shutdown=true", "dbuser", "dbuser" );
      
      //Sql zusammenbauen und ausführen
//     testSQLAusfuehren(con);

      LoginSQL lsql1= new LoginSQL(con.createStatement(),con, "select max(id) as id from login;");
      int id= lsql1.sqlNr()+1;
      
      
      LoginSQL lsql= new LoginSQL(con.createStatement(),con, "INSERT INTO LOGIN (ID, BENUTZERNAME, PASSWORT, NACHNAME, VORNAME, EMAIL) VALUES ( "+id+",'"+benutzerName+"','"+passwort+"','"+nachname+"','"+vorname+"','"+eMail+"');");
     ergebnis= lsql.sqlAusführen();
     con.commit();

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
	
	public static ArrayList<ArrayList<String>> sucheAlleTankstellenSQL()
    { ArrayList<ArrayList<String>> listErgebnis = new ArrayList<ArrayList<String>>();
		boolean ergebnis = false;
     ergebnis = ladenDerTreiberKlasse();
 
  
    try
    {
      con = DriverManager.getConnection( 
    		  "jdbc:hsqldb:file:C:\\Users\\Andreas\\Documents\\HSQLDB\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DB; shutdown=true", "dbuser", "dbuser" );
      
      //Sql zusammenbauen und ausführen
      //testSQLAusfuehren(con);
      String sql = "";
      		 
      		 sql += "Select t.* from tankstelle t where 1=1";
      
      SuchenSQL lsql= new SuchenSQL(con.createStatement(),con, sql);
     
      listErgebnis=lsql.sqlAusfuehren();
      for(ArrayList<String> l : listErgebnis){
    	  for(String l1: l){
    		  l1.trim();
    	  }
      }
      
      tankstellenList=listErgebnis;
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

	
	public static ArrayList<ArrayList<String>> sucheTankstelleSQL(String ort, String sorte)
    { ArrayList<ArrayList<String>> listErgebnis = new ArrayList<ArrayList<String>>();
		boolean ergebnis = false;
     ergebnis = ladenDerTreiberKlasse();
 
  
    try
    {
      con = DriverManager.getConnection( 
    		  "jdbc:hsqldb:file:C:\\Users\\Andreas\\Documents\\HSQLDB\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DB; shutdown=true", "dbuser", "dbuser" );
      
      //Sql zusammenbauen und ausführen
      //testSQLAusfuehren(con);
      String sql = "";
      		 
      		 sql += "Select t.* from tankstelle t where 1=1 ";
      		if(!ort.isEmpty()){
      		sql += "and t.name like ('%" +ort+ "%') ";
      		sql += "or t.Strasse like ('%" +ort+ "%') ";
      		sql += "or t.ort like ('%" +ort+ "%') ";
      		sql += "or t.plz like ('%" +ort+ "%') ";}
      
      SuchenSQL lsql= new SuchenSQL(con.createStatement(),con, sql);
     
      listErgebnis=lsql.sqlAusfuehren();
      for(ArrayList<String> l : listErgebnis){
    	  for(String l1: l){
    		  l1.trim();
    	  }
      }
      tankstellenList=listErgebnis;
//      System.out.println(listErgebnis);
     
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
			Class.forName("org.hsqldb.jdbcDriver");
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

    private void loescheBenutzerDatenAusSpeicher(){
    	benutzer ="";
    	passwort ="";
    	email ="";
    	vorname ="";
    	nachname ="";
    }
    
 	public void setCon(Connection con) {
 		this.con = con;
 	}

	public String getBenutzer() {
		return benutzer;
	}


	public void setBenutzer(String benutzer) {
		//System.out.println(benutzer);
		this.benutzer = benutzer;
	}


	public String getPasswort() {
		return passwort;
	}


	public void setPasswort(String passwort) {
		//System.out.println(passwort);
		this.passwort = passwort;
	}
	

	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		//	System.out.println(email);
		this.email = email;
	}
	



	public boolean isLogin() {
		if(!getBenutzer().isEmpty() && !getPasswort().isEmpty()){
		return loginCheck(getBenutzer(), getPasswort());
		}else {
			return false;
		}
	}


	public void setLogin(boolean login) {
		this.login = login;
	}

	public boolean isRegistrierung() {
		//System.out.println("isRegistrierung");
		if(!getBenutzer().isEmpty() && !getPasswort().isEmpty() && !getEmail().isEmpty()){
			return registrierung(getBenutzer(), getPasswort(), getNachname(), getVorname(), getEmail());
			}else {
				return false;
			}
	}


	public void setRegistrierung(boolean registrierung) {
		this.registrierung = registrierung;
	}

	public String getVorname() {
		return vorname;
	}


	public void setVorname(String vorname) {
		this.vorname = vorname;
	}


	public String getNachname() {
		return nachname;
	}

	public void setNachname(String nachname) {
		this.nachname = nachname;
	}
	
	public void setWerteZurueck(String wert){
	     loescheBenutzerDatenAusSpeicher();
	}
	


	public String getOrt() {
		return ort;
	}


	public void setOrt(String ort) {
		this.ort = ort;
	}


	public String getEntfernung() {
		return entfernung;
	}


	public void setEntfernung(String entfernung) {
		this.entfernung = entfernung;
	}


	public String getSorte() {
		return sorte;
	}


	public void setSorte(String sorte) {
		this.sorte = sorte;
		sucheTankstelleSQL(getOrt(), getSorte());
	}


	public String getTankstelle() {
		return tankstelle;
	}


	public void setTankstelle(String tankstelle) {
		this.tankstelle = tankstelle;
	}
	

	public ArrayList<ArrayList<String>> getTankstellenList() {
		return tankstellenList;
	}


	public void setTankstellenList(ArrayList<ArrayList<String>> testList) {
		this.tankstellenList = testList;
	}


}
