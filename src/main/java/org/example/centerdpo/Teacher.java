/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.example.centerdpo;

import java.time.LocalDate;

public class Teacher extends Person {
    private String teacherId;
    private LocalDate hireDate;
    private String specialization;

    public Teacher(String lastName, String firstName, String middleName,
                   LocalDate birthDate, String gender, String phone, String email,
                   String teacherId, LocalDate hireDate, String specialization) {
        super(lastName, firstName, middleName, birthDate, gender, phone, email);
        this.teacherId = teacherId;
        this.hireDate = hireDate;
        this.specialization = specialization;
    }

    public String getTeacherId() { return teacherId; }
    public void setTeacherId(String teacherId) { this.teacherId = teacherId; }

    public LocalDate getHireDate() { return hireDate; }
    public void setHireDate(LocalDate hireDate) { this.hireDate = hireDate; }

    public String getSpecialization() { return specialization; }
    public void setSpecialization(String specialization) { this.specialization = specialization; }
}
