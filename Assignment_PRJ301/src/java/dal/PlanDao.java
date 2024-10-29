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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Department;
import model.Plan;
import model.PlanCampain;

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

    }

    @Override
    public void delete(Plan entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Plan> list() {
        ArrayList<Plan> plans = new ArrayList<>();
        try {
            String sql = "SELECT p.PlanID, p.PlanName, p.StartDate, p.EndDate, \n"
                    + "       d.DepartmentID, d.DepartmentName,\n"
                    + "       pc.PlanCampnID, pc.Quantity AS plannedQuantity,\n"
                    + "       sc.ScID, sc.Date, sc.Shift, \n"
                    + "       se.SchEmpID, a.Quantity AS actualQuantity\n"
                    + "FROM [Plan] p\n"
                    + "LEFT JOIN [Department] d ON p.DepartmentID = d.DepartmentID\n"
                    + "LEFT JOIN [PlanCampain] pc ON p.PlanID = pc.PlanID\n"
                    + "LEFT JOIN [SchedualCampaign] sc ON pc.PlanCampnID = sc.PlanCampnID\n"
                    + "LEFT JOIN [SchedualEmployee] se ON sc.ScID = se.ScID\n"
                    + "LEFT JOIN [Attendence] a ON se.SchEmpID = a.SchEmpID;";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            Plan currentPlan = null;
            int totalProduced = 0;
            int totalPlanned = 0;

            while (rs.next()) {
                int planID = rs.getInt("PlanID");
                String planName = rs.getString("PlanName");
                Date startDate = rs.getDate("StartDate");
                Date endDate = rs.getDate("EndDate");
                int departmentID = rs.getInt("DepartmentID");
                String departmentName = rs.getString("DepartmentName");

                // Tạo đối tượng mới nếu gặp Plan mới
                if (currentPlan == null || currentPlan.getId() != planID) {
                    if (currentPlan != null) {
                        int remainingQuantity = totalPlanned - totalProduced;
                        String status = calculateStatus(currentPlan.getEnd(), remainingQuantity);
                        currentPlan.setTotalProduced(totalProduced);
                        currentPlan.setRemainingQuantity(remainingQuantity);
                        currentPlan.setStatus(status);
                        plans.add(currentPlan);
                    }

                    // Khởi tạo đối tượng Plan mới
                    Department dept = new Department(departmentID, departmentName);
                    currentPlan = new Plan(planID, planName, startDate, endDate, dept, 0, 0, "");
                    totalProduced = 0;
                    totalPlanned = 0;
                }

                // Lấy dữ liệu từ PlanCampain và sản lượng thực tế
                int campainID = rs.getInt("PlanCampnID");
                int plannedQuantity = rs.getInt("plannedQuantity");
                int actualQuantity = rs.getInt("actualQuantity");

                PlanCampain campain = new PlanCampain();
                campain.setId(campainID);
                campain.setQuantity(plannedQuantity);

                currentPlan.getCampains().add(campain);
                totalProduced += actualQuantity;
                totalPlanned += plannedQuantity;
            }

            // Xử lý plan cuối cùng
            if (currentPlan != null) {
                int remainingQuantity = totalPlanned - totalProduced;
                String status = calculateStatus(currentPlan.getEnd(), remainingQuantity);
                currentPlan.setTotalProduced(totalProduced);
                currentPlan.setRemainingQuantity(remainingQuantity);
                currentPlan.setStatus(status);
                plans.add(currentPlan);
            }

        } catch (SQLException ex) {
            Logger.getLogger(PlanDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return plans;
    }

    // Tính trạng thái dựa trên ngày kết thúc và số lượng còn lại
    private String calculateStatus(Date endDate, int remainingQuantity) {
        Date today = new Date(System.currentTimeMillis());
        if (remainingQuantity == 0) {
            return "completed";
        } else if (endDate.before(today)) {
            return "late";
        } else {
            return "on-going";
        }
    }

    @Override
    public Plan get(int planID) {
        Plan plan = null;

        PreparedStatement stm;
        try {
            String sql = "SELECT p.PlanID, p.PlanName, p.StartDate, p.EndDate, \n"
                    + "                    d.DepartmentID, d.DepartmentName \n"
                    + "                    FROM dbo.[Plan] p \n"
                    + "                     JOIN Department d ON p.DepartmentID = d.DepartmentID \n"
                    + "                     WHERE p.PlanID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, planID);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                int departmentID = rs.getInt("DepartmentID"); //sql
                String departmentName = rs.getString("DepartmentName");
                
                
                Department dept = new Department(departmentID, departmentName);
                plan = new Plan();
                plan.setId(planID);
                plan.setName(rs.getString("PlanName"));
                plan.setStart(rs.getDate("StartDate"));
                plan.setEnd(rs.getDate("EndDate"));
                plan.setDept(dept);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(PlanDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return plan;

    }
}
