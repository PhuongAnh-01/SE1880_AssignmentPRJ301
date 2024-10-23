<%-- 
    Document   : update
    Created on : Oct 16, 2024, 1:54:12 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Employee</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .form-container {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h2 class="text-center mb-4">Update Employee</h2>
            <form action="update" method="POST">
                <!-- ID ẩn -->
                <input type="hidden" name="id" value="${requestScope.e.id}"/>

                <!-- Tên nhân viên -->
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="${requestScope.e.name}">
                </div>

                <!-- Giới tính -->
                <div class="mb-3">
                    <label class="form-label">Gender</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="male" ${requestScope.e.gender ? "checked" : ""}>
                        <label class="form-check-label" for="male">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="female" value="female" ${!requestScope.e.gender ? "checked" : ""}>
                        <label class="form-check-label" for="female">Female</label>
                    </div>
                </div>

                <!-- Ngày sinh -->
                <div class="mb-3">
                    <label for="dob" class="form-label">Date of Birth</label>
                    <input type="date" class="form-control" id="dob" name="dob" value="${requestScope.e.dob}">
                </div>

                <!-- Địa chỉ -->
                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" class="form-control" id="address" name="address" value="${requestScope.e.address}">
                </div>

                <!-- Phòng ban -->
                <div class="mb-3">
                    <label for="did" class="form-label">Department</label>
                    <select class="form-select" id="did" name="did">
                        <c:forEach items="${requestScope.depts}" var="d">
                            <option ${requestScope.e.dept.id eq d.id ? "selected" : ""} value="${d.id}">${d.name}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Nút lưu -->
                <button type="submit" class="btn btn-primary w-100">Save</button>
            </form>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
