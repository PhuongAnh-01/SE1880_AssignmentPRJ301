/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.schedualemployee;

import controller.accesscontrol.BaseRBACController;
import dal.SchedualEmployeeDao;
import entity.accesscontrol.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.SchedualEmployee;

/**
 *
 * @author ADMIN
 */
public class SchedualEmployeeListController extends BaseRBACController  {

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        SchedualEmployeeDao seDao = new SchedualEmployeeDao();
        ArrayList<SchedualEmployee> list = seDao.list();

        req.setAttribute("list", list);
        req.getRequestDispatcher("../schedualemployee/list.jsp").forward(req, resp);
    } 

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    }

    
   


