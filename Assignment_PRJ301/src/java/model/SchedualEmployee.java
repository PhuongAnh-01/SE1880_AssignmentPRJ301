/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class SchedualEmployee {
    private int SchEmpID;
    private SchedualCampaign schedualCampaign;
    private Employee employee;
    private Plan plan;
    private Department department;
    private int quantity;

    public SchedualEmployee() {
    }

    public SchedualEmployee(int SchEmpID, SchedualCampaign schedualCampaign, Employee employee, Plan plan, Department department, int quantity) {
        this.SchEmpID = SchEmpID;
        this.schedualCampaign = schedualCampaign;
        this.employee = employee;
        this.plan = plan;
        this.department = department;
        this.quantity = quantity;
    }

    public int getSchEmpID() {
        return SchEmpID;
    }

    public void setSchEmpID(int SchEmpID) {
        this.SchEmpID = SchEmpID;
    }

    public SchedualCampaign getSchedualCampaign() {
        return schedualCampaign;
    }

    public void setSchedualCampaign(SchedualCampaign schedualCampaign) {
        this.schedualCampaign = schedualCampaign;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Plan getPlan() {
        return plan;
    }

    public void setPlan(Plan plan) {
        this.plan = plan;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "SchedualEmployee{" + "SchEmpID=" + SchEmpID + ", schedualCampaign=" + schedualCampaign + ", employee=" + employee + ", plan=" + plan + ", department=" + department + ", quantity=" + quantity + '}';
    }

}