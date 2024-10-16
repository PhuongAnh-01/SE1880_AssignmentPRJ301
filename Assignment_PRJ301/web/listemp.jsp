<%-- 
    Document   : listemp
    Created on : Oct 13, 2024, 11:44:28 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1px">
            <tr>
                <th>Employee ID</th>
                <th>Employee Name</th>
                <th>Gender</th>
                <th>Address</th>
                <th>Dob</th>
                <th>Role Name</th>
                <th>Department Name</th>

            </tr>
            <c:forEach items="${emps}" var="e">
                <tr>
                    <td>${e.id}</td>
                    <td>${e.name}</td>
                    <td>
                        <c:choose>
                            <c:when test="${e.gender}">
                                Male
                            </c:when>
                            <c:otherwise>
                                Female
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${e.address}</td>
                    <td>${e.dob}</td>
                    <td>${e.role}</td>
                    <td>${e.department}</td>
                    <td><a href="update?id=${e.id}">Edit</a>
                </tr>
            </c:forEach>
        </table>



    </body>
</html>
