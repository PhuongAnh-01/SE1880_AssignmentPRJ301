/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.accesscontrol;

import dal.UserDBContext;
import entity.accesscontrol.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author sonng
 */
public class LoginController extends HttpServlet {

    @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String user = req.getParameter("username");
    String pass = req.getParameter("password");

    UserDBContext db = new UserDBContext();
    User account = db.get(user, pass);

    if (account != null) {
        req.getSession().setAttribute("account", account);

        // Kiểm tra xem account có vai trò nào không
        if (account.getRoles() != null && !account.getRoles().isEmpty()) {
            String roleName = account.getRoles().get(0).getName();  // Lấy vai trò đầu tiên
            switch (roleName) {
                case "Human Resource Management":
                    resp.sendRedirect("employee/list");
                    break;
                case "Workshop Manager":
                    resp.sendRedirect("manager/assign_tasks");
                    break;
                case "Produce Planner":
                    resp.sendRedirect("plan/production_plan");
                    break;
                case "Accountant":
                    resp.sendRedirect("accounting/calculate_salary");
                    break;
                default:
                    resp.sendError(403, "Bạn không có quyền truy cập tính năng này!");
                    break;
            }
        } else {
            resp.sendError(403, "Tài khoản không có vai trò nào!");
        }
    } else {
        // Gán thông báo lỗi vào session
        req.getSession().setAttribute("err", "Username hoặc password không đúng!");
        resp.sendRedirect("login");
    }
}

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //pre-processing
        req.getRequestDispatcher("login.jsp").forward(req, resp);
        //post-processing
    }

}
