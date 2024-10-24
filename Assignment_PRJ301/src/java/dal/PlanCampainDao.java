/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PlanCampain;

/**
 *
 * @author ADMIN
 */
public class PlanCampainDao extends DBContext<PlanCampain> {

    @Override
    public void insert(PlanCampain entity) {
        String sql_insert = "INSERT INTO [dbo].[PlanCampain]\n"
                + "           ([PlanID]\n"
                + "           ,[ProductID]\n"
                + "           ,[Quantity]\n"
                + "           ,[Estimate])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        String sql_select = "SELECT @@IDENTITY as PlanCampnID";

        PreparedStatement stm_insert = null;
        PreparedStatement stm_select = null;

        try {
            connection.setAutoCommit(false);
            stm_insert = connection.prepareStatement(sql_insert);
            stm_insert.setInt(1, entity.getPlan().getId());
            stm_insert.setInt(2, entity.getProduct().getId());
            stm_insert.setInt(3, entity.getQuantity());
            stm_insert.setFloat(4, entity.getCost());
            stm_insert.executeUpdate();

            stm_select = connection.prepareStatement(sql_select);
            ResultSet rs = stm_select.executeQuery();
            if (rs.next()) {
                entity.setId(rs.getInt("PlanCampnID")); // Retrieve PlanCampnID and set it to the entity
            }

            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(PlanCampainDao.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(PlanCampainDao.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
                if (stm_insert != null) {
                    stm_insert.close();
                }
                if (stm_select != null) {
                    stm_select.close();
                }
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(PlanCampainDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public PlanCampain get(int planCampnID) {
        PlanCampain campain = null;
        try {
            String sql = "SELECT * FROM PlanCampain WHERE PlanCampnID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, planCampnID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                campain = new PlanCampain();
                campain.setId(rs.getInt("PlanCampnID"));
                // Thêm các thuộc tính khác từ ResultSet
            }
        } catch (SQLException ex) {
            Logger.getLogger(PlanCampainDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return campain;

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

}
