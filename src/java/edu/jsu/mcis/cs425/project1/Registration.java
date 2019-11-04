/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.jsu.mcis.cs425.project1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        
        PrintWriter out = response.getWriter();
        
        try {
            Database db = new Database();
            
            out.println(db.register(request.getParameter("firstname"), request.getParameter("lastname"), request.getParameter("displayname"), Integer.parseInt( request.getParameter("session"))));
            
        } 
        catch (SQLException e) { 
            e.printStackTrace();
       } 
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
