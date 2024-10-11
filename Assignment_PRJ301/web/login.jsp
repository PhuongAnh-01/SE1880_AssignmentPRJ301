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
        <title>Login Page</title>
    </head>
    <body>
        <form action="login" method="POST">
            Username: <input type="text" name="username"/> <br/>
            Password: <input type="password" name="password"/> <br/>
            <input type="submit" name="login" value="Login"/>
        </form>
        
        <!-- Hiển thị thông báo lỗi nếu có -->
        <c:if test="${not empty sessionScope.err}">
            <p style="color:red;">${sessionScope.err}</p>
            <!-- Xóa thông báo lỗi ngay sau khi hiển thị -->
            <c:remove var="err" scope="session" />
        </c:if>
    </body>
</html>
