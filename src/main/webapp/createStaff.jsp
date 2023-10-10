<%--
  Created by IntelliJ IDEA.
  User: Le Khanh
  Date: 10/10/2023
  Time: 10:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post">
  <input type="text" name = "name" placeholder="Name">
  <input type="text" name = "email" placeholder="Email">
  <input type="text" name = "address" placeholder="Address">
  <input type="number" name = "phoneNumber" placeholder="PhoneNumber">
  <input type="number" name = "salary" placeholder="Salary">
<%--  <input type="number" name = "idDepartment" placeholder="IdDepartment">--%>
  <select name="department">
    <c:forEach var="i" begin="0" end="${departmentList.size()-1}">
      <option value="${departmentList.get(i).idDepartment}">${departmentList.get(i).name}</option>
    </c:forEach>
  </select>
  <input type="submit" value="Create">
</form>
</body>
</html>
