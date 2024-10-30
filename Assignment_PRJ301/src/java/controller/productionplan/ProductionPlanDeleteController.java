/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.productionplan;

import controller.accesscontrol.BaseRBACController;
import dal.PlanCampainDao;
import dal.PlanDao;
import entity.accesscontrol.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Plan;

/**
 *
 * @author ADMIN
 */
public class ProductionPlanDeleteController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        resp.sendError(403, "You can't access the feature using this way!!!");
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        try {
            // Lấy planID từ request
            int planID = Integer.parseInt(req.getParameter("planID"));

            // Tạo đối tượng Plan và gán ID
            Plan plan = new Plan();
            plan.setId(planID);

            PlanCampainDao planCampainDao = new PlanCampainDao();
            planCampainDao.deleteByPlanID(planID);
            // Khởi tạo PlanDao và xóa Plan
            PlanDao planDao = new PlanDao();
            planDao.delete(plan);

            // Chuyển hướng về trang danh sách sau khi xóa
            resp.sendRedirect("list");

        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Plan ID format.");
        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while deleting the plan.");
        }
    }

}
