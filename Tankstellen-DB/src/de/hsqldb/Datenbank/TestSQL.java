package de.hsqldb.Datenbank;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestSQL {
	Statement stmt;
	Connection con;
	String sql="";
	
	
	
	public TestSQL(Statement stmt, Connection con, String sql) {
		super();
		this.stmt = stmt;
		this.con = con;
		this.sql = sql;
	}



	public void testSqlAusführen() throws SQLException {
		Statement stmt = con.createStatement();
  
		  // Alle Kunden ausgeben
		  ResultSet rs = stmt.executeQuery(this.sql);
  
		  while ( rs.next() )
		  {
		    String id = rs.getString(1);
		    String firstName = rs.getString(2);
		    String lastName = rs.getString(3);
		    String street = rs.getString(4);
		    String town = rs.getString(5);
		    System.out.println(id + ", " + firstName + " " + lastName + ", " + street+ ", " + town);
		  }
		   
		  // Resultset schließen
		  rs.close();
  
		  // Statement schließen
		  stmt.close();
	}
     

}
