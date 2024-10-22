<%-- 
    Document   : login
    Created on : Oct 11, 2024, 12:37:47 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Production Management Login</title>
        <style>
            body {
                font-family: Arial, sans-serif;
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
            }
            .login-container h2 {
                text-align: center;
                margin-bottom: 20px;
            }
            .login-container input[type="text"],
            .login-container input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ddd;
                border-radius: 5px;
            }
            .login-container input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #28a745;
                border: none;
                color: white;
                border-radius: 5px;
                cursor: pointer;
            }
            .login-container input[type="submit"]:hover {
                background-color: #218838;
            }
            .error-message {
                color: red;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h2>Production Management Login</h2>
            <form action="login" method="POST">
                Username: <input type="text" name="username" value="${username != null ? username : ''}"/> <br/>
                Password: <input type="password" name="password" value=""/> <br/>
                Role: 
                <select name="role">
                    <option value="Human Resource Management" ${role == 'Human Resource Management' ? 'selected' : ''}>Human Resource Management</option>
                    <option value="Workshop Manager" ${role == 'Workshop Manager' ? 'selected' : ''}>Workshop Manager</option>
                    <option value="Produce Planner" ${role == 'Produce Planner' ? 'selected' : ''}>Produce Planner</option>
                    <option value="Accountant" ${role == 'Accountant' ? 'selected' : ''}>Accountant</option>
                </select>
                <input type="submit" name="login" value="Login"/>
            </form>

            <!-- Hiển thị thông báo lỗi nếu có -->
            <c:if test="${not empty sessionScope.err}">
                <p style="color:red;">${sessionScope.err}</p>
                <!-- Xóa thông báo lỗi ngay sau khi hiển thị -->
                <c:remove var="err" scope="session" />
            </c:if>
            <c:remove var="username" scope="session" />
            <c:remove var="role" scope="session" />
    </body>
</html>
