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
public class EmployeeDao extends DBContext<Employee> {

    @Override
    public void insert(Employee entity) {
        String sql_insert = "INSERT INTO [dbo].[Employee] "
                + "([EmployeeName], [gender], [address], [dob], [DepartmentID]) "
                + "VALUES (?, ?, ?, ?, ?)"; // Added closing parenthesis here

        String sql_select = "SELECT @@IDENTITY as EmployeeID";

        PreparedStatement stm_insert = null;
        PreparedStatement stm_select = null;

        try {
            connection.setAutoCommit(false);
            stm_insert = connection.prepareStatement(sql_insert);
            stm_insert.setString(1, entity.getName());
            stm_insert.setBoolean(2, entity.isGender());
            stm_insert.setString(3, entity.getAddress());
            stm_insert.setDate(4, entity.getDob());
            stm_insert.setInt(5, entity.getDept().getId());
            stm_insert.executeUpdate();

            // Select the last inserted EmployeeID
            stm_select = connection.prepareStatement(sql_select);
            ResultSet rs = stm_select.executeQuery();
            if (rs.next()) {
                entity.setId(rs.getInt("EmployeeID")); // Retrieve EmployeeID and set it to the entity
            }

            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex1);
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
                Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    public void update(Employee entity) {
        String sql_update = "UPDATE [dbo].[Employee]\n"
                + "   SET [EmployeeName] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[dob] = ?\n"
                + "      ,[DepartmentID] = ?\n"
                + "      ,[salary] = ?\n"
                + " WHERE EmployeeID = ?";
        PreparedStatement stm_update = null;
        try {
            stm_update = connection.prepareStatement(sql_update);
            stm_update.setString(1, entity.getName());
            stm_update.setBoolean(2, entity.isGender());
            stm_update.setString(3, entity.getAddress());
            stm_update.setDate(4, entity.getDob());
            stm_update.setInt(5, entity.getDept().getId());
            stm_update.setDouble(6, entity.getSalary());
            stm_update.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void delete(Employee entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Employee> list() {
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

    @Override
    public Employee get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
