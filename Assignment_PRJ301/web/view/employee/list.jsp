<%-- 
    Document   : listemp
    Created on : Oct 13, 2024, 11:44:28 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <script>
            function removeEmployee(id){
                var result = confirm("Are you sure you want to delete this employee?");
                if(result) {
                    document.getElementById("removeEmployee"+id).submit();
                }
            }
        </script>
    </head>
    <body>
        <div class="container mt-5">
            <div class="d-flex justify-content-between mb-3">
                <h2>Employee List</h2>
                <form action="create" method="GET">
                    <button type="submit" class="btn btn-success">Create New Employee</button>
                </form>
                <form action="filter" method="GET" style="display: inline;">
                <button type="submit" class="btn btn-info">Filter Employee</button>
            </form>
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
                            <td>${e.dob}</td>
                            <td>${e.role.name}</td>
                            <td>${e.department}</td>
                            <td>
                                <a href="update?id=${e.id}" class="btn btn-primary btn-sm">
                                    <i class="fas fa-pencil-alt"></i> <!-- Biểu tượng Edit -->
                                </a>
                                
                                <button type="button" class="btn btn-danger btn-sm" onclick="removeEmployee(${e.id})">
                                    <i class="fas fa-trash-alt"></i> <!-- Biểu tượng Remove -->
                                </button>

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