/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.productionplan;

import dal.DepartmentDao;
import dal.PlanDao;
import dal.ProductDao;
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
public class ProductionPlanCreateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDao dbProduct = new ProductDao();
        DepartmentDao dbDepts = new DepartmentDao();

        request.setAttribute("products", dbProduct.list());
        request.setAttribute("depts", dbDepts.get("WS"));
        // -> 2 list trog request scope
        request.getRequestDispatcher("../productionplan/create.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Plan plan = new Plan();
        plan.setName(request.getParameter("name")); // jsp
        plan.setStart(Date.valueOf(request.getParameter("from")));
        plan.setEnd(Date.valueOf(request.getParameter("to")));

        Department d = new Department();
        d.setId(Integer.parseInt(request.getParameter("did")));
        plan.setDept(d);

        String[] pids = request.getParameterValues("pid");
        for (String pid : pids) { // qua tung obj trong product 
            PlanCampain c = new PlanCampain();

            Product p = new Product();
            p.setId(Integer.parseInt(pid));
            c.setProduct(p);
            c.setPlan(plan);

            String raw_quantity = request.getParameter("quantity" + pid);
            String raw_cost = request.getParameter("cost" + pid);

            c.setQuantity(raw_quantity != null && raw_quantity.length() > 0 ? Integer.parseInt(raw_quantity) : 0);
            // khong nhap thi tra ve 0
            c.setCost(raw_cost != null && raw_cost.length() > 0 ? Integer.parseInt(raw_cost) : 0);

            // campan nay chi dua dua vao plann neu
            if (c.getQuantity() > 0 && c.getCost() > 0) {
                plan.getCampains().add(c);
            }
        }
        if (plan.getCampains().size() > 0) { // neu plan ma 
            PlanDao db = new PlanDao();
            db.insert(plan);
            response.getWriter().println("your plan has been added!");
        } else {
            response.getWriter().println("your plan dose not product/campain");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
