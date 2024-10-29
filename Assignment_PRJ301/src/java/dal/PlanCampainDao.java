/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Plan;
import model.PlanCampain;
import model.Product;

/**
 *
 * @author ADMIN
 */
public class PlanCampainDao extends DBContext<PlanCampain> {

    @Override
    public void insert(PlanCampain campain) {
        String sql_insert = "INSERT INTO PlanCampain (PlanID, ProductID, Quantity, Estimate) "
                + "VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setInt(1, campain.getPlan().getId());
            stm.setInt(2, campain.getProduct().getId());
            stm.setInt(3, campain.getQuantity());
            stm.setFloat(4, campain.getCost());
            
            stm.executeUpdate();
            
            ResultSet rs = stm.getGeneratedKeys();
            if(rs.next()) {
                campain.setId(rs.getInt("PlanCampnID"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PlanCampainDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        

    }

    @Override
    public void update(PlanCampain entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(PlanCampain entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<PlanCampain> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public PlanCampain get(int planCampnID) {
        PlanCampain campain = null;

        try {
            String sql = "SELECT pc.PlanCampnID, pc.PlanID, pc.ProductID, pc.Quantity, pc.Estimate \n"
                    + "                 FROM PlanCampain pc \n"
                    + "                  JOIN Product pr ON pc.ProductID = pr.ProductID \n"
                    + "                  WHERE pc.PlanCampnID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, planCampnID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                PlanDao planDao = new PlanDao();
                Plan plan = planDao.get(rs.getInt("PlanID"));

                Product product = new Product();
                product.setId(rs.getInt("ProductID"));

                campain = new PlanCampain();
                campain.setId(rs.getInt("PlanCampnID"));
                campain.setPlan(plan);
                campain.setProduct(product);
                campain.setQuantity(rs.getInt("Quantity"));
                campain.setCost(rs.getFloat("Estimate"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PlanCampainDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return campain;
    }

}
