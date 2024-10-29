/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.schedualcampain;

import controller.accesscontrol.BaseRBACController;
import dal.PlanCampainDao;
import dal.PlanDao;
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
import java.util.ArrayList;
import java.util.Calendar;
import model.Plan;
import model.PlanCampain;

/**
 *
 * @author ADMIN
 */

public class SchedualCampainCreateController extends BaseRBACController {

    private List<Date> generateDateRange(Date start, Date end) {
        List<Date> dates = new ArrayList<>();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(start);

        while (!calendar.getTime().after(end)) {
            dates.add(new Date(calendar.getTimeInMillis()));
            calendar.add(Calendar.DATE, 1);  // Move to the next day
        }
        return dates;
    }

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        String planIDStr = req.getParameter("planID");
        if (planIDStr == null || planIDStr.isEmpty()) {
            // Nếu không có PlanID, chuyển hướng đến trang lỗi hoặc trả về thông báo lỗi
            req.setAttribute("error", "PlanID is missing");
            req.getRequestDispatcher("../schedualcampain/error.jsp").forward(req, resp);
            return;
        }

        // Thử chuyển đổi PlanID thành số nguyên
        int planID;
        try {
            planID = Integer.parseInt(planIDStr);
        } catch (NumberFormatException e) {
            // Nếu PlanID không phải là số nguyên hợp lệ, xử lý ngoại lệ
            req.setAttribute("error", "Invalid PlanID format");
            req.getRequestDispatcher("../schedualcampain/error.jsp").forward(req, resp);
            return;
        }

        // Lấy thông tin kế hoạch
        PlanDao planDao = new PlanDao();
        Plan plan = planDao.get(planID);

        if (plan == null) {
            // Xử lý lỗi nếu không tìm thấy kế hoạch
            req.setAttribute("error", "Plan not found");
            req.getRequestDispatcher("../schedualcampain/error.jsp").forward(req, resp);
            return;
        }

        // Các phần khác của logic xử lý như cũ
        List<Date> dates = generateDateRange(plan.getStart(), plan.getEnd());

        PlanCampainDao planCampainDao = new PlanCampainDao();
        PlanCampain planCampain = planCampainDao.get(planID);

        if (planCampain == null) {
            req.setAttribute("error", "Plan Campaign not found");
            req.getRequestDispatcher("../schedualcampain/error.jsp").forward(req, resp);
            return;
        }

        SchedualCampaignDao schedualCampaignDao = new SchedualCampaignDao();
        List<SchedualCampaign> schedules = schedualCampaignDao.listPlanCamp(planCampain.getId());

        req.setAttribute("plan", plan);
        req.setAttribute("dates", dates);
        req.setAttribute("quantityPerShift", planCampain.getQuantity());
        req.setAttribute("schedules", schedules);

        req.getRequestDispatcher("../schedualcampain/create.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        int planCampnID = Integer.parseInt(req.getParameter("planCampnID"));
        Date date = Date.valueOf(req.getParameter("date"));
        int shift = Integer.parseInt(req.getParameter("shift"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        // Lấy thông tin chiến dịch
        PlanCampainDao planCampainDao = new PlanCampainDao();
        PlanCampain planCampain = planCampainDao.get(planCampnID);

        if (planCampain == null) {
            // Xử lý lỗi nếu không tìm thấy PlanCampain
            req.setAttribute("error", "Plan Campaign not found");
            req.getRequestDispatcher("../schedualcampain/error.jsp").forward(req, resp);
            return;
        }

        // Tạo lịch mới cho chiến dịch
        SchedualCampaign schedule = new SchedualCampaign(0, planCampain, date, shift, quantity);
        SchedualCampaignDao scheduleDao = new SchedualCampaignDao();
        scheduleDao.insert(schedule);

        // Redirect về danh sách lịch
        resp.sendRedirect("schedual_campaign_list?planCampnID=" + planCampnID);
    }

}
