/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vorg.vTech.DAO;

import com.vorg.vTech.entity.Register;
import java.sql.*;
import java.util.Calendar;
import java.util.Objects;

/**
 *
 * @author vishnu
 */
public class RegisterDAO {

    private Connection c;

    public RegisterDAO(Connection c) {
        this.c = c;
    }

    public boolean addUser(Register reg) {
        String q = "insert into register(name,email,password,gender)values(?,?,?,?)";
        String q1 = "select * from register where email=?";
        boolean f = false;
        Register r = null;
        try {
            PreparedStatement s = c.prepareStatement(q1);
            s.setString(1, reg.getEmail());
            ResultSet rs = s.executeQuery();

            if (rs.next()) {
                System.out.println("--------------------------------error" + f);

                return f;
            } else {
                System.out.println("--------------------------------success");
                PreparedStatement ps = c.prepareStatement(q);
                ps.setString(1, reg.getName());
                ps.setString(2, reg.getEmail());
                ps.setString(3, reg.getPassword());
                ps.setString(4, reg.getGender());
                ps.executeUpdate();
                
                f = true;

            }
        } catch (Exception e) {

        }
        return f;
    }

    public Register getUser(String email, String pass) {
        String q = "select * from register where email=? and password=?";
        Register r = null;
        try {
            PreparedStatement ps = c.prepareStatement(q);
            ps.setString(1, email);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                r = new Register();
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String emailUser = rs.getString("email");
                String password = rs.getString("password");
                String gender = rs.getString("gender");
                String pic = rs.getString("pic");

                Timestamp t = rs.getTimestamp("rDate", Calendar.getInstance());

                r.setEmail(emailUser);
                r.setName(name);
                r.setGender(gender);
                r.setPassword(password);
                r.setId(id);
                r.setDateTime(t);
                r.setProfilePic(pic);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }

    public boolean editUser(Register user) {
        boolean updateStatus = false;
        try {

            if (Objects.nonNull(user)) {

                String q = "update register set name=?,email=?,password=?,gender=?,pic=? where id=? ";
                PreparedStatement s = c.prepareStatement(q);
                s.setString(1, user.getName());
                s.setString(2, user.getEmail());
                s.setString(3, user.getPassword());
                s.setString(4, user.getGender());
                s.setString(5, user.getProfilePic());
                s.setInt(6, user.getId());
                s.executeUpdate();
                updateStatus = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("====================" + updateStatus);

        return updateStatus;

    }

}
