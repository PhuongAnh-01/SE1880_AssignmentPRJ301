<%-- 
    Document   : home
    Created on : Oct 12, 2024, 12:31:22 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Kế Hoạch Sản Xuất</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <style>
            body {
                background-color: #f7f9fc;
                font-family: 'Arial', sans-serif;
            }
            .container {
                margin-top: 30px;
            }
            h2 {
                color: #28a745;
                font-weight: bold;
            }
            .nav-tabs .nav-link {
                color: #495057;
                border-radius: 0;
                background-color: #e9ecef;
            }
            .nav-tabs .nav-link.active {
                color: #fff;
                background-color: #28a745;
            }
            table th, table td {
                text-align: center;
                vertical-align: middle;
            }
            table {
                background-color: #fff;
                border: 1px solid #dee2e6;
            }
            .btn-primary {
                background-color: #28a745;
                border-color: #28a745;
            }
            .btn-primary:hover {
                background-color: #218838;
                border-color: #218838;
            }
            .tab-content {
                padding: 20px;
                background-color: #fff;
                border: 1px solid #dee2e6;
                border-top: none;
            }
            .form-select, .form-label {
                font-size: 1rem;
            }
            .form-label {
                color: #495057;
                font-weight: bold;
            }
            .table thead {
                background-color: #28a745;
                color: #fff;
            }
            .logout {
                text-align: right;
                margin-top: 20px;
            }
        </style>

    </head>




    <body>
        <div class="container">
            <div class="logout">
                <a href="logout" class="btn btn-danger">Logout</a>
            </div>
        </div>
        <div class="container shadow p-4 bg-white rounded">
            <h2 class="text-center mb-4">Hệ Thống Quản Lý Kế Hoạch Sản Xuất</h2>
            <ul class="nav nav-tabs mb-4" id="managementTabs">
                <li class="nav-item">
                    <a class="nav-link active" data-bs-toggle="tab" data-bs-target="#product-list">
                        <i class="fas fa-box" ></i> Danh Sách Sản Phẩm
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="tab" data-bs-target="#employee-list">
                        <i class="fas fa-users"></i> Danh Sách Nhân Viên
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="tab" data-bs-target="#work-shift-allocation">
                        <i class="fas fa-calendar-alt"></i> Phân Chia Ca Làm Việc
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="tab" data-bs-target="#employee-shift">
                        <i class="fas fa-user-clock"></i> Hiển Thị Ca Làm Việc
                    </a>
                </li>
            </ul>

            <div class="tab-content">
                <!-- Danh Sách Sản Phẩm Tab -->
                <div class="tab-pane fade show active" id="product-list">
                    <h4 class="mb-4 text-primary"style="color:green">Danh Sách Sản Phẩm</h4>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Mã Sản Phẩm</th>
                                <th>Tên Sản Phẩm</th>
                                <th>Số Lượng</th>
                                <th>Trạng Thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Giỏ</td>
                                <td>5000</td>
                                <td class="text-success">Đang sản xuất</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Thúng</td>
                                <td>7000</td>
                                <td class="text-warning">Đang sản xuất</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Mẹt</td>
                                <td>7000</td>
                                <td class="text-primary">Hoàn thành</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Danh Sách Nhân Viên Tab -->
                <div class="tab-pane fade" id="employee-list">
                    <h4 class="mb-4 text-primary">Danh Sách Nhân Viên</h4>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Mã Nhân Viên</th>
                                <th>Tên Nhân Viên</th>
                                <th>Chức Vụ</th>
                                <th>Ca Làm</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>CN001</td>
                                <td>Nguyễn Văn X</td>
                                <td>Thợ</td>
                                <td>K1</td>
                            </tr>
                            <tr>
                                <td>CN002</td>
                                <td>Trần Thế Mỹ</td>
                                <td>Thợ</td>
                                <td>K2</td>
                            </tr>
                            <tr>
                                <td>CN003</td>
                                <td>Bao Chửng</td>
                                <td>Thợ</td>
                                <td>K3</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Phân Chia Ca Làm Việc Tab -->
                <div class="tab-pane fade" id="work-shift-allocation">
                    <h4 class="mb-4 text-primary">Phân Chia Ca Làm Việc</h4>
                    <form>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="employee-select" class="form-label">Chọn Nhân Viên:</label>
                                <select class="form-select" id="employee-select">
                                    <option value="CN001">Nguyễn Văn X</option>
                                    <option value="CN002">Trần Thế Mỹ</option>
                                    <option value="CN003">Bao Chửng</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="shift-select" class="form-label">Chọn Ca Làm:</label>
                                <select class="form-select" id="shift-select">
                                    <option value="K1">K1: 6:00 AM - 2:00 PM</option>
                                    <option value="K2">K2: 2:00 PM - 10:00 PM</option>
                                    <option value="K3">K3: 10:00 PM - 6:00 AM</option>
                                </select>
                            </div>
                        </div>
                        <button type="button" class="btn btn-primary">Phân Ca</button>
                    </form>
                </div>

                <!-- Hiển Thị Ca Làm Việc Tab -->
                <div class="tab-pane fade" id="employee-shift">
                    <h4 class="mb-4 text-primary">Hiển Thị Ca Làm Việc Của Nhân Viên</h4>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Mã Nhân Viên</th>
                                <th>Tên Nhân Viên</th>
                                <th>Ca Được Phân</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>CN001</td>
                                <td>Nguyễn Văn X</td>
                                <td>K1</td>
                            </tr>
                            <tr>
                                <td>CN002</td>
                                <td>Trần Thế Mỹ</td>
                                <td>K2</td>
                            </tr>
                            <tr>
                                <td>CN003</td>
                                <td>Bao Chửng</td>
                                <td>K3</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>


    </body>
</html>
