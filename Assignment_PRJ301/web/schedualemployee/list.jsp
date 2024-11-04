<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Schedule Employee List</title>
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
                flex-direction: column;
            }
            h2 {
                text-align: center;
                color: rgb(158, 141, 127);
                font-weight: 900;
                margin-bottom: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                background-color: #fff;
                box-shadow: 0px 8px 30px rgba(0, 0, 0, 0.1);
                border-radius: 15px;
                overflow: hidden;
            }
            th, td {
                border: 1px solid #ccc;
                padding: 12px;
                text-align: center;
            }
            th {
                background-color: rgb(158, 141, 127);
                color: #fff;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            tr:hover {
                background-color: #f1f1f1;
            }
            td {
                color: #555;
            }
            .detail-button {
                display: inline-block;
                margin-bottom: 20px;
                background-color: #8b1e1e;
                color: #fff;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 5px;
                font-weight: bold;
                border: none;
                transition: background-color 0.3s;
                align-self: flex-start;
            }
            .detail-button:hover {
                background-color: #a52a2a;
            }
        </style>
    </head>
    
    <body>
        <a href="${pageContext.request.contextPath}/schedualcampain/list" class="detail-button">Back</a>

        <h2><strong>Schedule Employee List</strong></h2>
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
