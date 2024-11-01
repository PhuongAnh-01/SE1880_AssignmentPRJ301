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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import model.Plan;
import model.PlanCampain;

/**
 *
 * @author ADMIN
 */
public class SchedualCampainCreateController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        int plid = Integer.parseInt(req.getParameter("PlanID"));
        int pcid = Integer.parseInt(req.getParameter("PlanCampnID"));

        PlanDao planDB = new PlanDao();
        Plan plan = planDB.get(plid);//

        PlanCampainDao planCampainDB = new PlanCampainDao();
        PlanCampain planCampain = planCampainDB.get(pcid);//

        LocalDate startDate = plan.getStart().toLocalDate();
        LocalDate endDate = plan.getEnd().toLocalDate();
        List<LocalDate> dates = new ArrayList<>();
        while (!startDate.isAfter(endDate)) {
            dates.add(startDate);
            startDate = startDate.plusDays(1);
        }

        req.setAttribute("plan", plan);//done
        req.setAttribute("planCampain", planCampain);//done
        req.setAttribute("dates", dates);
        req.getRequestDispatcher("create.jsp").forward(req, resp);

    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
//        SchedualCampaignDao scdb = new SchedualCampaignDao();
//        PlanCampainDao pcdb = new PlanCampainDao();
//        int id = Integer.parseInt(req.getParameter("PlanCampnID"));
//        PlanCampain planCampain = pcdb.get(id);
//        String[] dates = req.getParameterValues("date"); 
//        
//        for(String date: dates){
//            for (int shift = 1; shift <= 3; shift++) {
//                String paramName = "quantity" + date + "k"+ shift;
//                String quantityK = req.getParameter(paramName);
//                
//                if(quantityK != null && !quantityK.isEmpty()) {
//                    int quantity = Integer.parseInt(quantityK);
//                    
//                    SchedualCampaign schedual = new SchedualCampaign();
//                    schedual.setPlancampain(planCampain);
//                    schedual.setDate(Date.valueOf(date));
//                    schedual.setShift("K" + shift);
//                    schedual.setQuantity(quantity);
//                    
//                    scdb.insert(schedual);
//                }
//            }
//        }
//        resp.sendRedirect("../schedualcampain/list");

        SchedualCampaignDao scdb = new SchedualCampaignDao();
        PlanCampainDao pcdb = new PlanCampainDao();
        int id = Integer.parseInt(req.getParameter("PlanCampnID"));
        PlanCampain planCampain = pcdb.get(id);
        String[] dates = req.getParameterValues("date");

        //tạo 1 arraylist chứa tất cả các entity của SchedualCampaign
        ArrayList<SchedualCampaign> schedules = new ArrayList<>();

        for (String date : dates) {
            for (int shift = 1; shift <= 3; shift++) {
                String paramName = "quantity" + date + "k" + shift;
                String quantityK = req.getParameter(paramName);

                if (quantityK != null && !quantityK.isEmpty()) {
                    int quantity = Integer.parseInt(quantityK);

                    SchedualCampaign schedual = new SchedualCampaign();
                    schedual.setPlancampain(planCampain);
                    schedual.setDate(Date.valueOf(date));
                    schedual.setShift("K" + shift);
                    schedual.setQuantity(quantity);
                    
                    
                    //khi set xog dữ liệu thì dùng phương thức add của arraylist để thêm dữ liệu
                    schedules.add(schedual);
                }
            }
        }

        // sau khi add xong r thì dùng phương thức insert vừa tạo ở file SchedualCampaignDao để thêm tất cả các dữ liệu
        scdb.insert(schedules);

        resp.sendRedirect("../schedualcampain/list");
    }

}
