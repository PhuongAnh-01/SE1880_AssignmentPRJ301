<%-- 
    Document   : login
    Created on : Oct 11, 2024, 12:37:47 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Production Management Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .login-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 15px rgba(0,0,0,0.1);
                max-width: 400px;
                width: 100%;
            }
            .error-message {
                color: red;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h2 class="text-center">Production Management Login</h2>
            <form action="login" method="POST">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" value="${username != null ? username : ''}">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>
                <div class="mb-3">
                    <label for="role" class="form-label">Role</label>
                    <select class="form-select" id="role" name="role">
                        <option value="Human Resource Management" ${role == 'Human Resource Management' ? 'selected' : ''}>Human Resource Management</option>
                        <option value="Workshop Manager" ${role == 'Workshop Manager' ? 'selected' : ''}>Workshop Manager</option>
                        <option value="Produce Planner" ${role == 'Produce Planner' ? 'selected' : ''}>Produce Planner</option>
                        <option value="Accountant" ${role == 'Accountant' ? 'selected' : ''}>Accountant</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary w-100">Login</button>
            </form>
            <c:if test="${not empty sessionScope.err}">
                <p class="error-message mt-3">${sessionScope.err}</p>
                <c:remove var="err" scope="session" />
            </c:if>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
