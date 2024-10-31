/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
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
            if (rs.next()) {
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
        ArrayList<PlanCampain> plans = new ArrayList<>();
        PreparedStatement command = null;
        try {
            String sql = "select p.planID, pc.PlanCampnID, p.PlanName,d.DepartmentName, p.StartDate, p.EndDate,pd.ProductName\n"
                    + ", pc.Quantity from [Plan] p\n"
                    + "                    inner join [PlanCampain] pc on p.PlanID = pc.PlanID\n"
                    + "                    inner join [Product] pd on pc.ProductID = pd.ProductID\n"
                    + "                   inner join [Department] d on p.DepartmentID = d.DepartmentID";

            command = connection.prepareStatement(sql);
            ResultSet rs = command.executeQuery();

            while (rs.next()) {
                PlanCampain pc = new PlanCampain();
                pc.setId(rs.getInt("PlanCampnID"));
                pc.setQuantity(rs.getInt("Quantity"));

                Plan p = new Plan();
                p.setId(rs.getInt("planID"));
                p.setName(rs.getNString("PlanName"));
                p.setStart(rs.getDate("StartDate"));
                p.setEnd(rs.getDate("EndDate"));

                Department d = new Department();
                d.setName(rs.getString("DepartmentName"));
                p.setDept(d);

                Product pd = new Product();
                pd.setName(rs.getNString("ProductName"));
                pc.setProduct(pd);

                pc.setPlan(p);
                plans.add(pc);

            }

        } catch (SQLException ex) {
            Logger.getLogger(PlanCampainDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return plans;
    }

    public void deleteByPlanID(int planID) {
        String sql_delete_campains = "DELETE FROM PlanCampain WHERE PlanID = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql_delete_campains);
            stm.setInt(1, planID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PlanCampainDao.class.getName()).log(Level.SEVERE, null, ex);
        }
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
    public static void main(String[] args) {
        // Khởi tạo PlanCampainDao (giả sử đã có thiết lập kết nối cơ sở dữ liệu trong lớp này)
        PlanCampainDao planCampainDao = new PlanCampainDao();

        // Kiểm tra với một planCampnID cụ thể (thay thế bằng một ID có sẵn trong database của bạn)
        int testPlanCampnID = 70; // Đảm bảo ID này có trong CSDL của bạn để kiểm tra
        PlanCampain campain = planCampainDao.get(testPlanCampnID);

        // Kiểm tra kết quả trả về và in ra thông tin
        if (campain != null) {
            System.out.println("Plan Campaign ID: " + campain.getId());
            System.out.println("Plan ID: " + (campain.getPlan() != null ? campain.getPlan().getId() : "No Plan"));
            System.out.println("Product ID: " + (campain.getProduct() != null ? campain.getProduct().getId() : "No Product"));
            System.out.println("Quantity: " + campain.getQuantity());
            System.out.println("Estimated Cost: " + campain.getCost());
        } else {
            System.out.println("Plan Campaign with ID " + testPlanCampnID + " not found.");
        }
    }
    
}
