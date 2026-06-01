/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.example.centerdpo.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {
     public static Connection connectDB() throws SQLException, ClassNotFoundException {
        String url = "jdbc:postgresql://localhost:5432/dpo_baryshnikov"; // ваша БД
        String user = "postgres";
        String password = "";
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        return con;
    }
}
