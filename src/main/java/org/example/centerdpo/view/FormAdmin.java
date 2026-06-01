/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package org.example.centerdpo.view;

import java.awt.Color;

public class FormAdmin extends javax.swing.JFrame {

    public FormAdmin() {
        initComponents();
        setLocationRelativeTo(null);
        getContentPane().setBackground(Color.WHITE);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jButtonAddStudent = new javax.swing.JButton();
        jButtonAddTeacher = new javax.swing.JButton();
        jButtonAddProgram = new javax.swing.JButton();
        jButtonExit = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Окно администратора центра");
        setResizable(false);
        setSize(new java.awt.Dimension(800, 600));

        jButtonAddStudent.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jButtonAddStudent.setText("Добавить студента");
        jButtonAddStudent.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonAddStudentActionPerformed(evt);
            }
        });

        jButtonAddTeacher.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jButtonAddTeacher.setText("Добавить преподавателя");
        jButtonAddTeacher.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonAddTeacherActionPerformed(evt);
            }
        });

        jButtonAddProgram.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jButtonAddProgram.setText("Добавить программу");
        jButtonAddProgram.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonAddProgramActionPerformed(evt);
            }
        });

        jButtonExit.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jButtonExit.setText("Выход");
        jButtonExit.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonExitActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(25, 25, 25)
                .addComponent(jButtonAddStudent, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 45, Short.MAX_VALUE)
                .addComponent(jButtonAddTeacher)
                .addGap(45, 45, 45)
                .addComponent(jButtonAddProgram, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(25, 25, 25))
            .addGroup(layout.createSequentialGroup()
                .addGap(335, 335, 335)
                .addComponent(jButtonExit)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(70, 70, 70)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButtonAddStudent)
                    .addComponent(jButtonAddTeacher)
                    .addComponent(jButtonAddProgram))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 55, Short.MAX_VALUE)
                .addComponent(jButtonExit)
                .addGap(44, 44, 44))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButtonAddStudentActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonAddStudentActionPerformed
        FormAddStudent form = new FormAddStudent(this);
        form.setVisible(true);
        this.setVisible(false);
    }//GEN-LAST:event_jButtonAddStudentActionPerformed

    private void jButtonAddTeacherActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonAddTeacherActionPerformed
        FormAddTeacher form = new FormAddTeacher(this);
        form.setVisible(true);
        this.setVisible(false);
    }//GEN-LAST:event_jButtonAddTeacherActionPerformed

    private void jButtonAddProgramActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonAddProgramActionPerformed
        FormAddProgram form = new FormAddProgram(this);
        form.setVisible(true);
        this.setVisible(false);
    }//GEN-LAST:event_jButtonAddProgramActionPerformed

    private void jButtonExitActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonExitActionPerformed
        new FormAuth().setVisible(true);
        this.dispose();
    }//GEN-LAST:event_jButtonExitActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButtonAddProgram;
    private javax.swing.JButton jButtonAddStudent;
    private javax.swing.JButton jButtonAddTeacher;
    private javax.swing.JButton jButtonExit;
    // End of variables declaration//GEN-END:variables
}
