<%-- 
    Document   : create
    Created on : Oct 17, 2024, 5:25:52 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="create" method="POST">
            Plan title: <input type="text" name="name"/> <br/>
            From: <input type="date" name="from"/>
            To: <input type="date" name="to"/><br/>
            Workshop: <select name="did">
                <c:forEach items="${requestScope.depts}" var="d"> <!-- depts trong departmentdao -->
                     <option value="${d.id}">${d.name}</option>
                </c:forEach>
               
            </select><br/>
            <table border="1px">
                <tr>
                    <td> Product </td>
                    <td> Quantity </td>
                    <td> Cost </td>
                </tr>
                
                <c:forEach items="${requestScope.products}" var ="p"> <!-- lay products trong productdao-->
                    <tr>
                        <td>${p.name}<input type="hidden" value="${p.id}"name="pid"/></td>
                        <td><input type="text" name="quantity${p.id}"></td>
                         <td><input type="text" name="cost${p.id}"></td>
                    </tr>
                    
                </c:forEach>
            </table>

            <input type="submit" name="Save"/>            
          </form>
    </body>
</html>
