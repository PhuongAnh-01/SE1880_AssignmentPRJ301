<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Kế Hoạch Sản Xuất</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>

    <body>
        <div class="container mt-5">
            <!-- Header Section -->
            <header class="mb-4">
                <h1 class="text-center">Kế Hoạch Sản Xuất</h1>
            </header>

            <!-- Button Section -->
            <div class="d-flex justify-content-center mb-4">
                <a href="employee/list" class="btn btn-primary mx-2">Danh sách nhân viên</a>
                <a href="productList" class="btn btn-primary mx-2">Danh sách sản phẩm</a>
                <a href="attendance" class="btn btn-primary mx-2">Bảng chấm công</a>
                <a href="taskList" class="btn btn-primary mx-2">Bảng nhiệm vụ</a>
            </div>

            <!-- Logout Button -->
            <div class="d-flex justify-content-end">
                <a href="logout" class="btn btn-danger">Logout</a>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
