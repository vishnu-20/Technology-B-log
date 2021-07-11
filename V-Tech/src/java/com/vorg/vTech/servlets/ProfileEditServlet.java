/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vorg.vTech.servlets;

import com.vorg.vTech.DAO.RegisterDAO;
import com.vorg.vTech.entity.Register;
import com.vorg.vTech.helper.Connect;
import com.vorg.vTech.helper.FileHelper;
import com.vorg.vTech.helper.Message;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author vishnu
 */
@MultipartConfig(maxFileSize = 16178468)
public class ProfileEditServlet extends HttpServlet {

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
        System.out.println("-----------------------------------------");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("user_name");
        String pass = request.getParameter("password");
        Part part = request.getPart("file");
        String pic = part.getSubmittedFileName();

        HttpSession s = request.getSession();
        Register user = (Register) s.getAttribute("currentUser");
        user.setName(name);
        user.setPassword(pass);
        String pathOld = user.getProfilePic();

        user.setProfilePic(pic);
        RegisterDAO updateUser = new RegisterDAO(Connect.getConnection());
        boolean status = updateUser.editUser(user);

        if (status) {

            String path = request.getRealPath("/" + "img" + File.separator + user.getProfilePic());
            String pathOldFile = request.getRealPath("/" + "img" + File.separator + pathOld);

            if(!pathOld.equals("default.png")){
            FileHelper.deleteFile(pathOldFile);
            }
            if (FileHelper.save(part.getInputStream(), path)) {
                
                Message msg = new Message("Profile Updated SuccessFully", "success", "alert-success");
                HttpSession session = request.getSession();
                session.setAttribute("msg", msg);
                response.sendRedirect("Profile.jsp");
            }

        } else {
            Message msg = new Message("Something went wrong", "error", "alert-danger");
            HttpSession session = request.getSession();
            session.setAttribute("msg", msg);
            response.sendRedirect("Profile.jsp");
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
