<%-- 
    Document   : listemp
    Created on : Oct 13, 2024, 11:44:28 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tlds/emp.tld" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background: linear-gradient(to right, #f0e6d6, #e6ccb2);
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
                padding: 20px;
            }
            .container {
                background-color: #fff;
                padding: 40px;
                border-radius: 25px;
                box-shadow: 0px 8px 30px rgba(0, 0, 0, 0.1);
                max-width: 1200px;
                width: 100%;
            }
            .logout-button {
                position: absolute;
                top: 20px;
                left: 20px;
                background-color: #8b1e1e;
                border: none;
                font-weight: bold;
            }
            h2 {
                font-weight: 600;
                color: #5a3e36;
                text-align: center;
                margin-bottom: 30px;
            }
            .table {
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            }
            th {
                background-color: #e6ccb2;
                color: #5a3e36;
            }
            .btn {
                border-radius: 20px;
                transition: background-color 0.3s ease, box-shadow 0.3s ease;
            }
            .btn-success {
                background-color: #b9855d;
                border: none;
            }
            .btn-success:hover {
                background-color: #a76f4c;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            }
            .btn-info {
                background-color: #d4aa87;
                border: none;
                width: 180px;
            }
            .btn-info:hover {
                background-color: #c39373;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            }
            .btn-primary {
                background-color: #5a3e36;
                border: none;
                margin-right: 10px;
            }
            .btn-primary:hover {
                background-color: #4e342e;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            }
            .btn-danger {
                background-color: #b74a4a;
                border: none;
            }
            .btn-danger:hover {
                background-color: #a04141;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            }
        </style>
        <script>
            function removeEmployee(id) {
                var result = confirm("Are you sure you want to delete this employee?");
                if (result) {
                    document.getElementById("removeEmployee" + id).submit();
                }
            }
        </script>
    </head>
    <body>
        <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger logout-button">Logout</a>
        <div class="container">
            <div class="d-flex justify-content-between mb-4">
                <h2>Employee List</h2>
                <div>
                    <form action="create" method="GET" style="display: inline;">
                        <button type="submit" class="btn btn-success me-2">Create New Employee</button>
                    </form>
                    <form action="filter" method="GET" style="display: inline;">
                        <button type="submit" class="btn btn-info">Filter Employee</button>
                    </form>
                </div>
            </div>
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>Employee Name</th>
                        <th>Gender</th>
                        <th>Address</th>
                        <th>Date of Birth</th>
                        <th>Role</th>
                        <th>Department</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
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
                            <td><mytag:ToVietnameseDate value="${e.dob}" /></td>
                            <td>${e.role.name}</td>
                            <td>${e.department}</td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <a href="update?id=${e.id}" class="btn btn-primary btn-sm">
                                        <i class="fas fa-pencil-alt"></i>
                                    </a>
                                    <button type="button" class="btn btn-danger btn-sm" onclick="removeEmployee(${e.id})">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
                                </div>
                                <form id="removeEmployee${e.id}" action="delete" method="POST" style="display:none;">
                                    <input type="hidden" name="id" value="${e.id}"/>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
    </body>
</html>
