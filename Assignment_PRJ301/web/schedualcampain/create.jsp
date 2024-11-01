<%-- 
    Document   : sum
    Created on : Oct 24, 2024, 9:07:39 PM
    Author     : xuant
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Bảng Lịch Làm Việc</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f9f9f9;
            }
            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }
            h1 {
                text-align: center;
                color: #333;
                margin-bottom: 30px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
                background-color: #fff;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            }
            th, td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: center;
            }
            th {
                background-color: #4CAF50;
                color: white;
                text-transform: uppercase;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #eaeaea;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h1>Schedule Campaign</h1>
            <c:if test="${not empty error}">
                <div class="error-message">${error}</div>
            </c:if>

            <h3>Plan: ${plan.name}</h3>
            <h4>Quantity: ${planCampain.quantity}</h4>

            <form action="create" method="POST">
                <input type="hidden" name="PlanCampnID" value="${planCampain.id}"/>
                <table>
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Shift 1</th>
                            <th>Shift 2</th>
                            <th>Shift 3</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="date" items="${dates}">
                            <tr>
                                <td>
                                    <input type="hidden" name="date" value="${date}"/>
                                    ${date}
                                </td>
                                <td><input type="number" name="quantity${date}k1" min="0" required/></td>
                                <td><input type="number" name="quantity${date}k2" min="0" required/></td>
                                <td><input type="number" name="quantity${date}k3" min="0" required/></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
                <input type="submit" value="Save" class="submit-btn"/>
            </form>
        </div>
<input type="hidden" name="PlanCampnID" value="${planCampain.id}">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>