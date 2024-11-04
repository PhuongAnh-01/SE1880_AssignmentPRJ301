<%-- 
    Document   : list
    Created on : Oct 25, 2024, 2:29:19 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mytag" uri="/WEB-INF/tlds/customtag.tld" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Danh sách Kế hoạch Sản xuất</title>
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
            .logout-button {
                position: absolute;
                top: 20px;
                left: 20px;
                background-color: #8b1e1e;
                border: none;
                font-weight: bold;
            }
            h2 {
                color: #5a3e36;
                font-weight: 600;
                margin-bottom: 30px;
            }
            .btn-primary {
                background-color: #5a3e36;
                border: none;
                border-radius: 20px;
                padding: 5px 10px;
                font-weight: bold;
                font-size: 0.875rem;
                transition: background-color 0.3s ease;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            }
            .btn-primary.btn-sm {
                padding: 5px 10px;
            }
            .btn-primary:hover {
                background-color: #4e342e;
            }
            .table {
                width: 100%;
                border-radius: 15px;
                overflow: hidden;
                border-collapse: collapse;
                box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            }
            th {
                background-color: #e6ccb2;
                color: #5a3e36;
                text-transform: uppercase;
                padding: 10px;
            }
            td {
                padding: 10px;
                text-align: center;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #eaeaea;
            }
            .detail-button {
                position: absolute;
                top: 20px;
                right: 20px; /* Đặt nút ở góc trên bên phải */
                background-color: #8b1e1e;
                border: none;
                font-weight: bold;
            }

        </style>
    </head>
    <body>
        <a href="${pageContext.request.contextPath}/schedualcampain/detail" class="btn btn-danger detail-button">Detail Schedual</a>

        <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger logout-button">Logout</a>
        <div class="container mt-5">
            <div class="d-flex justify-content-between mb-3">
                <h2>Danh sách Kế hoạch Sản xuất</h2>
            </div>

            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Plan ID</th>
                        <th>Plan Name</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Department</th>
                        <th>Quantity Required</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${requestScope.plans}">
                        <tr>
                            <td>${p.plan.id}</td>
                            <td>${p.plan.name}</td>
                            <td><mytag:ToVietnameseDate value="${p.plan.start}" /></td>
                            <td><mytag:ToVietnameseDate value="${p.plan.end}" /></td>
                            <td>${p.plan.dept.name}</td>
                            <td>${p.quantity}</td>
                            <td>
                                <a href="../schedualcampain/create?PlanID=${p.plan.id}&PlanCampnID=${p.id}" class="btn btn-primary btn-sm">
                                    <i class="fas fa-calendar-plus"></i> Create Schedule
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
    </body>
</html>
