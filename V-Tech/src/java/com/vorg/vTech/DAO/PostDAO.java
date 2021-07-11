/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vorg.vTech.DAO;

import com.vorg.vTech.entity.Category;
import com.vorg.vTech.entity.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author vishnu
 */
public class PostDAO {

    private Connection c;

    public PostDAO(Connection c) {
        this.c = c;
    }

    public List<Category> getAllCat() {

        List<Category> catList = new ArrayList<>();

        String q = " select * from category";

        try {

            Statement s = c.createStatement();
            ResultSet rs = s.executeQuery(q);

            while (rs.next()) {
                Category category = new Category();
                String name = rs.getString("name");
                String discription = rs.getString("discription");
                int id = rs.getInt("cid");
                category.setDetails(discription);
                category.setcId(id);
                category.setName(name);

                catList.add(category);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return catList;

    }

    public boolean addPost(Post post) {
        boolean status = false;
        String q = "insert into posts(Ptitle,Pcontent,pimage,cid,userId) values(?,?,?,?,?)";

        try {
            System.out.println("---------------inside add post-----------");

            PreparedStatement ps = c.prepareStatement(q);

            ps.setString(1, post.getTitle());

            ps.setString(2, post.getContent());

            ps.setString(3, post.getImage());

            ps.setInt(4, post.getcId());
            ps.setInt(5, post.getUserId());

            ps.executeUpdate();

            status = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<Post> getAllPost() {

        List<Post> pList = new ArrayList<>();

        String q = " select * from posts";

        try {

            Statement s = c.createStatement();
            ResultSet rs = s.executeQuery(q);

            while (rs.next()) {

                int Pid = rs.getInt("Pid");
                String Ptitle = rs.getString("Ptitle");
                String Pcontent = rs.getString("Pcontent");
                String pimage = rs.getString("pimage");
                Timestamp pdate = rs.getTimestamp("pdate", Calendar.getInstance());
                int cid = rs.getInt("cid");
                int userId = rs.getInt("userId");

                Post post = new Post(Pid, Ptitle, Pcontent, pimage, pdate, cid, userId);

                pList.add(post);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return pList;

    }

    public List<Post> getPostByCatId(int catId) {

        List<Post> pList = new ArrayList<>();
        System.out.println("------------------enter in the getpostBy Id -----------------");
        String q = " select * from posts where cid=?";

        try {

            PreparedStatement s = c.prepareStatement(q);
            s.setInt(1, catId);
            ResultSet rs = s.executeQuery();

            while (rs.next()) {

                int Pid = rs.getInt("Pid");
                String Ptitle = rs.getString("Ptitle");
                String Pcontent = rs.getString("Pcontent");
                String pimage = rs.getString("pimage");
                Timestamp pdate = rs.getTimestamp("pdate", Calendar.getInstance());
                int cid = catId;
                int userId = rs.getInt("userId");

                Post post = new Post(Pid, Ptitle, Pcontent, pimage, pdate, cid, userId);

                pList.add(post);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return pList;

    }

}
