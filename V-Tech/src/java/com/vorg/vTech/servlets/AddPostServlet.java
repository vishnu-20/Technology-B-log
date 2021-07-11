/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vorg.vTech.servlets;

import com.vorg.vTech.DAO.PostDAO;
import com.vorg.vTech.entity.Post;
import com.vorg.vTech.entity.Register;
import com.vorg.vTech.helper.Connect;
import com.vorg.vTech.helper.FileHelper;
import com.vorg.vTech.helper.Message;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class AddPostServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        
        HttpSession hs=request.getSession();
        Register r= (Register)hs.getAttribute("currentUser");
        
        String title=request.getParameter("ptitle");
        String content=request.getParameter("content");
        int cat=Integer.parseInt(request.getParameter("cat"));
      
        Part i=request.getPart("imageValue");
        String image=i.getSubmittedFileName();
        
        Post post=new Post(title,content,image,cat,r.getId());
       
        PostDAO postDAO=new PostDAO(Connect.getConnection());
        boolean status= postDAO.addPost(post);
       
        if (status) {
            
            String path=request.getRealPath("/"+"img"+File.separator+post.getImage());
           if (FileHelper.save(i.getInputStream(), path)) {

                Message msg = new Message("Post added sucessfully", "success", "alert-success");
                HttpSession session = request.getSession();
                session.setAttribute("msg", msg);
                response.sendRedirect("Profile.jsp");
            }
            
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
