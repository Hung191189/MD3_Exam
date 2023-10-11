<%--
  Created by IntelliJ IDEA.
  User: Le Khanh
  Date: 10/10/2023
  Time: 12:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<style>
    table {
        width: 100%;
    }

    table, tr, td, th {
        border-collapse: collapse;
        border: 1px solid;
    }

    tr, td, th {
        height: 50px;
    }
</style>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
<ul class="nav nav-pills nav-fill">
    <li class="nav-item">
        <a class="nav-link active" href="StaffServlet">Home Page</a>
    </li>
</ul>
<table>
    <tr class="bg-primary">
        <th class="bg-primary">#</th>
        <th class="bg-success">Name</th>
        <th class="bg-warning">Email</th>
        <th class="bg-danger">Address</th>
        <th class="bg-info">PhoneNumber</th>
        <th class="bg-primary">Salary</th>
        <th class="bg-success">Department</th>
    </tr>
    <c:forEach var="i" begin="0" end="${staffByName.size()-1}">
    <tr>
        <td class="bg-primary">${staffByName.get(i).idStaff}</td>
        <td class="bg-success">${staffByName.get(i).name}</td>
        <td class="bg-warning">${staffByName.get(i).email}</td>
        <td class="bg-danger">${staffByName.get(i).address}</td>
        <td class="bg-info">${staffByName.get(i).phoneNumber}</td>
        <td class="bg-primary">${staffByName.get(i).salary}</td>
        <td class="bg-success">${departmentList.get(i).name}</td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
        integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
        crossorigin="anonymous"></script>