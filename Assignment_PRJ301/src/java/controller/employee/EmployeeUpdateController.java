/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.employee;

import dal.DepartmentDao;
import dal.EmployeeDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import model.Department;
import model.Employee;

/**
 *
 * @author ADMIN
 */
public class EmployeeUpdateController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EmployeeUpdateController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EmployeeUpdateController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    int id = Integer.parseInt(request.getParameter("EmployeeID"));
        EmployeeDao db = new  EmployeeDao();
        Employee e = db.get(id);
        if(e!=null)
        {
            DepartmentDao dbDept = new DepartmentDao();
            ArrayList<Department> depts = dbDept.list();
            request.setAttribute("e", e);
            request.setAttribute("depts", depts);
            request.getRequestDispatcher("../view/employee/update.jsp").forward(request, response);
        }
        else
        {
            response.sendError(404,"this employee does not exist!");
        }
    
    }
    
    

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String raw_name = request.getParameter("name");
        String raw_gender = request.getParameter("gender");
        String raw_dob = request.getParameter("dob");
        String raw_address = request.getParameter("address");
        String raw_did = request.getParameter("did");

        //validate params
        //object binding
        Employee e = new Employee();
        e.setName(raw_name);
        e.setAddress(raw_address);
        e.setGender(raw_gender.equals("male"));
        e.setDob(Date.valueOf(raw_dob));

        Department d = new Department();
        d.setId(Integer.parseInt(raw_did));
        e.setDept(d);

       

        EmployeeDao db = new EmployeeDao();
        db.update(e);

        //return results to user
        response.getWriter().println("Done");



    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
