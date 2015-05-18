/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Util.DatabaseConnector;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Belthazod
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {
    DatabaseConnector dbConnector = DatabaseConnector.getInstance();
    
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
        try{
            String username = request.getParameter("username");
            String pass = request.getParameter("password");
            ResultSet rs = dbConnector.query("SELECT employee_id, password, department FROM employee");
            boolean userFound = false;
            boolean passwordCorrect = false;
            while(rs.next()){
                String employeeID = rs.getString(1);
                String password = rs.getString(2);
                
                if(employeeID.equals(username)){
                    userFound = true;
                    if(pass.equals(password)){
                        String type = rs.getString(3);
                        System.out.print(type);
                        HttpSession session = request.getSession();
                        session.setAttribute("UserName", username);
                        session.setAttribute("Type", type);
                        passwordCorrect = true;
                        break;
                    }
                }
            }
            if(!userFound){
                response.sendRedirect("index.jsp?loginfailed=user");
            }else if(!passwordCorrect){
                response.sendRedirect("index.jsp?loginfailed=password");
            }else{
                response.sendRedirect("main.jsp");
            }
        }catch(SQLException sqlE){
            sqlE.printStackTrace();
        }
    }


}
