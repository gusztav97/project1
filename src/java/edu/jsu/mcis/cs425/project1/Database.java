package edu.jsu.mcis.cs425.project1;

import java.sql.ResultSetMetaData;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
//start serverside


public class Database {
    
    private Connection getConnection() {
        
        Connection conn = null;
        
        try {
            
            Context envContext = new InitialContext();
            Context initContext  = (Context)envContext.lookup("java:/comp/env");
            DataSource ds = (DataSource)initContext.lookup("jdbc/db_pool");
            conn = ds.getConnection();
            
        }        
        catch (Exception e) { e.printStackTrace(); }
        
        return conn;

    }
    
    public String getRegistrationList(int sessionid) {
        
        String results = "";
        
        try {
            
            Connection connection = getConnection();
            
            String query = "SELECT * FROM registrations WHERE sessionid = ?";
            
            PreparedStatement pstatement = connection.prepareStatement(query);
            pstatement.setInt(1, sessionid);
            
            boolean hasresults = pstatement.execute();
                
            if ( hasresults ) {
                
                ResultSet resultset = pstatement.getResultSet();
                results += getResultSetTable(resultset);
                
            }

        }
        
        catch (Exception e) { e.printStackTrace(); }
        
        return results;
        
    }
    
    public String getResultSetTable(ResultSet resultset) {
        
        ResultSetMetaData metadata = null;
        
        String table = "";
        String tableheading;
        String tablerow;
        
        String key;
        String value;
        
        try {
            
            System.out.println("*** Getting Query Results ... ");

            metadata = resultset.getMetaData();

            int numberOfColumns = metadata.getColumnCount();
            
            table += "<table border=\"1\">";
            tableheading = "<tr>";
            
            System.out.println("*** Number of Columns: " + numberOfColumns);
            
            for (int i = 1; i <= numberOfColumns; i++) {
            
                key = metadata.getColumnLabel(i);
                
                tableheading += "<th>" + key + "</th>";
            
            }
            
            tableheading += "</tr>";
            
            table += tableheading;
                        
            while(resultset.next()) {
                
                tablerow = "<tr>";
                
                for (int i = 1; i <= numberOfColumns; i++) {

                    value = resultset.getString(i);

                    if (resultset.wasNull()) {
                        tablerow += "<td></td>";
                    }

                    else {
                        tablerow += "<td>" + value + "</td>";
                    }
                    
                }
                
                tablerow += "</tr>";
                
                table += tablerow;
                
            }
            
            table += "</table><br />";

        }
        
        catch (Exception e) {}
        
        return table;
        
    } // End getResultSetTable()
    
}
