/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.schedualcampain;

import controller.accesscontrol.BaseRBACController;
import dal.PlanCampainDao;
import dal.SchedualCampaignDao;
import entity.accesscontrol.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.SchedualCampaign;
import java.sql.Date;
import model.PlanCampain;

/**
 *
 * @author ADMIN
 */
public class SchedualCampainCreateController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
//        int planID = Integer.parseInt(req.getParameter("PlanID"));
//        SchedualCampaignDao scheduleDao = new SchedualCampaignDao();
//        List<SchedualCampaign> schedules = scheduleDao.listPlanCamp(planID);
//
//        req.setAttribute("schedules", schedules);
        req.getRequestDispatcher("../schedualcampain/create.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        int planCampnID = Integer.parseInt(req.getParameter("planCampnID"));
        Date date = Date.valueOf(req.getParameter("date"));
        int shift = Integer.parseInt(req.getParameter("shift"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        PlanCampainDao planCampainDao = new PlanCampainDao();
        PlanCampain planCampain = planCampainDao.get(planCampnID);

        SchedualCampaign schedule = new SchedualCampaign(0, planCampain, date, shift, quantity);
        SchedualCampaignDao scheduleDao = new SchedualCampaignDao();
        scheduleDao.insert(schedule);

        resp.sendRedirect("schedual_campaign_list?planCampnID=" + planCampnID);
    }

}
