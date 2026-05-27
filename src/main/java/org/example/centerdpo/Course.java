/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.example.centerdpo;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Course {
    private String courseId;
    private Program program;
    private LocalDate startDate;
    private LocalDate endDate;
    private Teacher teacher;
    private List<Student> students;
    private int maxStudents;

    public Course(String courseId, Program program, LocalDate startDate,
                  LocalDate endDate, int maxStudents) {
        this.courseId = courseId;
        this.program = program;
        this.startDate = startDate;
        this.endDate = endDate;
        this.maxStudents = maxStudents;
        this.students = new ArrayList<>();
    }

    // Методы управления 
    public boolean addStudent(Student student) {
        if (students.size() < maxStudents && !students.contains(student)) {
            students.add(student);
            return true;
        }
        return false;
    }

    public boolean removeStudent(Student student) {
        return students.remove(student);
    }

    public boolean assignTeacher(Teacher teacher) {
        this.teacher = teacher;
        return true;
    }

    // Геттеры и сеттеры
    public String getCourseId() { return courseId; }
    public void setCourseId(String courseId) { this.courseId = courseId; }

    public Program getProgram() { return program; }
    public void setProgram(Program program) { this.program = program; }

    public LocalDate getStartDate() { return startDate; }
    public void setStartDate(LocalDate startDate) { this.startDate = startDate; }

    public LocalDate getEndDate() { return endDate; }
    public void setEndDate(LocalDate endDate) { this.endDate = endDate; }

    public Teacher getTeacher() { return teacher; }

    public List<Student> getStudents() { return students; }


    public int getMaxStudents() { return maxStudents; }
    public void setMaxStudents(int maxStudents) { this.maxStudents = maxStudents; }
}
