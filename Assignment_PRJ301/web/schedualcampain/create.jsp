<%-- 
    Document   : sum
    Created on : Oct 24, 2024, 9:07:39 PM
    Author     : xuant
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>

<!DOCTYPE html>
<html>
<head>
    <title>Create Schedual Campaign</title>
</head>
<body>
    <h1>Schedule Campaign for Plan: ${planCampain.plan.planName}</h1>
    <p>Plan Duration: ${planCampain.plan.startDate} to ${planCampain.plan.endDate}</p>

    <form action="create" method="post">
        <table border="1">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Shift 1 (Products)</th>
                    <th>Shift 2 (Products)</th>
                    <th>Shift 3 (Products)</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Get the start and end date from the request
                    java.sql.Date startDate = (java.sql.Date) request.getAttribute("planCampain.plan.startDate");
                    java.sql.Date endDate = (java.sql.Date) request.getAttribute("planCampain.plan.endDate");
                    long daysBetween = (long) request.getAttribute("daysBetween");

                    // Generate table rows for each day between start and end date
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(startDate);

                    for (int i = 0; i <= daysBetween; i++) {
                        String currentDate = cal.getTime().toString();
                %>
                        <tr>
                            <td><%= currentDate %></td>
                            <td><input type="number" name="shift1_<%= i %>" min="0"></td>
                            <td><input type="number" name="shift2_<%= i %>" min="0"></td>
                            <td><input type="number" name="shift3_<%= i %>" min="0"></td>
                        </tr>
                <%
                        cal.add(Calendar.DAY_OF_MONTH, 1);
                    }
                %>
            </tbody>
        </table>
        <input type="submit" value="Create Schedule">
    </form>
</body>
</html>