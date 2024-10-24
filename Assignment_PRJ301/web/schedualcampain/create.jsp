<%-- 
    Document   : sum
    Created on : Oct 24, 2024, 9:07:39 PM
    Author     : xuant
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bảng Lịch Làm Việc</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
            text-transform: uppercase;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #eaeaea;
        }
        input[type="text"] {
            width: 80%;
            padding: 5px;
            margin: 2px 0;
            box-sizing: border-box;
        }
        .total {
            font-weight: bold;
            background-color: #f4f4f4;
        }
    </style>
    <script>
        // Hàm để tính tổng số lượng sản phẩm trong từng cột
        function calculateTotals() {
            const rows = document.querySelectorAll('.data-row');
            const productTotals = [0, 0, 0, 0]; // Tổng cho từng sản phẩm

            // Tính tổng theo cột cho từng sản phẩm
            rows.forEach(row => {
                row.querySelectorAll('.product-column input[type="text"]').forEach((input, index) => {
                    const value = parseInt(input.value) || 0;
                    productTotals[index] += value;
                });
            });

            // Hiển thị tổng trong hàng tổng phía dưới từng sản phẩm
            document.querySelectorAll('.total-row .total-column').forEach((cell, index) => {
                cell.textContent = productTotals[index];
            });
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Bảng Lịch Làm Việc</h1>
        <table>
            <thead>
                <tr>
                    <th>Ngày</th>
                    <th>Ca</th>
                    <th class="product-column">Sản phẩm A</th>
                    <th class="product-column">Sản phẩm B</th>
                    <th class="product-column">Sản phẩm C</th>
                    <th class="product-column">Sản phẩm D</th>
                </tr>
            </thead>
            <tbody>
                <%-- Lặp qua các ngày cố định --%>
                <%
                    String[] days = {"2024-10-24", "2024-10-25", "2024-10-26", "2024-10-27", "2024-10-28"};
                    String[] shifts = {"K1", "K2", "K3"};
                    for (String day : days) {
                        for (String shift : shifts) {
                %>
                <tr class="data-row">
                    <td><%= day %></td>
                    <td><%= shift %></td>
                    <td class="product-column"><input type="text" name="productA" oninput="calculateTotals()"/></td>
                    <td class="product-column"><input type="text" name="productB" oninput="calculateTotals()"/></td>
                    <td class="product-column"><input type="text" name="productC" oninput="calculateTotals()"/></td>
                    <td class="product-column"><input type="text" name="productD" oninput="calculateTotals()"/></td>
                </tr>
                <% 
                        }
                    }
                %>
            </tbody>
            <tfoot>
                <tr class="total-row">
                    <td colspan="2">Tổng</td>
                    <td class="total-column"></td>
                    <td class="total-column"></td>
                    <td class="total-column"></td>
                    <td class="total-column"></td>
                </tr>
            </tfoot>
        </table>
    </div>
</body>
</html>