<%--
  Created by IntelliJ IDEA.
  User: Le Khanh
  Date: 10/10/2023
  Time: 10:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<style>
  table,tr, td, th {
    border-collapse: collapse;
    border: solid black 1px;
  }
</style>
<head>
    <title>Title</title>
</head>
<body>
<h1>List Staff</h1>
<table>
  <tr>
    <th>#</th>
    <th>Name</th>
    <th>Email</th>
    <th>Address</th>
    <th>PhoneNumber</th>
    <th>Salary</th>
    <th>Department</th>
    <th>Action</th>
    <th></th>
  </tr>
<c:forEach var="i" begin="0" end="${staffList.size()-1}">
  <tr>
    <td>${staffList.get(i).idStaff}</td>
    <td>${staffList.get(i).name}</td>
    <td>${staffList.get(i).email}</td>
    <td>${staffList.get(i).address}</td>
    <td>${staffList.get(i).phoneNumber}</td>
    <td>${staffList.get(i).salary}</td>
    <td>${departmentList.get(i).name}</td>
    <td><a href="/StaffServlet?action=update&idStaff=${staffList.get(i).idStaff}">Edit</a></td>
    <td><a href="/StaffServlet?action=delete&idStaff=${staffList.get(i).idStaff}">Delete</a></td>
  </tr>
</c:forEach>
</table>
<a href="/StaffServlet?action=create">Create new staff</a>
<a href="/DepartmentServlet?action=create">Create new department</a>
<h4>find by name</h4>
<form action="StaffServlet?action=findByName" method="post">
  <input type="text" name="nameSearch">
  <input type="submit" value="search">
</form>
</body>
</html>
