<%-- 
    Document   : update
    Created on : Oct 31, 2024, 2:36:08 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Plan</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .form-container {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h2 class="text-center mb-4">Update Plan</h2>
            <form action="update" method="POST">
    <!-- ID Plan (giữ lại giá trị ID) -->
    <input type="hidden" name="id" value="${plan.id}" />

    <!-- Tên kế hoạch -->
    <div class="mb-3">
        <label for="name" class="form-label">Plan Title</label>
        <input type="text" class="form-control" id="name" name="name" placeholder="Enter plan title" required
               value="${pl.name}"  />
    </div>

    <!-- Thời gian bắt đầu và kết thúc -->
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="from" class="form-label">From</label>
            <input type="date" class="form-control" id="from" name="from" required
                   value="${pl.start}" />
        </div>
        <div class="col-md-6 mb-3">
            <label for="to" class="form-label">To</label>
            <input type="date" class="form-control" id="to" name="to" required
                   value="${pl.end}" />
        </div>
    </div>

    <!-- Phòng ban -->
    <div class="mb-3">
        <label for="did" class="form-label">Workshop</label>
        <select class="form-select" id="did" name="did" required>
            <c:forEach items="${depts}" var="d">
                <option value="${d.id}" ${pl.dept.id == d.id ? 'selected' : ''}>${d.name}</option>
            </c:forEach>
        </select>
    </div>

    <!-- Danh sách sản phẩm -->
    <h4 class="mt-4">Products</h4>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th>Cost</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${requestScope.products}" var="p">
                            <tr>
                                <td>${p.name}<input type="hidden" name="pid" value="${p.id}"/></td>
                                <td><input type="number" class="form-control" name="quantity${p.id}" placeholder="Enter quantity" required></td>
                                <td><input type="number" class="form-control" name="cost${p.id}" placeholder="Enter cost" required></td>
                            </tr>
                        </c:forEach>
        </tbody>
    </table>

    <!-- Nút lưu -->
    <button type="submit" class="btn btn-primary w-100">Save</button>
</form>
        </div>
</html>
