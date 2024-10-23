<%-- 
    Document   : create
    Created on : Oct 17, 2024, 5:25:52 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create New Plan</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                position: relative;
            }
            .form-container {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
                max-width: 800px;
                width: 100%;
            }
            .back-button {
                position: absolute;
                top: 20px;
                left: 20px;
            }
        </style>
    </head>
    <body>
        <!-- Nút Back -->
        <a href="list" class="btn btn-secondary back-button">Back</a>

        <!-- Form tạo Plan -->
        <div class="form-container">
            <h2 class="text-center mb-4">Create New Plan</h2>
            <form action="create" method="POST">

                <!-- Tên kế hoạch -->
                <div class="mb-3">
                    <label for="name" class="form-label">Plan Title</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter plan title" required/>
                </div>

                <!-- Thời gian -->
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="from" class="form-label">From</label>
                        <input type="date" class="form-control" id="from" name="from" required/>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="to" class="form-label">To</label>
                        <input type="date" class="form-control" id="to" name="to" required/>
                    </div>
                </div>

                <!-- Phòng ban (Workshop) -->
                <div class="mb-3">
                    <label for="did" class="form-label">Workshop</label>
                    <select class="form-select" id="did" name="did" required>
                        <c:forEach items="${requestScope.depts}" var="d">
                            <option value="${d.id}">${d.name}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Bảng sản phẩm -->
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

                <!-- Nút Lưu -->
                <button type="submit" class="btn btn-primary w-100">Save</button>
            </form>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
