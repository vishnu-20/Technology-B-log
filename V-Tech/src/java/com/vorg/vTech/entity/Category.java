/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vorg.vTech.entity;

/**
 *
 * @author vishnu
 */
public class Category {

    private int cId;
    private String name;
    private String details;

    public int getcId() {
        return cId;
    }

    public String getName() {
        return name;
    }

    public String getDetails() {
        return details;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDetails(String details) {
        this.details = details;
    }

}
