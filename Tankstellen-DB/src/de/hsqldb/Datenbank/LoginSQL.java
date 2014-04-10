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



	public boolean sqlAusführen(String passwort) throws SQLException {
		Statement stmt = con.createStatement();
		boolean r=false;
		if(!passwort.isEmpty()){
		ResultSet rs = stmt.executeQuery(this.sql);
		r= rs.getString(3).equalsIgnoreCase(passwort);
		}else{
		//Update der Benutzerdaten
		stmt.executeUpdate(this.sql);
		r= true;
		}
		  // Statement schließen
		  stmt.close();
		  
		  return r;
	}
	
	
	public int sqlNr() throws SQLException {
		Statement stmt = con.createStatement();
		
		//Update der Benutzerdaten
		 ResultSet rs = stmt.executeQuery(this.sql);
		 
		  // Statement schließen
		  stmt.close();
		  
		  return Integer.valueOf(rs.getString(1));
	}
	
}
