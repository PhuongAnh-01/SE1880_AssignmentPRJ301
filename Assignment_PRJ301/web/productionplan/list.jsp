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
</head>
<body>
    <h2>Danh sách Kế hoạch Sản xuất</h2>
    <table border="1">
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
    </table>
</body>
</html>



