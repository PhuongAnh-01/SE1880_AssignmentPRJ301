/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import dal.DepartmentDao;
import dal.EmployeeDao;
import dal.RoleDao;
import entity.accesscontrol.Role;
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
public class EmployeeFilterController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String raw_id = request.getParameter("id");
        String raw_name = request.getParameter("name");
        String raw_gender = request.getParameter("gender");
        String raw_address = request.getParameter("address");
        String raw_from = request.getParameter("from");
        String raw_to = request.getParameter("to");
        String raw_roleId = request.getParameter("roleId");
        String raw_did = request.getParameter("did");

        // validate
        // object binding
        Integer id = (raw_id != null && !raw_id.isBlank()) ? Integer.parseInt(raw_id) : null;
        String name = raw_name;
        Boolean gender = (raw_gender != null && !raw_gender.equals("both")) ? raw_gender.equals("male") : null;
        String address = raw_address;
        Date from = (raw_from != null && !raw_from.isBlank()) ? Date.valueOf(raw_from) : null;
        Date to = (raw_to != null && !raw_to.isBlank()) ? Date.valueOf(raw_to) : null;
        Integer roleId = (raw_roleId != null && !raw_roleId.equals("-1")) ? Integer.parseInt(raw_roleId) : null;
        Integer did = (raw_did != null && !raw_did.equals(-1))?Integer.parseInt(raw_did): null;
        
        EmployeeDao dbEmp = new EmployeeDao();
        DepartmentDao dbDept = new DepartmentDao();
        RoleDao dbRole = new RoleDao();
        ArrayList<Employee> emps = dbEmp.search(id, name, gender, address, from, to, did, roleId);
        request.setAttribute("emps", emps);
        
        ArrayList<Department> depts = dbDept.list();
        request.setAttribute("depts", depts);
        
        ArrayList<Role> roles = dbRole.list();
        request.setAttribute("roles", roles);
        request.getRequestDispatcher("../view/employee/filter.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
