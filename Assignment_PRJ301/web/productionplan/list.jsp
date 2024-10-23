<%-- 
    Document   : list
    Created on : Oct 22, 2024, 2:26:00 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách Kế hoạch Sản xuất</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-between mb-3">
            <h2>Danh sách Kế hoạch Sản xuất</h2>
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
                    <th>Tổng Sản Lượng Đã Sản Xuất</th>
                    <th>Số Lượng Còn Lại</th>
                    <th>Trạng Thái</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="plan" items="${plans}">
                    <tr>
                        <td>${plan.id}</td>
                        <td>${plan.name}</td>
                        <td>${plan.start}</td>
                        <td>${plan.end}</td>
                        <td>${plan.dept.name}</td>
                        <td>${plan.totalProduced}</td>
                        <td>${plan.remainingQuantity}</td>
                        <td>${plan.status}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



