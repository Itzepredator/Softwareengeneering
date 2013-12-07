package de.hsqldb.Datenbank;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginSQL {
	Statement stmt;
	Connection con;
	String sql="";
	
	
	
	public LoginSQL(Statement stmt, Connection con, String sql) {
		super();
		this.stmt = stmt;
		this.con = con;
		this.sql = sql;
	}



	public void sqlAusführen() throws SQLException {
		Statement stmt = con.createStatement();
  
		  // Alle Kunden ausgeben
		  ResultSet rs = stmt.executeQuery(this.sql);
  
		  while ( rs.next() )
		  {
		    String id = rs.getString(1);
		    String benutzername = rs.getString(2);
		    String passwort = rs.getString(3);
		    String nachname = rs.getString(4);
		    String vorname = rs.getString(5);
		    String email = rs.getString(6);
		    System.out.println(id + ", " + benutzername + " " + passwort + ", " + nachname+ ", " + vorname+", " + email);
		  }
		   
		  // Resultset schließen
		  rs.close();
  
		  // Statement schließen
		  stmt.close();
	}
}
