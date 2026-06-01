/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.example.centerdpo.view;

import javax.swing.*;
import java.awt.*;
import javax.swing.border.EmptyBorder;

public class FormSysAdmin extends JFrame {
    public FormSysAdmin() {
        initComponents();
    }

    private void initComponents() {
        setTitle("Окно администратора системы");
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setSize(600, 250);
        setLocationRelativeTo(null);
        setResizable(false);
        setLayout(new FlowLayout(FlowLayout.CENTER, 10, 10));

        JPanel menuPanel = new JPanel(new FlowLayout(FlowLayout.LEFT, 10, 10));
        menuPanel.setBorder(new EmptyBorder(10, 20, 10, 20));

        String[] menuItems = {"Преподаватели", "Студенты", "Программы", "Курсы", "Выход"};
        int count = 0;
        for (String item : menuItems) {
            JButton menuButton = new JButton(item);
            menuButton.setSize(80, 30);
            menuButton.setFont(new Font("Arial", Font.PLAIN, 14));
            if (count == 4) {
                menuButton.addActionListener(e -> this.dispose());
            }
            menuPanel.add(menuButton);
            count++;
        }
        add(menuPanel);

        JPanel tablePanel = new JPanel(new BorderLayout(10, 10));
        tablePanel.setBorder(BorderFactory.createTitledBorder("Пользователи"));

        JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JButton userAddButton = new JButton("Добавить пользователя");
        userAddButton.setFont(new Font("Arial", Font.BOLD, 14));
        userAddButton.addActionListener(e -> {
            new FormUserAdd().setVisible(true);
        });
        JButton userDeleteButton = new JButton("Удалить пользователя");
        userDeleteButton.setFont(new Font("Arial", Font.BOLD, 14));

        buttonPanel.add(userAddButton);
        buttonPanel.add(userDeleteButton);
        tablePanel.add(buttonPanel, BorderLayout.NORTH);
        add(tablePanel);
    }
}
