/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vorg.vTech.servlets;

import com.vorg.vTech.DAO.RegisterDAO;
import com.vorg.vTech.entity.Register;
import com.vorg.vTech.helper.Connect;
import com.vorg.vTech.helper.Message;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author vishnu
 */
@MultipartConfig
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String ch = request.getParameter("check");
        String name = request.getParameter("userName");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String gender = request.getParameter("gender");

       
        if (request.getParameter("check") == null
                || request.getParameter("userName") == null
                || request.getParameter("email") == null
                || request.getParameter("pass") == null
                || request.getParameter("gender") == null) {

             Message msg = new Message("All feilds are Mandatory", "error1", "alert-danger");
            HttpSession hs = request.getSession();
            hs.setAttribute("error1", msg);
            response.sendRedirect("Register.jsp");
            return;

        }

        boolean value = false;
        Register r = new Register(name, email, password, gender);

        if (ch == null) {
            out.print(ch);
        } else {
            RegisterDAO registerDAO = new RegisterDAO(Connect.getConnection());
            value = registerDAO.addUser(r);
        }
        System.out.println(value);
        if (value) {

            Message msg = new Message("Sucessfully registered please logIn", "success", "alert-success ");
            HttpSession hs = request.getSession();
            hs.setAttribute("success", msg);
            response.sendRedirect("Register.jsp");

        } else {
            Message msg = new Message("Alredy exists ", "error", "alert-danger");
            HttpSession hs = request.getSession();
            hs.setAttribute("error", msg);
            response.sendRedirect("Register.jsp");

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
