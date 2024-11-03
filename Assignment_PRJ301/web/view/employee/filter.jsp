<%-- 
    Document   : filter
    Created on : Oct 23, 2024, 9:43:04 AM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Filter Employees</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
                max-width: 800px;
                width: 100%;
            }
            h2, h3 {
                color: #5a3e36;
                font-weight: 600;
            }
            .btn-primary {
                background-color: #5a3e36;
                border: none;
                border-radius: 20px;
                padding: 10px 0;
                font-size: 1.1rem;
                font-weight: bold;
                transition: background-color 0.3s ease;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            }
            .btn-primary:hover {
                background-color: #4e342e;
            }
            .btn-secondary {
                background-color: #8b1e1e;
                border: none;
                font-weight: bold;
                border-radius: 20px;
            }
            .btn-secondary:hover {
                background-color: #7a1a1a;
            }
            .form-label {
                color: #5a3e36;
                font-weight: 500;
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
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <!-- Back Button -->
            <div class="mb-4">
                <a href="list" class="btn btn-secondary">Back to Employee List</a>
            </div>
            <h2 class="mb-4">Filter Employees</h2>
            
            <form action="filter" method="GET" class="border p-4 rounded shadow-sm mb-4">
                <div class="mb-3">
                    <label for="id" class="form-label">ID</label>
                    <input type="text" class="form-control" id="id" name="id" value="${param.id}">
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="${param.name}">
                </div>
                <div class="mb-3">
                    <label class="form-label">Gender</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" value="male"
                               ${param.gender ne null && param.gender eq "male" ? "checked" : ""}>
                        <label class="form-check-label">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" value="female"
                               ${param.gender ne null && param.gender eq "female" ? "checked" : ""}>
                        <label class="form-check-label">Female</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" value="both"
                               ${param.gender eq null or param.gender eq "both" ? "checked" : ""}>
                        <label class="form-check-label">Both</label>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" class="form-control" id="address" name="address" value="${param.address}">
                </div>
                <div class="mb-3">
                    <label class="form-label">Date of Birth</label>
                    <div class="row">
                        <div class="col">
                            <input type="date" class="form-control" name="from" value="${param.from}" placeholder="From">
                        </div>
                        <div class="col">
                            <input type="date" class="form-control" name="to" value="${param.to}" placeholder="To">
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="roleId" class="form-label">Role</label>
                    <select class="form-select" id="roleId" name="roleId">
                        <option value="-1">----------ALL------------</option>
                        <c:forEach items="${requestScope.roles}" var="r">
                            <option ${param.roleId ne null && param.roleId eq r.id ? "selected" : ""} 
                                value="${r.id}">${r.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="did" class="form-label">Department</label>
                    <select class="form-select" id="did" name="did">
                        <option value="-1">----------ALL------------</option>
                        <c:forEach items="${requestScope.depts}" var="d">
                            <option ${param.did ne null && param.did eq d.id ? "selected" : ""} 
                                value="${d.id}">${d.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary w-100">Search</button>
            </form>

            <h3 class="mb-4">Filtered Results</h3>
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Date of Birth</th>
                        <th>Address</th>
                        <th>Department</th>
                        <th>Role Name</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.emps}" var="e">
                        <tr>
                            <td>${e.id}</td>
                            <td>${e.name}</td>
                            <td>${e.gender ? "Male" : "Female"}</td>
                            <td>${e.dob}</td>
                            <td>${e.address}</td>
                            <td>${e.dept.name}</td>
                            <td>${e.role.name}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
