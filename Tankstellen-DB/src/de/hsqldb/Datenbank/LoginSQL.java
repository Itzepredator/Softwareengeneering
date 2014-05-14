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





	public boolean sqlAusf�hren(String passwort) throws SQLException {
	Statement stmt = con.createStatement();
	boolean r=false;
	if(!passwort.isEmpty()){
	ResultSet rs = stmt.executeQuery(this.sql);
	if(rs.next() && rs.getString("passwort") != null) {
		r= rs.getString("passwort").toString().equalsIgnoreCase(passwort);
		}
	}
	  // Statement schlie�en
	  stmt.close();
	  
	  return r;
}
	public boolean sqlAusf�hren() throws SQLException {
		Statement stmt = con.createStatement();
		boolean e = false;
		if(!e){
			stmt.executeUpdate(this.sql);
			  // Statement schlie�en
			  stmt.close();
			  e =true;
		}
			return e;
	}
	
	
	public int sqlNr() throws SQLException {
		Statement stmt = con.createStatement();
		 int a =9999;
		//Update der Benutzerdaten
		 ResultSet rs = stmt.executeQuery(this.sql);
		 while(rs.next()){
		 a =Integer.valueOf(rs.getString("id")) ;
		 }
		  // Statement schlie�en
		  stmt.close();
		 
		  return a;
	}
	
	
	public void sqlAusf�hrenTest() throws SQLException {
		Statement stmt = con.createStatement();
			stmt.executeUpdate(this.sql);
			stmt.executeUpdate(this.sql);
}
	
	
}
