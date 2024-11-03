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
                        <th>Số Lượng Cần thực Hiện</th>

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
                                <a href="update?id=${p.plan.id}" class="btn btn-primary btn-sm">
                                    <i class="fas fa-pencil-alt"></i> <!-- Biểu tượng Edit -->
                                </a>
                                <button type="button" class="btn btn-danger btn-sm" onclick="removePlan(${p.plan.id})">
                                    <i class="fas fa-trash-alt"></i> <!-- Biểu tượng Remove -->
                                </button>

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
    </body>
</html>



