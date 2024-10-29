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
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f9f9f9; }
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
        h1 { text-align: center; color: #333; margin-bottom: 30px; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; background-color: #fff; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: center; }
        th { background-color: #4CAF50; color: white; text-transform: uppercase; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        tr:hover { background-color: #eaeaea; }
    </style>
</head>
<body>

    <div class="container">
        <h1>Lịch Làm Việc - ${plan.name}</h1>  <!-- Display plan name -->

        <table>
            <thead>
                <tr>
                    <th>Ngày</th>
                    <th>Ca</th>
                    <th>Sản xuất thùng</th> <!-- Column for product quantity -->
                </tr>
            </thead>
            <c:choose>
                <c:when test="${not empty dates}">
                    <tbody>
                        <c:forEach var="date" items="${dates}">
                            <c:forEach var="shift" begin="1" end="3">
                                <tr>
                                    <td><fmt:formatDate value="${date}" pattern="dd/MM/yyyy" /></td>
                                    <td>${shift}</td>
                                    <td>${quantityPerShift}</td>
                                </tr>
                                </c:forEach>
                        </c:forEach>
                    </tbody>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="3">Không có dữ liệu để hiển thị.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>