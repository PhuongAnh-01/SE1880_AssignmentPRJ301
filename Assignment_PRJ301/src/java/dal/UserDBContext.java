package dal;

import entity.accesscontrol.Feature;
import entity.accesscontrol.Role;
import entity.accesscontrol.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phuonganh
 */
public class UserDBContext extends DBContext {

    public ArrayList<Role> getRoles(String username) {
        String sql = "SELECT r.RoleID, r.RoleName, f.FeatureID, f.FeatureName, f.url FROM dbo.[User] u INNER JOIN dbo.UserRole ur \n"
                + "ON ur.UserName = u.UserName INNER JOIN dbo.Role r\n"
                + "ON r.RoleID = ur.RoleID\n"
                + "INNER JOIN dbo.RoleFeature rf ON rf.RoleID = r.RoleID\n"
                + "INNER JOIN dbo.Feature f ON f.FeatureID = rf.FeatureID\n"
                + "WHERE u.UserName = ?\n"
                + "ORDER BY r.RoleID, f.FeatureID ASC";

        PreparedStatement stm = null;
        ArrayList<Role> roles = new ArrayList<>();
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            Role c_role = null;
            while (rs.next()) {
            int rid = rs.getInt("RoleID");
            if (c_role == null || rid != c_role.getId()) {
                // Nếu rid khác với c_role hiện tại, tạo role mới
                c_role = new Role();
                c_role.setId(rid);
                c_role.setName(rs.getString("RoleName"));
                c_role.setFeatures(new ArrayList<>());  // Khởi tạo danh sách tính năng cho role mới
                roles.add(c_role);
            }

                Feature f = new Feature();
            f.setId(rs.getInt("FeatureID"));
            f.setName(rs.getString("FeatureName"));
            f.setUrl(rs.getString("url"));
            c_role.getFeatures().add(f);  // Gán feature vào danh sách của Role hiện tại
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return roles;
    }

    public User get(String username, String password,String roleName) {
    String sql = "SELECT u.UserName, r.RoleName FROM [User] u "
               + "INNER JOIN UserRole ur ON u.UserName = ur.UserName "
               + "INNER JOIN Role r ON ur.RoleID = r.RoleID "
               + "WHERE u.UserName = ? AND u.[password] = ? AND r.RoleName = ?";
    PreparedStatement stm = null;
    User user = null;
    try {
        stm = connection.prepareStatement(sql);
        stm.setString(1, username);
        stm.setString(2, password);
        stm.setString(3, roleName);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            user = new User();
            user.setUsername(rs.getString("UserName"));
            // Lấy danh sách vai trò của người dùng
            ArrayList<Role> roles = getRoles(username);
            user.setRoles(roles);
        }
    } catch (SQLException ex) {
        Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        try {
            if (stm != null) {
                stm.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    return user;
}


    @Override
    public void insert(Object entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Object entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Object entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Object get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
