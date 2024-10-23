/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import controller.accesscontrol.BaseRBACController;
import dal.DepartmentDao;
import dal.EmployeeDao;
import dal.RoleDao;
import entity.accesscontrol.Role;
import entity.accesscontrol.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

import java.sql.Date;
import model.Department;
import model.Employee;
import java.sql.*;

/**
 *
 * @author ADMIN
 */
public class EmployeeCreateController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        DepartmentDao db = new DepartmentDao();
        ArrayList<Department> depts = db.get("WS");

        RoleDao rdb = new RoleDao();
        ArrayList<Role> roles = rdb.getRolesLimited();

        req.setAttribute("depts", depts);
        req.setAttribute("roles", roles);
        req.getRequestDispatcher("../view/employee/create.jsp").forward(req, resp);

    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        String raw_name = req.getParameter("name");
        String raw_gender = req.getParameter("gender");
        String raw_dob = req.getParameter("dob");
        String raw_address = req.getParameter("address");
        String raw_did = req.getParameter("did");
        String raw_roleId = req.getParameter("roleId");
        //validate params
        //object binding
        Employee e = new Employee();
        e.setName(raw_name);
        e.setAddress(raw_address);
        e.setGender(raw_gender.equals("male"));
        e.setDob(Date.valueOf(raw_dob));

        Department d = new Department();
        d.setId(Integer.parseInt(raw_did));
        e.setDept(d);

        Role r = new Role();
        r.setId(Integer.parseInt(raw_roleId));  // Gán RoleID vào đối tượng Employee
        e.setRole(r);

        EmployeeDao db = new EmployeeDao();
        db.insert(e);

        //return results to user
        resp.sendRedirect(req.getContextPath() + "/employee/list");

    }

}
