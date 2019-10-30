/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.jsu.mcis.cs425.project1;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

/**
 *
 * @author guszt
 */
public class Registration extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            
            if ( request.getParameter("sessionid") != null ) {
                
                Database db = new Database();
            
                int sessionid = Integer.parseInt( request.getParameter("sessionid") );

                out.println( db.getRegistrationList(sessionid) );
                
            }

        }
        catch (Exception e) { e.printStackTrace(); }        
                
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
        
        
        response.setContentType("application/json;charset=UTF-8");
        
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String displayname = request.getParameter("displayname");
        String sessionid = request.getParameter("sessionid");
        
        //RETURN R + 0000 + SESSION ID AS JSON STRING
        
        String registrationcode = "R" + "0000" + sessionid;
        
        JSONObject jsonObject1 = new JSONObject();
        jsonObject1.put("name", registrationcode);
        String myString = jsonObject1.toString();
        
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
