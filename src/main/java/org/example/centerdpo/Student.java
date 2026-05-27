/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.example.centerdpo;

import java.time.LocalDate;

public class Student extends Person {
    private String studentId;
    private LocalDate registrationDate;

    public Student(String lastName, String firstName, String middleName,
                   LocalDate birthDate, String gender, String phone, String email,
                   String studentId, LocalDate registrationDate) {
        super(lastName, firstName, middleName, birthDate, gender, phone, email);
        this.studentId = studentId;
        this.registrationDate = registrationDate;
    }

    public String getStudentId() { return studentId; }
    public void setStudentId(String studentId) { this.studentId = studentId; }
    
    public LocalDate getRegistrationDate() { return registrationDate; }
    public void setRegistrationDate(LocalDate registrationDate) { this.registrationDate = registrationDate; }
}
