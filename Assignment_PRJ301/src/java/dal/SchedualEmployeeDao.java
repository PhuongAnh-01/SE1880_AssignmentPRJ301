/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Department;
import model.Employee;
import model.Plan;
import model.PlanCampain;
import model.SchedualCampaign;
import model.SchedualEmployee;

/**
 *
 * @author ADMIN
 */
public class SchedualEmployeeDao extends DBContext<SchedualEmployee> {

    @Override
    public void insert(SchedualEmployee entity) {
        String sql = "INSERT INTO dbo.SchedualEmployee (SchEmpID, ScID, EmployeeID, Quantity) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, entity.getSchEmpID());
            st.setInt(2, entity.getSchedualCampaign().getScID());
            st.setInt(3, entity.getEmployee().getId());
            st.setDouble(4, entity.getQuantity());

            int rowsInserted = st.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new record was inserted successfully!");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SchedualEmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

@Override
public void update(SchedualEmployee entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
public void delete(SchedualEmployee entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<SchedualEmployee> list() {
        ArrayList<SchedualEmployee> list = new ArrayList<>();
        String sql = "SELECT SE.SchEmpID,  P.PlanName, E.EmployeeName, SC.Date, SC.Shift, SE.Quantity,D.DepartmentName\n"
                + "FROM dbo.SchedualEmployee SE\n"
                + "JOIN dbo.SchedualCampaign SC ON SE.ScID = SC.ScID\n"
                + "JOIN dbo.Employee E ON E.EmployeeID = SE.EmployeeID\n"
                + "JOIN dbo.PlanCampain PC ON PC.PlanCampnID = SC.PlanCampnID\n"
                + "JOIN dbo.[Plan] P ON P.PlanID = PC.PlanID\n"
                + "JOIN dbo.Department D ON D.DepartmentID = E.DepartmentID";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Department d = new Department();
                d.setName(rs.getString("DepartmentName"));

                Plan p = new Plan();
                p.setName(rs.getString("PlanName"));

                Employee e = new Employee();
                e.setName(rs.getString("EmployeeName"));

                SchedualCampaign sc = new SchedualCampaign();
                sc.setDate(rs.getDate("Date"));
                sc.setShift(rs.getString("Shift"));


                SchedualEmployee se =  new SchedualEmployee();
                se.setSchEmpID(rs.getInt("SchEmpID"));
                se.setQuantity(rs.getInt("Quantity"));

                se.setDepartment(d);
                se.setPlan(p);
                se.setEmployee(e);
                se.setSchedualCampaign(sc);


                list.add(se);

}
        } catch (SQLException ex) {
            Logger.getLogger(SchedualCampaignDao.class  

.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
public SchedualEmployee get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public static void main(String[] args) {
        // Khởi tạo đối tượng của lớp DAO để gọi phương thức list
        SchedualEmployeeDao dao = new SchedualEmployeeDao();

        // Gọi phương thức list và lưu kết quả vào biến
        ArrayList<SchedualEmployee> schedualEmployees = dao.list();

        // In ra danh sách kết quả để kiểm tra
        for (SchedualEmployee schedualEmployee : schedualEmployees) {
            System.out.println(schedualEmployee);
        }
    }

}
