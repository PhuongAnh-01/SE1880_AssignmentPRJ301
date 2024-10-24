/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Date;
/**
 *
 * @author ADMIN
 */
public class SchedualCampaign {
    private int scID;
    private PlanCampain plancampain;
    private Date date;
    private int shift;
    private int quantity;

    public SchedualCampaign() {
    }

    public SchedualCampaign(int scID, PlanCampain plancampain, Date date, int shift, int quantity) {
        this.scID = scID;
        this.plancampain = plancampain;
        this.date = date;
        this.shift = shift;
        this.quantity = quantity;
    }

    public int getScID() {
        return scID;
    }

    public void setScID(int scID) {
        this.scID = scID;
    }

    public PlanCampain getPlancampain() {
        return plancampain;
    }

    public void setPlancampain(PlanCampain plancampain) {
        this.plancampain = plancampain;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getShift() {
        return shift;
    }

    public void setShift(int shift) {
        this.shift = shift;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    
    
}
