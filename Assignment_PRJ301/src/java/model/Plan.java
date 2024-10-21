/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class Plan {
    private int id;
    private String name;
    private Date start;
    private Date end;
    private Department dept;
    private int totalProduced;
    private int remainingQuantity;
    private String status;
    private ArrayList<PlanCampain> campains = new ArrayList<>();

    public ArrayList<PlanCampain> getCampains() {
        return campains;
    }

    public void setCampains(ArrayList<PlanCampain> campains) {
        this.campains = campains;
    }

    public Plan() {
    }
    
    

    public Plan(int id, String name, Date start, Date end, Department dept, int totalProduced, int remainingQuantity, String status) {
        this.id = id;
        this.name = name;
        this.start = start;
        this.end = end;
        this.dept = dept;
        this.totalProduced = totalProduced;
        this.remainingQuantity = remainingQuantity;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public Department getDept() {
        return dept;
    }

    public void setDept(Department dept) {
        this.dept = dept;
    }

    public int getTotalProduced() {
        return totalProduced;
    }

    public void setTotalProduced(int totalProduced) {
        this.totalProduced = totalProduced;
    }

    public int getRemainingQuantity() {
        return remainingQuantity;
    }

    public void setRemainingQuantity(int remainingQuantity) {
        this.remainingQuantity = remainingQuantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
    
    
}
