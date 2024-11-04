<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tlds/emp.tld" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bảng Lịch Chi Tiết</title>
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
            max-width: 1200px;
            width: 100%;
        }
        h2 {
            text-align: center;
            color: #5a3e36;
            font-weight: 600;
            margin-bottom: 30px;
        }
        .table {
            width: 100%;
            border-radius: 15px;
            overflow: hidden;
            border-collapse: collapse;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
        }
        th {
            background-color: #e6ccb2;
            color: #5a3e36;
            text-transform: uppercase;
            padding: 10px;
            text-align: center; /* Canh giữa chữ trong tiêu đề cột */
        }
        td {
            padding: 10px;
            text-align: center;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #eaeaea;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Bảng Lịch Chi Tiết</h2>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Plan Name</th>
                    <th>Date</th>
                    <th>Shift</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${tlist}">
                    <tr>
                        <td>${item.plan.name}</td>
                        
                        <td><mytag:ToVietnameseDate value="${item.date}" /></td>
                        <td>${item.shift}</td>
                        <td>${item.quantity}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
