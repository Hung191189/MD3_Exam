<%--
  Created by IntelliJ IDEA.
  User: Le Khanh
  Date: 10/10/2023
  Time: 10:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
  table{
    width: 100%;
  }
  table, tr, td, th{
    border-collapse: collapse;
    border: 1px solid;
  }
  tr, td, th{
    height: 50px;
  }
</style>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand">C0623K1</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="StaffServlet">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="https://getbootstrap.com/">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          Create
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="/StaffServlet?action=create">Create new staff</a>
          <a class="dropdown-item" href="/DepartmentServlet?action=create">Create new department</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="https://codegym.vn/">Something else here</a>
        </div>
      </li>
    </ul>
    <form action="StaffServlet?action=findByName" method="post" class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" name="nameSearch" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<table>
<tr class="bg-primary">
  <th class="bg-primary">#</th>
  <th class="bg-success">Name</th>
  <th class="bg-warning">Email</th>
  <th class="bg-danger">Address</th>
  <th class="bg-info">PhoneNumber</th>
  <th class="bg-primary">Salary</th>
  <th class="bg-success">Department</th>
  <th class="bg-warning" colspan="2">Action</th>
</tr>

<c:forEach var="i" begin="0" end="${staffList.size()-1}">
  <tr>
  <td class="bg-primary">${staffList.get(i).idStaff}</td>
  <td class="bg-success">${staffList.get(i).name}</td>
  <td class="bg-warning">${staffList.get(i).email}</td>
  <td class="bg-danger">${staffList.get(i).address}</td>
  <td class="bg-info">${staffList.get(i).phoneNumber}</td>
  <td class="bg-primary">${staffList.get(i).salary}</td>
  <td class="bg-success">${departmentList.get(i).name}</td>
  <td class="bg-warning"><a href="/StaffServlet?action=update&idStaff=${staffList.get(i).idStaff}">Edit</a></td>
  <td class="bg-danger"><a href="/StaffServlet?action=delete&idStaff=${staffList.get(i).idStaff}">Delete</a></td>
  </tr>
</c:forEach>
</table>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>