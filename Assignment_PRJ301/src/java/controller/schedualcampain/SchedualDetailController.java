/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.schedualcampain;

import controller.accesscontrol.BaseRBACController;
import dal.SchedualCampaignDao;
import dal.SchedualEmployeeDao;
import entity.accesscontrol.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.SchedualCampaign;

/**
 *
 * @author ADMIN
 */
public class SchedualDetailController extends BaseRBACController {

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        SchedualCampaignDao scDao = new SchedualCampaignDao();
        ArrayList<SchedualCampaign> tlist = scDao.list();

        req.setAttribute("tlist", tlist);
        req.getRequestDispatcher("../schedualcampain/detail.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
