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
import model.SchedualCampaign;

/**
 *
 * @author ADMIN
 */
public class SchedualCampaignDao extends DBContext<SchedualCampaign> {
    
    public ArrayList<SchedualCampaign> listPlanCamp(int planCampnID ) {
        ArrayList<SchedualCampaign> schedules = new ArrayList<>();
        
        String sql = "SELECT * FROM dbo.SchedualCampaign WHERE PlanCampnID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, planCampnID);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                SchedualCampaign schedual = new SchedualCampaign();
                schedual.setScID(rs.getInt("ScID"));
                schedual.setDate(rs.getDate("Date"));
                schedual.setShift(rs.getString("Shift"));
                schedual.setQuantity(rs.getInt("Quantity"));
                schedules.add(schedual);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SchedualCampaignDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return schedules;
        
    }

    public void insert(ArrayList<SchedualCampaign> schedules) {
        
        
        
        PreparedStatement stm_insert = null;
        PreparedStatement stm_select = null;
        
        try {
            connection.setAutoCommit(false);
            String sql_insert = "INSERT INTO [dbo].[SchedualCampaign]\n"
                + "           ([PlanCampnID]\n"
                + "           ,[Date]\n"
                + "           ,[Shift]\n"
                + "           ,[Quantity])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
            stm_insert = connection.prepareStatement(sql_insert);
            for (SchedualCampaign sc : schedules) {
                PlanCampain p = new PlanCampain();
                    stm_insert.setInt(1, sc.getPlancampain().getId());
                    stm_insert.setDate(2, sc.getDate());
                    stm_insert.setString(3, sc.getShift());
                    stm_insert.setInt(4, sc.getQuantity());
                    stm_insert.addBatch();
            }
            
            stm_insert.executeBatch();
            
//           // stm_select = connection.prepareStatement(sql_select);
//            ResultSet rs = stm_select.executeQuery();
//            if(rs.next()) {
//                entity.setScID(rs.getInt("ScID"));
//            }
//            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(SchedualCampaignDao.class.getName()).log(Level.SEVERE, null, ex);
            
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(SchedualCampaignDao.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
           try {
                connection.setAutoCommit(true);
                if(stm_insert != null) {
                    stm_insert.close();
                }
                if(stm_select != null) {
                    stm_select.close();
                }
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(SchedualCampaignDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        

    }

    @Override
    public void update(SchedualCampaign entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(SchedualCampaign entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<SchedualCampaign> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public SchedualCampaign get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(SchedualCampaign entity) {
    }

}
