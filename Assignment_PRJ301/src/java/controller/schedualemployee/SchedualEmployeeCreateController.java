/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.schedualemployee;

import dal.SchedualEmployeeDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Employee;
import model.SchedualCampaign;
import model.SchedualEmployee;

/**
 *
 * @author ADMIN
 */
public class SchedualEmployeeCreateController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SchedualEmployeeCreateController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SchedualEmployeeCreateController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("../schedualemployee/create.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            // Retrieve parameters from request
            int employeeID = Integer.parseInt(request.getParameter("employeeID"));
            int scID = Integer.parseInt(request.getParameter("scID"));
            int schEmpID = Integer.parseInt(request.getParameter("schEmpID"));
            double quantity = Double.parseDouble(request.getParameter("quantity"));
            
            // Create DAO instance
            SchedualEmployeeDao dao = new SchedualEmployeeDao();
            
            // Check if the employee already exists for the same day and shift
            for (SchedualEmployee existing : dao.list()) {
                if (existing.getEmployee().getId()== employeeID && 
                    existing.getSchedualCampaign().getScID() == scID) {
                    request.setAttribute("error", "Cannot input");
//                    request.getRequestDispatcher("../schedualemployee/create").forward(request, response);
                    return;
                }
            }
            
            // Create new SchedualEmployee object
            Employee employee = new Employee();
            employee.setId(employeeID);
            
            SchedualCampaign schedualCampaign = new SchedualCampaign();
            schedualCampaign.setScID(scID);
            
            SchedualEmployee schedualEmployee = new SchedualEmployee();
            schedualEmployee.setSchEmpID(schEmpID);
            schedualEmployee.setEmployee(employee);
            schedualEmployee.setSchedualCampaign(schedualCampaign);
            schedualEmployee.setQuantity((int) quantity);
            
            // Insert the new record
            dao.insert(schedualEmployee);
            request.getRequestDispatcher("../schedualemployee/list").forward(request, response);
        }
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
