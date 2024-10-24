/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.schedualcampain;

import controller.accesscontrol.BaseRBACController;
import dal.PlanDao;
import entity.accesscontrol.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Plan;

/**
 *
 * @author ADMIN
 */
public class SchedualCampainListController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        PlanDao planDao = new PlanDao();
        List<Plan> plans = planDao.list();  // Lấy danh sách các plan đã bao gồm thông tin tổng hợp

        // Gửi dữ liệu tới JSP để hiển thị
        req.setAttribute("plans", plans);
        req.getRequestDispatcher("../schedualcampain/list.jsp").forward(req, resp);

    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {

    }

}
