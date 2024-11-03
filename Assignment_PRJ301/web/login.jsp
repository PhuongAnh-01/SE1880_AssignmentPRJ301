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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <style>
            body {
                display: flex;
                height: 100vh;
                margin: 0;
                font-family: 'Poppins', sans-serif;
                background: #f0e6d6;
            }
            .left-section {
                flex: 1;
                background: url('images/met.jpg') no-repeat center center;
                background-size: cover;
            }
            .right-section {
                flex: 1;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 20px;
                background-color: rgba(255, 255, 255, 0.8);
            }
            .login-container {
                background-color: #fff;
                padding: 50px 40px;
                border-radius: 25px;
                box-shadow: 0px 8px 30px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                width: 100%;
                text-align: center;
            }
            .login-container h2 {
                font-weight: 600;
                color: #5a3e36;
                margin-bottom: 30px;
            }
            .form-group {
                position: relative;
                margin-bottom: 25px;
            }
            .form-control {
                border-radius: 30px;
                padding-left: 45px;
                box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
            }
            .form-control:focus {
                box-shadow: 0 0 8px rgba(90, 62, 54, 0.5);
                border-color: #5a3e36;
            }
            .input-icon {
                position: absolute;
                top: 50%;
                left: 15px;
                transform: translateY(-50%);
                color: #5a3e36;
            }
            .btn-primary {
                background-color: #5a3e36;
                border: none;
                border-radius: 30px;
                padding: 10px 0;
                font-size: 1.1rem;
                font-weight: bold;
                transition: background-color 0.3s ease;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            }
            .btn-primary:hover {
                background-color: #4e342e;
            }
            .error-message {
                color: red;
                text-align: center;
                margin-top: 15px;
            }
        </style>
    </head>
    <body>
        <div class="left-section"></div>
        <div class="right-section">
            <div class="login-container">
                <h2>Production Management Login</h2>
                <form action="login" method="POST">
                    <div class="form-group">
                        <i class="fas fa-user input-icon"></i>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Username" value="${username != null ? username : ''}">
                    </div>
                    <div class="form-group">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <i class="fas fa-user-tag input-icon"></i>
                        <select class="form-control" id="role" name="role">
                            <option value="Human Resource Management" ${role == 'Human Resource Management' ? 'selected' : ''}>Human Resource Management</option>
                            <option value="Workshop Manager" ${role == 'Workshop Manager' ? 'selected' : ''}>Workshop Manager</option>
                            <option value="Produce Planner" ${role == 'Produce Planner' ? 'selected' : ''}>Produce Planner</option>
                            <option value="Accountant" ${role == 'Accountant' ? 'selected' : ''}>Accountant</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Login</button>
                </form>
                <c:if test="${not empty sessionScope.err}">
                    <p class="error-message">${sessionScope.err}</p>
                    <c:remove var="err" scope="session" />
                </c:if>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
    </body>
</html>
