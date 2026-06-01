/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.example.centerdpo.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Controller {
    public boolean isEmptyAccept(String login, String password) {
        return !(login.isEmpty() || password.isEmpty());
    }

    public int getAccept(String login, String password) {
 
        String sql = "SELECT u.role_id FROM users u WHERE u.login = ? AND u.password = ?";

        try (Connection conn = ConnectionDB.connectDB();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, login);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("role_id");
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Ошибка при проверке пользователя: " + e.getMessage());
        }
        return 0;  
        
//        String[][] users = {
//            {"admin", "111", "1"},
//            {"guest", "222", "2"},
//            {"sysadmin", "333", "3"}
//        };
//        for (String[] u : users) {
//            if (u[0].equals(login) && u[1].equals(password))
//                return Integer.parseInt(u[2]);
//        }
//        return 0;
    }
    
    public boolean isValidUserData(String login, String password) {
        if (login.isEmpty() || password.isEmpty()) {
            return false;
        }
        return !(login.contains(" ") || password.contains(" "));
    }
}
