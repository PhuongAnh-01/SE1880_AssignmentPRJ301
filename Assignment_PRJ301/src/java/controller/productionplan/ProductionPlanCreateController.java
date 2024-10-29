/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.productionplan;

import controller.accesscontrol.BaseRBACController;
import dal.DepartmentDao;
import dal.PlanDao;
import dal.ProductDao;
import entity.accesscontrol.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import model.Department;
import model.Plan;
import model.PlanCampain;
import model.Product;

/**
 *
 * @author ADMIN
 */
public class ProductionPlanCreateController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        ProductDao dbProduct = new ProductDao();
        DepartmentDao dbDepts = new DepartmentDao();

        req.setAttribute("products", dbProduct.list());
        req.setAttribute("depts", dbDepts.get("WS"));
        // -> 2 list trog request scope
        req.getRequestDispatcher("../productionplan/create.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        Plan plan = new Plan();
        plan.setName(req.getParameter("name")); // jsp
        plan.setStart(Date.valueOf(req.getParameter("from")));
        plan.setEnd(Date.valueOf(req.getParameter("to")));
        
        Department d = new Department();
        d.setId(Integer.parseInt(req.getParameter("did")));
        plan.setDept(d);
        
       
        String[] pids = req.getParameterValues("pid");
        for (String pid : pids) { // qua tung obj trong product 
            PlanCampain c = new PlanCampain();

            Product p = new Product();
            p.setId(Integer.parseInt(pid));
            c.setProduct(p);
            c.setPlan(plan);

            String raw_quantity = req.getParameter("quantity" + pid);
            String raw_cost = req.getParameter("cost" + pid);

            c.setQuantity(raw_quantity != null && raw_quantity.length() > 0 ? Integer.parseInt(raw_quantity) : 0);
            // khong nhap thi tra ve 0
            c.setCost(raw_cost != null && raw_cost.length() > 0 ? Integer.parseInt(raw_cost) : 0);

            // campan nay chi dua dua vao plann neu
            if (c.getQuantity() > 0 && c.getCost() > 0) {
                plan.getCampains().add(c);
            }
        }
        ProductDao dbProduct = new ProductDao();
        DepartmentDao dbDepts = new DepartmentDao();
        if (plan.getCampains().size() > 0) { // neu plan ma 
            PlanDao db = new PlanDao();
            db.insert(plan);
            resp.sendRedirect("list");
        } else {
            
            req.setAttribute("plan", plan);
            req.setAttribute("products", dbProduct.list());
            req.setAttribute("depts", dbDepts.get("WS"));
            req.setAttribute("message", "Your plan does not have any products or campaigns!");
            req.getRequestDispatcher("../productionplan/create.jsp").forward(req, resp);
        }

    }

}
