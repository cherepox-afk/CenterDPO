/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.example.centerdpo.view;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import org.example.centerdpo.controller.Controller;
import javax.swing.border.EmptyBorder;

public class FormUserAdd extends JFrame {
    private JTextField loginField;
    private JPasswordField passwordField;
    private JComboBox<String> roleCombo;

    public FormUserAdd() {
        initComponents();
        setLocationRelativeTo(null);
    }

    private void initComponents() {
        setTitle("Добавление пользователя");
        setResizable(false);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);

        // Основная панель с отступами и GridBagLayout для гибкого расположения
        JPanel mainPanel = new JPanel(new GridBagLayout());
        mainPanel.setBorder(new EmptyBorder(20, 25, 20, 25));
        setContentPane(mainPanel);

        // Шрифты
        Font labelFont = new Font("Arial", Font.PLAIN, 14);
        Font fieldFont = new Font("Arial", Font.PLAIN, 14);
        Font buttonFont = new Font("Arial", Font.PLAIN, 14);

        // Предпочтительный размер для текстовых полей и комбобокса: ширина 200, высота 24
        Dimension fieldSize = new Dimension(200, 24);
        // Размер кнопок
        Dimension buttonSize = new Dimension(101, 24);

        // Вспомогательный класс для настройки GridBagConstraints
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(5, 5, 5, 5); // отступы между ячейками

        // 1. Логин
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.anchor = GridBagConstraints.LINE_END;
        JLabel loginLabel = new JLabel("Логин:");
        loginLabel.setFont(labelFont);
        mainPanel.add(loginLabel, gbc);

        gbc.gridx = 1;
        gbc.anchor = GridBagConstraints.LINE_START;
        loginField = new JTextField();
        loginField.setFont(fieldFont);
        loginField.setPreferredSize(fieldSize);
        mainPanel.add(loginField, gbc);

        // 2. Пароль
        gbc.gridx = 0;
        gbc.gridy = 1;
        gbc.anchor = GridBagConstraints.LINE_END;
        JLabel passLabel = new JLabel("Пароль:");
        passLabel.setFont(labelFont);
        mainPanel.add(passLabel, gbc);

        gbc.gridx = 1;
        gbc.anchor = GridBagConstraints.LINE_START;
        passwordField = new JPasswordField();
        passwordField.setFont(fieldFont);
        passwordField.setPreferredSize(fieldSize);
        mainPanel.add(passwordField, gbc);

        // 3. Роль
        gbc.gridx = 0;
        gbc.gridy = 2;
        gbc.anchor = GridBagConstraints.LINE_END;
        JLabel roleLabel = new JLabel("Роль:");
        roleLabel.setFont(labelFont);
        mainPanel.add(roleLabel, gbc);

        gbc.gridx = 1;
        gbc.anchor = GridBagConstraints.LINE_START;
        roleCombo = new JComboBox<>(new String[]{
            "Администратор", "Гость", "Системный администратор"
        });
        roleCombo.setFont(fieldFont);
        roleCombo.setPreferredSize(fieldSize);
        mainPanel.add(roleCombo, gbc);

        // 4. Кнопки на отдельной панели, чтобы сохранить их размер
        JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.CENTER, 20, 0));
        buttonPanel.setOpaque(false); // прозрачный фон

        JButton createBtn = new JButton("Создать");
        createBtn.setFont(buttonFont);
        createBtn.setPreferredSize(buttonSize);
        createBtn.addActionListener(e -> createUser());
        buttonPanel.add(createBtn);

        JButton cancelBtn = new JButton("Отмена");
        cancelBtn.setFont(buttonFont);
        cancelBtn.setPreferredSize(buttonSize);
        cancelBtn.addActionListener(e -> dispose());
        buttonPanel.add(cancelBtn);

        // Помещаем панель с кнопками в основную сетку, занимая две колонки
        gbc.gridx = 0;
        gbc.gridy = 3;
        gbc.gridwidth = 2;
        gbc.anchor = GridBagConstraints.CENTER;
        gbc.insets = new Insets(15, 5, 5, 5); // дополнительный отступ сверху перед кнопками
        mainPanel.add(buttonPanel, gbc);

        // Размер окна подбираем автоматически по содержимому
        pack();

        // Закрытие по крестику
        addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                dispose();
            }
        });
    }

    private void createUser() {
        String login = loginField.getText().trim();
        String password = new String(passwordField.getPassword());
        String roleStr = (String) roleCombo.getSelectedItem();

        Controller c = new Controller();
        if (!c.isValidUserData(login, password)) {
            JOptionPane.showMessageDialog(this,
                "Логин и пароль не должны быть пустыми и не должны содержать пробелы!");
            return;
        }

        JOptionPane.showMessageDialog(this,
            "Пользователь \"" + login + "\" успешно создан с ролью " + roleStr);
        dispose();
    }
}
