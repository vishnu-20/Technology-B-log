package com.vorg.vTech.entity;

import java.sql.*;

/**
 *
 * @author vishnu
 */
public class Register {

    private int id;
    private String name;
    private String email;
    private String password;
    private String gender;
    private Timestamp dateTime;
    private String profilePic;

    public Register(String name, String email, String password, String gender) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
//        this.dateTime = dateTime;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(String profilePic) {
        this.profilePic = profilePic;
    }

    public Register() {
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public String getGender() {
        return gender;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

}
