<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Schedule for Employee</title>
</head>
<body>
    <h2>Create Schedule for Employee</h2>
    <form action="create" method="post">
        <label for="employeeID">Employee ID:</label><br>
        <input type="number" id="employeeID" name="employeeID" required><br><br>

        <label for="scID">Schedule Campaign ID:</label><br>
        <input type="number" id="scID" name="scID" required><br><br>

        <label for="schEmpID">Schedule Employee ID:</label><br>
        <input type="number" id="schEmpID" name="schEmpID" required><br><br>

        <label for="quantity">Quantity:</label><br>
        <input type="number" step="0.01" id="quantity" name="quantity" required><br><br>

        <input type="submit" value="Create Schedule">
        
        <p>${error}</p>
    </form>
</body>
</html>