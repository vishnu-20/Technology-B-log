package com.vorg.vTech.helper;

import java.sql.*;

/**
 *
 * @author vishnu
 */
public class Connect {

    public static Connection getConnection() {
        String URL = "jdbc:mysql://localhost:3306/vTech";
        String username = "root";
        String password = "root";
        Connection c = null;
        String driver = "com.mysql.cj.jdbc.Driver";
        try {

            if (c == null) {
                Class.forName(driver);
                c = DriverManager.getConnection(URL, username, password);
            }

        } catch (Exception e) {
            e.printStackTrace();

        }
        return c;
    }

}
