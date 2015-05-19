/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Util.DatabaseConnector;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Belthazod
 */
@WebServlet(name = "UpdateClassStatus", urlPatterns = {"/UpdateClassStatus"})
public class UpdateClassStatus extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String classCode = request.getParameter("classCode");
        String status = request.getParameter("optradio");
        String semester = request.getParameter("semester");
        DatabaseConnector dbConnector = DatabaseConnector.getInstance();
        try{
        dbConnector.update("UPDATE class SET status = ? WHERE classcode = ? AND semester_id = ?", new String[]{status, classCode, semester});
        response.sendRedirect("viewClass.jsp?semester=" + semester + "&code=" + classCode +"&update=success");
        }catch(SQLException sqlE){
            sqlE.printStackTrace();
            System.out.print("Something went wrong with the database");
        }
    }

}
