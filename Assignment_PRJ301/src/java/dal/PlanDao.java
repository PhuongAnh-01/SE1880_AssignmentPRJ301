/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Department;
import model.Plan;
import model.PlanCampain;
import model.Product;

/**
 *
 * @author ADMIN
 */
public class PlanDao extends DBContext<Plan> {

    @Override
    public void insert(Plan entity) {
        try {
            /**
             * dau tien insert vao bang plan, query ban ghi day sang insert n
             * ban ghi vao bang plancampain
             */
            connection.setAutoCommit(false);

            String sql_insert_plan = "INSERT INTO [dbo].[Plan]\n"
                    + "           ([PlanName]\n"
                    + "           ,[StartDate]\n"
                    + "           ,[EndDate]\n"
                    + "           ,[DepartmentID])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm_insert_plan = connection.prepareStatement(sql_insert_plan);
            stm_insert_plan.setString(1, entity.getName());
            stm_insert_plan.setDate(2, entity.getStart());
            stm_insert_plan.setDate(3, entity.getEnd());
            stm_insert_plan.setInt(4, entity.getDept().getId());
            stm_insert_plan.executeUpdate();

            String sql_select_pLan = "SELECT @@IDENTITY as PlanID";
            PreparedStatement stm_select_plan = connection.prepareStatement(sql_select_pLan);
            ResultSet rs = stm_select_plan.executeQuery();
            if (rs.next()) {
                entity.setId(rs.getInt("PlanID"));

            }

            for (PlanCampain campain : entity.getCampains()) {
                /**
                 * INSERT CAMPAIN: Moi campain ung voi 1 product -> chay vong
                 * for tat ca entity.getCampains
                 *
                 */

                String sql_insert_campain = "INSERT INTO [dbo].[PlanCampain]\n"
                        + "           ([PlanID]\n"
                        + "           ,[ProductID]\n"
                        + "           ,[Quantity]\n"
                        + "           ,[Estimate])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?)";

                PreparedStatement stm_insert_campain = connection.prepareStatement(sql_insert_campain);
                stm_insert_campain.setInt(1, entity.getId());
                stm_insert_campain.setInt(2, campain.getProduct().getId());
                stm_insert_campain.setInt(3, campain.getQuantity());
                stm_insert_campain.setFloat(4, campain.getCost());
                stm_insert_campain.executeUpdate();

            }
            connection.commit();

        } catch (SQLException ex) {
            Logger.getLogger(PlanDao.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(PlanDao.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(PlanDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(PlanDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    public void update(Plan entity) {
        try {
            connection.setAutoCommit(false);

            String sql_update_plan = "UPDATE [dbo].[Plan]\n"
                    + "     SET      ([PlanName]= ?\n"
                    + "           ,[StartDate]= ?\n"
                    + "           ,[EndDate]= ?\n"
                    + "           ,[DepartmentID]= ?)\n";

            PreparedStatement stm_update_plan = connection.prepareStatement(sql_update_plan);
            stm_update_plan.setString(1, entity.getName());
            stm_update_plan.setDate(2, entity.getStart());
            stm_update_plan.setDate(3, entity.getEnd());
            stm_update_plan.setInt(4, entity.getDept().getId());
            stm_update_plan.executeUpdate();

            String sql_select_pLan = "SELECT @@IDENTITY as PlanID";
            PreparedStatement stm_select_plan = connection.prepareStatement(sql_select_pLan);
            ResultSet rs = stm_select_plan.executeQuery();
            if (rs.next()) {
                entity.setId(rs.getInt("PlanID"));

            }

            for (PlanCampain campain : entity.getCampains()) {

                String sql_update_campain = "UPDATE [dbo].[PlanCampain]\n"
                        + "     SET      ([PlanID] = ?\n"
                        + "           ,[ProductID] = ?\n"
                        + "           ,[Quantity] = ?\n"
                        + "           ,[Estimate] = ?)\n";

                PreparedStatement stm_update_campain = connection.prepareStatement(sql_update_campain);
                stm_update_campain.setInt(1, entity.getId());
                stm_update_campain.setInt(2, campain.getProduct().getId());
                stm_update_campain.setInt(3, campain.getQuantity());
                stm_update_campain.setFloat(4, campain.getCost());
                stm_update_campain.executeUpdate();

            }
            connection.commit();

        } catch (SQLException ex) {
            Logger.getLogger(PlanDao.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(PlanDao.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(PlanDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(PlanDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    public void delete(Plan entity) {
        try {
            connection.setAutoCommit(false);

//        // Xóa các bản ghi liên quan trong bảng PlanCampain trước
//        String sql_delete_campains = "DELETE FROM [dbo].[PlanCampain] WHERE PlanID = ?";
//        PreparedStatement stm_delete_campains = connection.prepareStatement(sql_delete_campains);
//        stm_delete_campains.setInt(1, entity.getId());
//        stm_delete_campains.executeUpdate();
            // Xóa bản ghi trong bảng Plan
            String sql_delete_plan = "DELETE FROM [dbo].[Plan] WHERE PlanID = ?";
            PreparedStatement stm_delete_plan = connection.prepareStatement(sql_delete_plan);
            stm_delete_plan.setInt(1, entity.getId());
            stm_delete_plan.executeUpdate();

            connection.commit();

        } catch (SQLException ex) {
            Logger.getLogger(PlanDao.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(PlanDao.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(PlanDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(PlanDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    public ArrayList<Plan> list() {
        ArrayList<Plan> plans = new ArrayList<>();
        PreparedStatement command = null;

        try {
            String sql = "select * from [Plan]";
            command = connection.prepareStatement(sql);
            ResultSet rs = command.executeQuery();

            while (rs.next()) {
                Plan p = new Plan();
                p.setId(rs.getInt("PlanID"));
                p.setName(rs.getNString("PlanName"));
                p.setStart(rs.getDate("StartDate"));
                p.setEnd(rs.getDate("EndDate"));

                Department d = new Department();
                d.setId(rs.getInt("DepartmentID"));
                p.setDept(d);

                plans.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PlanDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return plans;
    }

    @Override
    public Plan get(int planID) {
        Plan plan = null;

        PreparedStatement stm;
        try {
            String sql = "SELECT * \n"
                    + "                    FROM dbo.[Plan] p \n"
                    + "                     JOIN Department d ON p.DepartmentID = d.DepartmentID \n"
                    + "                     WHERE p.PlanID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, planID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                //sql

                plan = new Plan();
                plan.setId(rs.getInt("PlanID"));
                plan.setName(rs.getString("PlanName"));
                plan.setStart(rs.getDate("StartDate"));
                plan.setEnd(rs.getDate("EndDate"));

//                Department dept = new Department();
//                int departmentID = rs.getInt("DepartmentID");
//                String departmentName = rs.getString("DepartmentName");
//                plan.setDept(dept);


                Department d = new Department();
                d.setId(rs.getInt("DepartmentID"));
                d.setName(rs.getString("DepartmentName"));
                plan.setDept(d);

            }
        } catch (SQLException ex) {
            Logger.getLogger(PlanDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return plan;

    }

    public static void main(String[] args) {
        PlanDao planDao = new PlanDao();

        // Kiểm tra với một planID cụ thể (thay thế bằng một ID có sẵn trong database của bạn)
        int testPlanID = 42; // Sử dụng ID phù hợp có trong database để kiểm tra
        Plan plan = planDao.get(testPlanID);

        if (plan != null) {
            System.out.println("Plan ID: " + plan.getId());
            System.out.println("Plan Name: " + plan.getName());
            System.out.println("Start Date: " + plan.getStart());
            System.out.println("End Date: " + plan.getEnd());
            System.out.println("Department ID: " + plan.getDept().getId());
            System.out.println("Department Name: " + plan.getDept().getName());
        } else {
            System.out.println("Plan with ID " + testPlanID + " not found.");
        }
    }

}
