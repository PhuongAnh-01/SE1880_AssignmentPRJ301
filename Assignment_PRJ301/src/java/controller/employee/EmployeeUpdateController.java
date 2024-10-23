/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import controller.accesscontrol.BaseRBACController;
import dal.DepartmentDao;
import dal.EmployeeDao;
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

/**
 *
 * @author ADMIN
 */
public class EmployeeUpdateController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        EmployeeDao db = new EmployeeDao();
        Employee e = db.get(id);
        if (e != null) {
            DepartmentDao dbDept = new DepartmentDao();
            ArrayList<Department> depts = dbDept.list();
            req.setAttribute("e", e);
            req.setAttribute("depts", depts);
            req.getRequestDispatcher("../view/employee/update.jsp").forward(req, resp);
        } else {
            resp.sendError(404, "this employee does not exist!");
        }

    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        String raw_id = req.getParameter("id");  // Lấy EmployeeID từ form (chỉ để xác định nhân viên)
        String raw_name = req.getParameter("name");
        String raw_gender = req.getParameter("gender");
        String raw_dob = req.getParameter("dob");
        String raw_address = req.getParameter("address");
        String raw_did = req.getParameter("did");

        // Object binding
        Employee e = new Employee();
        e.setId(Integer.parseInt(raw_id));  // Sử dụng EmployeeID để xác định nhân viên, không cập nhật giá trị này
        e.setName(raw_name);
        e.setAddress(raw_address);
        e.setGender(raw_gender.equals("male"));
        e.setDob(Date.valueOf(raw_dob));

        Department d = new Department();
        d.setId(Integer.parseInt(raw_did));
        e.setDept(d);

        EmployeeDao db = new EmployeeDao();
        db.update(e);  // Gọi phương thức update để cập nhật thông tin nhân viên

        // Chuyển hướng về danh sách nhân viên sau khi cập nhật thành công
        resp.sendRedirect(req.getContextPath() + "/employee/list");

    }

}
