<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Schedual Employee List</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
            text-align: center;
        }
        td {
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Schedual Employee List</h2>
    <table>
        <thead>
            <tr>
                <th>SchEmpID</th>
                <th>Plan Name</th>
                <th>Employee Name</th>
                <th>Date</th>
                <th>Shift</th>
                <th>Quantity</th>
                <th>Department Name</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="se" items="${list}">
                <tr>
                    <td>${se.schEmpID}</td>
                    <td>${se.plan.name}</td>
                    <td>${se.employee.name}</td>
                    <td>${se.schedualCampaign.date}</td>
                    <td>${se.schedualCampaign.shift}</td>
                    <td>${se.quantity}</td>
                    <td>${se.department.name}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>