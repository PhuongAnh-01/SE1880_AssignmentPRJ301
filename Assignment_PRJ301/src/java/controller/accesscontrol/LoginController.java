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
        String role = req.getParameter("role");

        UserDBContext db = new UserDBContext();
        User account = db.get(user, pass, role);  // Thêm tham số role để kiểm tra

        if (account != null) {
            req.getSession().setAttribute("account", account);
            switch (role) {
                case "Human Resource Management":
                    resp.sendRedirect("employee/list");
                    break;
                case "Workshop Manager":
                    resp.sendRedirect("schedualcampain/list");
                    break;
                case "Produce Planner":
                    resp.sendRedirect("productionplan/list");
                    break;
                case "Accountant":
                    resp.sendRedirect("accounting/calculate_salary");
                    break;
                default:
                    resp.sendError(403, "Bạn không có quyền truy cập tính năng này!");
                    break;
            }
        } else {
            req.getSession().setAttribute("err", "Username, password hoặc role không đúng!");
            req.getSession().setAttribute("username", user);
            req.getSession().setAttribute("role", role);
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
