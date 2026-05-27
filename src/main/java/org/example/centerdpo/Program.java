/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.example.centerdpo;

public class Program {
    private String programId;
    private String name;
    private String description;
    private int durationHours;
    private String category;

    public Program(String programId, String name, String description,
                   int durationHours, String category) {
        this.programId = programId;
        this.name = name;
        this.description = description;
        this.durationHours = durationHours;
        this.category = category;
    }

    public String getProgramId() { return programId; }
    public void setProgramId(String programId) { this.programId = programId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getDurationHours() { return durationHours; }
    public void setDurationHours(int durationHours) { this.durationHours = durationHours; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
}
