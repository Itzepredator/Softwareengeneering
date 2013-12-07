package de.hsqldb.Datenbank;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
public class DBConnector
{
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
  
    Connection con = null;

    try
    {
      con = DriverManager.getConnection( 
              "jdbc:hsqldb:file:C:\\Users\\Andreas\\Downloads\\hsqldb-2.3.1\\hsqldb-2.3.1\\hsqldb\\DBTreiber; shutdown=true", "heinen", "FDSha388" );
      
      //Sql zusammenbauen und ausführen
      //TestSQL tsql=new TestSQL(con.createStatement(),con,"SELECT c.* FROM Customer c");
      LoginSQL lsql= new LoginSQL(con.createStatement(),con, "Select l.* from login l");
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
    }

	
    public static void main(String[] args)
    {
        new DBConnector();
    }
}