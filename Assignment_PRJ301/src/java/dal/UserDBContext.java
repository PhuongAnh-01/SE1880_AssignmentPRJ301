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
            Role c_role = new Role();
            c_role.setId(-1);
            while (rs.next()) {
                int rid = rs.getInt("RoleID");
                if (rid != c_role.getId()) {
                    c_role = new Role();
                    c_role.setId(rid);
                    c_role.setName(rs.getString("RoleName"));
                    roles.add(c_role);
                }

                Feature f = new Feature();
                f.setId(rs.getInt("FeatureID"));
                f.setName(rs.getString("FeatureName"));
                f.setUrl(rs.getString("url"));
                c_role.getFeatures().add(f);
                f.setRoles(roles);
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

    public User get(String username, String password) {
        String sql = "SELECT UserName  FROM [User] \n"
                + "WHERE UserName  = ? AND [password] = ?";
        PreparedStatement stm = null;
        User user = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUsername(rs.getString("UserName"));
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
