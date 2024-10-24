/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.accesscontrol.Role;
import java.sql.*;

/**
 *
 * @author ADMIN
 */
public class Employee {

    private int id;
    private String name;
    private boolean gender;
    private String address;
    private Date dob;
    private Role role;
    private String department;
    private Float salary;
    private Department dept;
    
    public Employee() {
    }

    public Employee(int id, String name, boolean gender, String address, Date dob, Role role, String department, Float salary, Department dept) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.address = address;
        this.dob = dob;
        this.role = role;
        this.department = department;
        this.salary = salary;
        this.dept = dept;
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

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public Float getSalary() {
        return salary;
    }

    public void setSalary(Float salary) {
        this.salary = salary;
    }

    public Department getDept() {
        return dept;
    }

    public void setDept(Department dept) {
        this.dept = dept;
    }

    
    

}
