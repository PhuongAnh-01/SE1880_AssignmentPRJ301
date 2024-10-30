/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.productionplan;

import controller.accesscontrol.BaseRBACController;
import dal.DepartmentDao;
import dal.PlanCampainDao;
import dal.PlanDao;
import dal.ProductDao;
import entity.accesscontrol.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Department;
import model.Plan;
import model.PlanCampain;
import java.sql.*;
import model.Product;

/**
 *
 * @author ADMIN
 */
public class ProductionPlanUpdateController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        PlanDao p = new PlanDao();
        Plan pl = p.get(id);

        DepartmentDao dbDepts = new DepartmentDao();

        if (pl != null) {
            DepartmentDao dbDept = new DepartmentDao();

            ArrayList<Department> depts = dbDept.list();
            PlanCampainDao pcdao = new PlanCampainDao();
            ProductDao productDao = new ProductDao();
            ArrayList<PlanCampain> pc = pcdao.list();
            ArrayList<Product> products = productDao.list();

            req.setAttribute("products", products);
            req.setAttribute("depts", dbDepts.get("WS"));
            req.setAttribute("pl", pl);
            req.setAttribute("pc", pc);
            req.getRequestDispatcher("../productionplan/update.jsp").forward(req, resp);
        } else {
            resp.sendError(404, "this plan does not exist!");
        }

    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        String raw_id = req.getParameter("id");
        String raw_name = req.getParameter("name");
        String raw_start = req.getParameter("start");
        String raw_end = req.getParameter("end");
        String raw_did = req.getParameter("did");
        String raw_quantity = req.getParameter("quantity");

        Plan pl = new Plan();
        pl.setId(Integer.parseInt(raw_id));
        pl.setName(raw_name);
        pl.setStart(Date.valueOf(raw_start));
        pl.setEnd(Date.valueOf(raw_end));

        Department d = new Department();
        d.setId(Integer.parseInt(raw_did));
        pl.setDept(d);

        PlanCampain pc = new PlanCampain();
        pc.setQuantity(Integer.parseInt(raw_quantity));
        String[] pids = req.getParameterValues("pid");
        for (String pid : pids) {
            PlanCampain campain = new PlanCampain();
            Product product = new Product();
            product.setId(Integer.parseInt(pid));
            campain.setProduct(product);
            campain.setQuantity(Integer.parseInt(req.getParameter("quantity" + pid)));
            campain.setCost(Integer.parseInt(req.getParameter("cost" + pid)));
            pl.getCampains().add(campain);  // Thêm hoặc cập nhật campain
        }
        PlanDao p = new PlanDao();
        p.update(pl);

        resp.sendRedirect(req.getContextPath() + "/productionplan/list");
    }

}
