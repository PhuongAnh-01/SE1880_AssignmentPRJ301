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
                font-family: 'Poppins', sans-serif;
                background: linear-gradient(to right, #f0e6d6, #e6ccb2);
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
                padding: 20px;
            }
            .form-container {
                background-color: white;
                padding: 40px;
                border-radius: 25px;
                box-shadow: 0px 8px 30px rgba(0, 0, 0, 0.1);
                max-width: 800px;
                width: 100%;
            }
            .back-button {
                position: absolute;
                top: 20px;
                left: 20px;
                background-color: #b9855d;
                border: none;
                border-radius: 20px;
                padding: 10px 20px;
                font-weight: bold;
                transition: background-color 0.3s ease;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            }
            .back-button:hover {
                background-color: #a76f4c;
            }
            h2 {
                color: #5a3e36;
                font-weight: 600;
                text-align: center;
                margin-bottom: 30px;
            }
            .btn-primary {
                background-color: #5a3e36;
                border: none;
                border-radius: 20px;
                padding: 10px 20px;
                font-weight: bold;
                transition: background-color 0.3s ease;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            }
            .btn-primary:hover {
                background-color: #4e342e;
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
        <!-- Nút Back -->
        <a href="list" class="btn back-button">Back</a>

        <!-- Form tạo Plan -->
        <div class="form-container">
            <h2 class="text-center mb-4">Create New Plan</h2>
            <c:if test="${not empty message}">
                <div class="alert alert-danger text-center" role="alert">
                    ${message}
                </div>
            </c:if>
            <form action="create" method="POST">

                <!-- Tên kế hoạch -->
                <div class="mb-3">
                    <label for="name" class="form-label">Plan Title</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter plan title" required
                           value="${plan.name}"  />
                </div>

                <!-- Thời gian -->
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="from" class="form-label">From</label>
                        <input type="date" class="form-control" id="from" name="from" required
                               value="${plan.start}" />
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="to" class="form-label">To</label>
                        <input type="date" class="form-control" id="to" name="to" required
                               value="${plan.end}" />
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