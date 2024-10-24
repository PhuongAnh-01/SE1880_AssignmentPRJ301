<%-- 
    Document   : list
    Created on : Oct 25, 2024, 2:29:19 AM
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
                    <th>Hành động</th>
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
                        <td>
                            <a href="create?planID=${plan.id}" class="btn btn-primary">Tạo Lịch</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
