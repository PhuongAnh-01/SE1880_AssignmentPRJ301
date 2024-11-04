<%-- 
    Document   : list
    Created on : Oct 22, 2024, 2:26:00 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tlds/customtag.tld" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
            }
            .btn-success {
                background-color: #b9855d;
                border: none;
                border-radius: 20px;
                padding: 10px 20px;
                font-weight: bold;
                transition: background-color 0.3s ease;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            }
            .btn-success:hover {
                background-color: #a76f4c;
            }
            .btn-primary {
                background-color: #5a3e36;
                border: none;
                margin-right: 5px;
                border-radius: 20px;
                padding: 5px 15px;
                font-weight: bold;
                transition: background-color 0.3s ease;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            }
            .btn-primary:hover {
                background-color: #4e342e;
            }
            .btn-danger {
                background-color: #b74a4a;
                border: none;
                border-radius: 20px;
                padding: 5px 15px;
                font-weight: bold;
                transition: background-color 0.3s ease;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            }
            .btn-danger:hover {
                background-color: #a04141;
            }
            .table {
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            }
            th {
                background-color: #e6ccb2;
                color: #5a3e36;
            }
        </style>
        <script>
            function removePlan(id) {
                var result = confirm("Are you sure you want to delete this plan?");
                if (result) {
                    document.getElementById("removePlan" + id).submit();
                }
            }
        </script>
    </head>
    <body>
        <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger logout-button">Logout</a>
        <div class="container mt-5">
            <div class="d-flex justify-content-between mb-3">
                <h2>Production Plan List</h2>
                <!-- Nút tạo mới plan -->
                <a href="create" class="btn btn-success">Create New Plan</a> 
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
                    <c:forEach var="p" items="${plans}">
                        <tr>
                            <td>${p.plan.id}</td>
                            <td>${p.plan.name}</td>

                            <td><mytag:ToVietnameseDate value="${p.plan.start}" /></td>
                            <td><mytag:ToVietnameseDate value="${p.plan.end}" /></td>
                            <td>${p.plan.dept.name}</td>
                            <td>${p.quantity}</td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <button type="button" class="btn btn-danger btn-sm" onclick="removePlan(${p.plan.id})">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                                <form id="removePlan${p.plan.id}" action="delete" method="POST" style="display:none;">
                                    <input type="hidden" name="planID" value="${p.plan.id}"/>
                                </form>
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
