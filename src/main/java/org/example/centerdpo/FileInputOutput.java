/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.example.centerdpo ;

import java.io.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class FileInputOutput {
    public static ArrayList<String> textFileRead(String path) throws IOException {
        ArrayList<String> buffer = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(path))) {
            String line;
            while ((line = br.readLine()) != null) {
                buffer.add(line);
            }
        }
        return buffer;
    }

    public static boolean textFileWrite(String path, ArrayList<String> data) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(path, false))) {
            for (String line : data) {
                bw.write(line);
                bw.newLine();
            }
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    // Импорт студентов
    public static boolean studentsImport(ArrayList<String> source, ArrayList<Student> destination) {
        destination.clear();
        for (String line : source) {
            if (line.trim().isEmpty()) continue;
            String[] parts = line.split(",");
            if (parts.length < 9) continue;
            try {
                Student s = new Student(
                        parts[0], parts[1], parts[2],
                        LocalDate.parse(parts[3]),
                        parts[4], parts[5], parts[6],
                        parts[7],
                        LocalDate.parse(parts[8])
                );
                destination.add(s);
            } catch (Exception e) {
                System.err.println("Ошибка разбора студента: " + line);
            }
        }
        return true;
    }

    // Экспорт студентов
    public static ArrayList<String> studentsExport(ArrayList<Student> source) {
        ArrayList<String> lines = new ArrayList<>();
        for (Student s : source) {
            lines.add(String.join(",",
                    s.getLastName(), s.getFirstName(), s.getMiddleName(),
                    s.getBirthDate().toString(),
                    s.getGender(), s.getPhone(), s.getEmail(),
                    s.getStudentId(),
                    s.getRegistrationDate().toString()
            ));
        }
        return lines;
    }

    // Импорт преподавателей
    public static boolean teachersImport(ArrayList<String> source, ArrayList<Teacher> destination) {
        destination.clear();
        for (String line : source) {
            if (line.trim().isEmpty()) continue;
            String[] parts = line.split(",");
            if (parts.length < 10) continue;
            try {
                Teacher t = new Teacher(
                        parts[0], parts[1], parts[2],
                        LocalDate.parse(parts[3]),
                        parts[4], parts[5], parts[6],
                        parts[7],
                        LocalDate.parse(parts[8]),
                        parts[9]
                );
                destination.add(t);
            } catch (Exception e) {
                System.err.println("Ошибка разбора преподавателя: " + line);
            }
        }
        return true;
    }

    // Экспорт преподавателей
    public static ArrayList<String> teachersExport(ArrayList<Teacher> source) {
        ArrayList<String> lines = new ArrayList<>();
        for (Teacher t : source) {
            lines.add(String.join(",",
                    t.getLastName(), t.getFirstName(), t.getMiddleName(),
                    t.getBirthDate().toString(),
                    t.getGender(), t.getPhone(), t.getEmail(),
                    t.getTeacherId(),
                    t.getHireDate().toString(),
                    t.getSpecialization()
            ));
        }
        return lines;
    }

    // Импорт программ
    public static boolean programsImport(ArrayList<String> source, ArrayList<Program> destination) {
        destination.clear();
        for (String line : source) {
            if (line.trim().isEmpty()) continue;
            String[] parts = line.split(",");
            if (parts.length < 5) continue;
            try {
                Program p = new Program(
                        parts[0],
                        parts[1],
                        parts[2],
                        Integer.parseInt(parts[3]),
                        parts[4]
                );
                destination.add(p);
            } catch (Exception e) {
                System.err.println("Ошибка разбора программы: " + line);
            }
        }
        return true;
    }

    // Экспорт программ
    public static ArrayList<String> programsExport(ArrayList<Program> source) {
        ArrayList<String> lines = new ArrayList<>();
        for (Program p : source) {
            lines.add(String.join(",",
                    p.getProgramId(),
                    p.getName(),
                    p.getDescription(),
                    String.valueOf(p.getDurationHours()),
                    p.getCategory()
            ));
        }
        return lines;
    }
}
