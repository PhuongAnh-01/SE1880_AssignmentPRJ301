<%-- 
    Document   : create
    Created on : Oct 16, 2024, 5:35:56 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Employee</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                position: relative;
            }
            .form-container {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                width: 100%;
            }
            .back-button {
                position: absolute;
                top: 20px;
                left: 20px;
            }
        </style>
    </head>
    <body>
        <!-- Nút Back nằm ở góc trên bên trái -->
        <a href="list" class="btn btn-secondary back-button">Back</a>

        <!-- Form vẫn ở giữa màn hình -->
        <div class="form-container">
            <h2 class="text-center mb-4">Create New Employee</h2>
            <form action="create" method="POST">

                <!-- Tên nhân viên -->
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name">
                </div>

                <!-- Giới tính -->
                <div class="mb-3">
                    <label class="form-label">Gender</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="male" checked>
                        <label class="form-check-label" for="male">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="female" value="female">
                        <label class="form-check-label" for="female">Female</label>
                    </div>
                </div>

                <!-- Ngày sinh -->
                <div class="mb-3">
                    <label for="dob" class="form-label">Date of Birth</label>
                    <input type="date" class="form-control" id="dob" name="dob">
                </div>

                <!-- Địa chỉ -->
                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" class="form-control" id="address" name="address">
                </div>

                <!-- Vai trò -->
                <div class="mb-3">
                    <label for="role" class="form-label">Role</label>
                    <select class="form-select" id="role" name="roleId">
                        <c:forEach items="${requestScope.roles}" var="r">
                            <option value="${r.id}">${r.name}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Phòng ban -->
                <div class="mb-3">
                    <label for="did" class="form-label">Department</label>
                    <select class="form-select" id="did" name="did">
                        <c:forEach items="${requestScope.depts}" var="d">
                            <option value="${d.id}">${d.name}</option>
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
