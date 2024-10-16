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
public class EmployeeCreateController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DepartmentDao db = new DepartmentDao();
        ArrayList<Department> depts = db.list();
        request.setAttribute("depts", depts);
        request.getRequestDispatcher("../view/employee/create.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//read parameters
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
        db.insert(e);

        //return results to user
        response.getWriter().println("Inserted " + e.getId());

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
