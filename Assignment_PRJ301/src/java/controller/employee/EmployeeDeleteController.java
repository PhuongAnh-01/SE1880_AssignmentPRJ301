/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.employee;

import controller.accesscontrol.BaseRBACController;
import dal.EmployeeDao;
import entity.accesscontrol.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Employee;

/**
 *
 * @author ADMIN
 */
public class EmployeeDeleteController extends BaseRBACController {
   
    
    

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        resp.sendError(403, "You can't access the feature using this way!!!");

    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Employee e = new Employee();
        e.setId(id);
        EmployeeDao db = new EmployeeDao();
        db.delete(e);
        resp.sendRedirect("list");


    }

}
