/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vorg.vTech.entity;

import java.sql.*;


public class Post {
    private int postId;
    private String title;
    private String content;
    private String image;
   private Timestamp dateTime;
     private int cId;
     private int userId;

    public Post(String title, String content, String image,  int cId,int  userId) {
        this.title = title;
        this.content = content;
        this.image = image;
        this.userId = userId;
        this.cId = cId;
    }

    public Post(int postId, String title, String content, String image, Timestamp dateTime, int cId, int userId) {
        this.postId = postId;
        this.title = title;
        this.content = content;
        this.image = image;
        this.dateTime = dateTime;
        this.cId = cId;
        this.userId = userId;
    }

    public Post() {
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getUserId() {
        return userId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }
     
     

    public int getPostId() {
        return postId;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public String getImage() {
        return image;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public int getcId() {
        return cId;
    }
     
}
