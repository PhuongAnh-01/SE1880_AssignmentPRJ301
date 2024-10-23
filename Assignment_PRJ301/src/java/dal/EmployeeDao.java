/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.accesscontrol.Role;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Department;
import model.Employee;

/**
 *
 * @author ADMIN
 */
public class EmployeeDao extends DBContext<Employee> {

    public ArrayList<Employee> search(Integer id, String name, Boolean gender, String address, Date from, Date to, Integer did, Integer roleId) {
        String sql = "SELECT \n"
                + "    e.EmployeeID, \n"
                + "    e.EmployeeName, \n"
                + "    e.gender, \n"
                + "    e.address, \n"
                + "    e.dob, \n"
                + "    d.DepartmentID, \n"
                + "    d.DepartmentName, \n"
                + "    r.RoleName \n"
                + "FROM \n"
                + "    Employee e \n"
                + "INNER JOIN \n"
                + "    Department d ON e.DepartmentID = d.DepartmentID \n"
                + "INNER JOIN \n"
                + "    Role r ON e.RoleID = r.RoleID \n"
                + "	WHERE \n"
                + "    1 = 1";
        ArrayList<Employee> emps = new ArrayList<>();
        ArrayList<Object> paramValues = new ArrayList<>();
        if (id != null) {
            sql += " AND e.EmployeeID = ?";
            paramValues.add(id);
        }
        if (name != null) {
            sql += " AND e.EmployeeName LIKE '%' + ? + '%'";
            paramValues.add(name);
        }
        if (gender != null) {
            sql += " AND e.gender = ?";
            paramValues.add(gender);
        }
        if (address != null) {
            sql += " AND e.[address] LIKE '%' + ? + '%'";
            paramValues.add(address);
        }

        if (from != null) {
            sql += " AND e.dob >= ?";
            paramValues.add(from);
        }
        if (to != null) {
            sql += " AND e.dob = ?";
            paramValues.add(to);
        }
        if (did != null && did != -1) {
            sql += " AND d.DepartmentID  = ?";
            paramValues.add(did);
        }
        if (roleId != null && roleId != -1) {
            sql += " AND r.RoleID  = ?";
            paramValues.add(roleId);
        }

        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            for (int i = 0; i < paramValues.size(); i++) {
                stm.setObject((i + 1), paramValues.get(i));
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getInt("EmployeeID"));
                e.setName(rs.getString("EmployeeName"));
                e.setGender(rs.getBoolean("gender"));
                e.setDob(rs.getDate("dob"));
                e.setAddress(rs.getString("address"));

                Department d = new Department();
                d.setId(rs.getInt("DepartmentID"));
                d.setName(rs.getString("DepartmentName"));
                e.setDept(d);

                Role r = new Role();
                r.setName(rs.getString("RoleName"));  // Lấy Role Name từ ResultSet
                e.setRole(r);

                emps.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return emps;
    }

    @Override
    public void insert(Employee entity) {
        String sql_insert = "INSERT INTO [dbo].[Employee] "
                + "([EmployeeName], [gender], [address], [dob], [DepartmentID], [RoleID]) " // Thêm RoleID vào câu lệnh
                + "VALUES (?, ?, ?, ?, ?, ?)"; // Added closing parenthesis here

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
            stm_insert.setInt(6, entity.getRole().getId());
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
                + "   SET [EmployeeName] = ?,\n"
                + "      [gender] = ?,\n"
                + "      [address] = ?,\n"
                + "      [dob] = ?,\n"
                + "      [DepartmentID] = ?\n"
                + " WHERE [EmployeeID] = ?";  // Sử dụng EmployeeID để xác định nhân viên

        PreparedStatement stm_update = null;
        try {
            stm_update = connection.prepareStatement(sql_update);
            stm_update.setString(1, entity.getName());
            stm_update.setBoolean(2, entity.isGender());
            stm_update.setString(3, entity.getAddress());
            stm_update.setDate(4, entity.getDob());
            stm_update.setInt(5, entity.getDept().getId());
            stm_update.setInt(6, entity.getId());  // Chỉ sử dụng EmployeeID để xác định nhân viên
            stm_update.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void delete(Employee entity) {
        String sql_delete = "DELETE FROM [dbo].[Employee]\n"
                + "      WHERE EmployeeID = ?";
        
        PreparedStatement stm_delete = null;
        try {
            stm_delete = connection.prepareStatement(sql_delete);
            stm_delete.setInt(1, entity.getId());
            stm_delete.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        


    }

    @Override
    public ArrayList<Employee> list() {
        ArrayList<Employee> list = new ArrayList<>();
        String sql = "SELECT e.EmployeeID, e.EmployeeName, e.gender, e.address, e.dob, d.DepartmentName, r.RoleName "
                + "FROM EMPLOYEE e "
                + "JOIN dbo.Department d ON d.DepartmentID = e.DepartmentID "
                + "JOIN dbo.Role r ON r.RoleID = e.RoleID";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getInt("EmployeeID"));
                e.setName(rs.getString("EmployeeName"));
                e.setGender(rs.getBoolean("gender"));
                e.setAddress(rs.getString("address"));
                e.setDob(rs.getDate("dob"));
                e.setDepartment(rs.getString("DepartmentName"));  // Chỉ lấy Department

                Role role = new Role();
                role.setName(rs.getString("RoleName"));
                e.setRole(role);
                list.add(e);
            }

        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    @Override
    public Employee get(int id) {
        String sql = "SELECT e.EmployeeID, e.EmployeeName, e.gender, e.address, e.dob, d.DepartmentID, d.DepartmentName "
                + "FROM EMPLOYEE e "
                + "JOIN dbo.Department d ON d.DepartmentID = e.DepartmentID "
                + "WHERE e.EmployeeID = ?";
        PreparedStatement stm = null;
        ResultSet rs = null;
        Employee e = null;

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);  // Truyền EmployeeID vào câu lệnh SQL
            rs = stm.executeQuery();

            if (rs.next()) {
                e = new Employee();
                e.setId(rs.getInt("EmployeeID"));
                e.setName(rs.getString("EmployeeName"));
                e.setGender(rs.getBoolean("gender"));
                e.setAddress(rs.getString("address"));
                e.setDob(rs.getDate("dob"));

                Department d = new Department();
                d.setId(rs.getInt("DepartmentID"));
                d.setName(rs.getString("DepartmentName"));
                e.setDept(d);  // Gán Department cho Employee
            }

        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return e;

    }

}
