/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package org.example.centerdpo;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Scanner;
import java.time.format.DateTimeParseException;
import java.io.IOException; 

public class CenterDPO {
    static ArrayList<Student> students = new ArrayList<>();
    static ArrayList<Teacher> teachers = new ArrayList<>();
    static ArrayList<Program> programs = new ArrayList<>();
    static ArrayList<Course> courses = new ArrayList<>();
    static Scanner scanner = new Scanner(System.in);
    
    public static void main(String[] args) {
         importData();

        boolean exit = false;
        while (!exit) {
            System.out.println("\nМеню:");
            System.out.println("1. Добавить студента");
            System.out.println("2. Добавить преподавателя");
            System.out.println("3. Добавить программу обучения");
            System.out.println("4. Добавить курс");
            System.out.println("5. Выход");
            System.out.print("Выберите пункт: ");
            int choice = scanner.nextInt();
            scanner.nextLine(); // очистка буфера

            switch (choice) {
                case 1 -> addStudent();
                case 2 -> addTeacher();
                case 3 -> addProgram();
                case 4 -> addCourse();
                case 5 -> {
                    exit = true;
                    exportData();
                }
                default -> System.out.println("Неверный выбор");
            }
        }
    }

    public static void addStudent() {
        System.out.print("Фамилия: ");
        String l = scanner.nextLine();
        System.out.print("Имя: ");
        String f = scanner.nextLine();
        System.out.print("Отчество: ");
        String m = scanner.nextLine();
        
        LocalDate bd = null;
        while (bd == null) {
            System.out.print("Дата рождения (гггг-мм-дд): ");
            try {
                bd = LocalDate.parse(scanner.nextLine());
            } catch (DateTimeParseException e) {
                System.out.println("Неверный формат даты. Введите в формате ГГГГ-ММ-ДД.");
            }
        }
        
        System.out.print("Пол (Male/Female): ");
        String g = scanner.nextLine();
        System.out.print("Телефон: ");
        String p = scanner.nextLine();
        System.out.print("Email: ");
        String e = scanner.nextLine();
        System.out.print("Студенческий ID: ");
        String sid = scanner.nextLine();
        
        LocalDate rd = null;
        while (rd == null) {
            System.out.print("Дата регистрации (гггг-мм-дд): ");
            try {
                rd = LocalDate.parse(scanner.nextLine());
            } catch (DateTimeParseException ex) {
                System.out.println("Ошибка! Введите дату в формате ГГГГ-ММ-ДД.");
            }
        }

        students.add(new Student(l, f, m, bd, g, p, e, sid, rd));
        System.out.println("Студент добавлен.");
    }

    public static void addTeacher() {
        System.out.print("Фамилия: ");
        String l = scanner.nextLine();
        System.out.print("Имя: ");
        String f = scanner.nextLine();
        System.out.print("Отчество: ");
        String m = scanner.nextLine();
        
        LocalDate bd = null;
        while (bd == null) {
            System.out.print("Дата рождения (гггг-мм-дд): ");
            try {
                bd = LocalDate.parse(scanner.nextLine());
            } catch (DateTimeParseException e) {
                System.out.println("Ошибка! Введите дату в формате ГГГГ-ММ-ДД.");
            }
        }
        System.out.print("Пол (Male/Female): ");
        String g = scanner.nextLine();
        System.out.print("Телефон: ");
        String p = scanner.nextLine();
        System.out.print("Email: ");
        String e = scanner.nextLine();
        System.out.print("ID преподавателя: ");
        String tid = scanner.nextLine();
        
        LocalDate hd = null;
        while (hd == null) {
            System.out.print("Дата приема (гггг-мм-дд): ");
            try {
                hd = LocalDate.parse(scanner.nextLine());
            } catch (DateTimeParseException ex) {
                System.out.println("Ошибка! Введите дату в формате ГГГГ-ММ-ДД.");
            }
        }
        
        System.out.print("Специализация: ");
        String spec = scanner.nextLine();

        teachers.add(new Teacher(l, f, m, bd, g, p, e, tid, hd, spec));
        System.out.println("Преподаватель добавлен.");
    }

    public static void addProgram() {
        System.out.print("ID программы: ");
        String pid = scanner.nextLine();
        System.out.print("Название: ");
        String name = scanner.nextLine();
        System.out.print("Описание: ");
        String desc = scanner.nextLine();
        
        int hours = 0;
        while (true) {
            System.out.print("Продолжительность (часов): ");
            try {
                hours = Integer.parseInt(scanner.nextLine());
                if (hours <= 0) {
                    System.out.println("Ошибка! Введите положительное целое число.");
                    continue;
                }
                break;
            } catch (NumberFormatException e) {
                System.out.println("Ошибка! Введите целое число.");
            }
        }
        
        System.out.print("Категория: ");
        String cat = scanner.nextLine();

        programs.add(new Program(pid, name, desc, hours, cat));
        System.out.println("Программа добавлена.");
    }

    public static void addCourse() {
        System.out.print("ID курса: ");
        String cid = scanner.nextLine();
        System.out.print("ID программы: ");
        String pid = scanner.nextLine();
        
        Program prog = null;
        for (Program p : programs) {
            if (p.getProgramId().equals(pid)) {
                prog = p;
                break;
            }
        }
        if (prog == null) {
            System.out.println("Программа не найдена!");
            return;
        }
        
        LocalDate start = null;
        while (start == null) {
            System.out.print("Дата начала (гггг-мм-дд): ");
            try {
                start = LocalDate.parse(scanner.nextLine());
            } catch (DateTimeParseException e) {
                System.out.println("Ошибка! Введите дату в формате ГГГГ-ММ-ДД.");
            }
        }
            
        LocalDate end = null;
        while (end == null) {
            System.out.print("Дата окончания (гггг-мм-дд): ");
            try {
                end = LocalDate.parse(scanner.nextLine());
            } catch (DateTimeParseException e) {
                System.out.println("Ошибка! Введите дату в формате ГГГГ-ММ-ДД.");
            }
        }

        int max = 0;
        while (true) {
            System.out.print("Макс. число студентов: ");
            try {
                max = Integer.parseInt(scanner.nextLine());
                if (max <= 0) {
                    System.out.println("Ошибка! Введите положительное целое число.");
                    continue;
                }
                break;
            } catch (NumberFormatException e) {
                System.out.println("Ошибка! Введите целое число.");
            }
        }
        
        courses.add(new Course(cid, prog, start, end, max));
        System.out.println("Курс добавлен.");
    }

    private static void importData() {
        try {
            ArrayList<String> lines = FileInputOutput.textFileRead("students.txt");
            FileInputOutput.studentsImport(lines, students);
            lines = FileInputOutput.textFileRead("teachers.txt");
            FileInputOutput.teachersImport(lines, teachers);
            lines = FileInputOutput.textFileRead("programs.txt");
            FileInputOutput.programsImport(lines, programs);
            System.out.println("Данные импортированы.");
        } catch (IOException ex) {
            System.out.println("Ошибка импорта: " + ex.getMessage());
        }
    }

    private static void exportData() {
        boolean ok = FileInputOutput.textFileWrite("students.txt",
                FileInputOutput.studentsExport(students));
        ok &= FileInputOutput.textFileWrite("teachers.txt",
                FileInputOutput.teachersExport(teachers));
        ok &= FileInputOutput.textFileWrite("programs.txt",
                FileInputOutput.programsExport(programs));
        System.out.println(ok ? "Экспорт успешен." : "Ошибка экспорта.");
    }   
}
