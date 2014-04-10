package de.hsqldb.Datenbank;

import java.awt.List;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class SuchenSQL {
	Statement stmt;
	Connection con;
	String sql="";
	
	
	
	public SuchenSQL(Statement stmt, Connection con, String sql) {
		super();
		this.stmt = stmt;
		this.con = con;
		this.sql = sql;
	}



	public ArrayList<ArrayList> sqlAusfuehren() throws SQLException {
		Statement stmt = con.createStatement();
  
		  // Alle Kunden ausgeben
		  ResultSet rs = stmt.executeQuery(this.sql);
		  ArrayList<String> list = new ArrayList<String>();
		  ArrayList<ArrayList> trefferListe = new ArrayList<ArrayList>();
		  while ( rs.next() )
		  {
		   list.add(rs.getString(1));
		   list.add(rs.getString(2));
		   list.add(rs.getString(3));
		   list.add(rs.getString(4));
		   list.add(rs.getString(5));
		   list.add(rs.getString(6));
		   list.add(rs.getString(7));
		   list.add(rs.getString(8));
		   list.add(rs.getString(9));
		   list.add(rs.getString(10));
		   
		   trefferListe.add(list);
		   
		   System.out.println(trefferListe);
		  }
		   
		  // Resultset schlie�en
		  rs.close();
  
		  // Statement schlie�en
		  stmt.close();
		  
		  return trefferListe;
	}
     

}
