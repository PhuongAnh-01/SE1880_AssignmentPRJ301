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
        throw new UnsupportedOperationException("Not supported yet.");

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
            if (rs.next()) {
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

    public static void main(String[] args) {
        // Tạo đối tượng PlanDao để gọi phương thức insert
        PlanDao planDao = new PlanDao();

        // Tạo đối tượng Department (Giả sử department có ID là 1)
        Department dept = new Department();
        dept.setId(1); // Thay thế với ID thật trong cơ sở dữ liệu

        // Tạo đối tượng Plan và thiết lập các giá trị
        Plan plan = new Plan();
        plan.setName("Kế hoạch sản xuất mẫu");
        plan.setStart(Date.valueOf("2024-11-01"));
        plan.setEnd(Date.valueOf("2024-11-30"));
        plan.setDept(dept);

        // Tạo danh sách PlanCampain và thêm vào Plan
        List<PlanCampain> campains = new ArrayList<>();

        // Tạo sản phẩm mẫu (Giả sử Product có ID là 1)
        Product product = new Product();
        product.setId(1); // Thay thế với ID thật trong cơ sở dữ liệu

        // Tạo một PlanCampain mẫu
        PlanCampain campain1 = new PlanCampain();
        campain1.setProduct(product);
        campain1.setQuantity(100);
        campain1.setCost(500.0f);

        // Thêm PlanCampain vào danh sách campains
        campains.add(campain1);

        // Gán danh sách PlanCampain cho Plan
        plan.setCampains((ArrayList<PlanCampain>) campains);

        // Thử gọi phương thức insert
        try {
            planDao.insert(plan);
            System.out.println("Thêm kế hoạch sản xuất thành công!");
        } catch (Exception e) {
            System.out.println("Có lỗi xảy ra khi thêm kế hoạch sản xuất: " + e.getMessage());
        }
    }
}
