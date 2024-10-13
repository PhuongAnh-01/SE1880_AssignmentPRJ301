/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Employee;

/**
 *
 * @author ADMIN
 */
public class EmployeeDao extends DBContext {

    public ArrayList<Employee> getAll() {
        ArrayList<Employee> list = new ArrayList<>();
        String sql = "SELECT e.EmployeeID, e.EmployeeName, e.gender, e.address, e.dob, r.RoleName, d.DepartmentName FROM \n"
                + "EMPLOYEE e JOIN dbo.Role r \n"
                + "ON r.RoleID = e.RoleID JOIN dbo.Department d\n"
                + "ON d.DepartmentID = e.DepartmentID";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getInt("EmployeeID"));
                e.setName(rs.getNString("EmployeeName"));
                e.setGender(rs.getBoolean("gender"));
                
                e.setAddress(rs.getString("address"));
                e.setDob(rs.getDate("dob"));
                e.setRole(rs.getString("RoleName"));
                e.setDepartment(rs.getString("DepartmentName"));
                list.add(e);
            }
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
        
    }
}
