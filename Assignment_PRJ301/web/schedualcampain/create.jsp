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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background: linear-gradient(to right, #f0e6d6, #e6ccb2);
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
                padding: 20px;
            }
            .container {
                background-color: #fff;
                padding: 40px;
                border-radius: 25px;
                box-shadow: 0px 8px 30px rgba(0, 0, 0, 0.1);
                max-width: 1200px;
                width: 100%;
            }
            h1 {
                text-align: center;
                color: #5a3e36;
                font-weight: 600;
                margin-bottom: 30px;
            }
            h3, h4 {
                color: #5a3e36;
            }
            table {
                width: 100%;
                border-radius: 15px;
                overflow: hidden;
                border-collapse: collapse;
                background-color: #fff;
                box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }
            th {
                background-color: #e6ccb2;
                color: #5a3e36;
                text-transform: uppercase;
            }
            td, th {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: center;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #eaeaea;
            }
            .submit-btn {
                background-color: #b9855d;
                color: white;
                border: none;
                border-radius: 20px;
                padding: 10px 20px;
                font-weight: bold;
                transition: background-color 0.3s ease;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
                cursor: pointer;
                display: block;
                margin: 0 auto;
            }
            .submit-btn:hover {
                background-color: #a76f4c;
            }
            
            .back-button {
                position: absolute;
                top: 20px;
                left: 20px;
                background-color: #b9855d;
                border: none;
                border-radius: 20px;
                padding: 10px 20px;
                font-weight: bold;
                transition: background-color 0.3s ease;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            }
            .back-button:hover {
                background-color: #a76f4c;
            }
            
        </style>
    </head>
    <body>
        <a href="list" class="btn back-button">Back</a>
        <div class="container mt-5">
            <h1>Schedule Campaign</h1>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>

            <h3>Plan: ${plan.name}</h3>
            <h4>Quantity: ${planCampain.quantity}</h4>

            <form action="create" method="POST">
                <input type="hidden" name="PlanCampnID" value="${planCampain.id}"/>
                <table class="table table-striped table-bordered">
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
                                <td><input type="number" class="form-control" name="quantity${date}k1" min="0" required/></td>
                                <td><input type="number" class="form-control" name="quantity${date}k2" min="0" required/></td>
                                <td><input type="number" class="form-control" name="quantity${date}k3" min="0" required/></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <input type="submit" value="Save" class="submit-btn"/>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
    </body>
</html>
