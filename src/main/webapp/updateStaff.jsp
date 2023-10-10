<%--
  Created by IntelliJ IDEA.
  User: Le Khanh
  Date: 10/10/2023
  Time: 11:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>Update Staff</h3>
<form method="post">
<c:if test="${staff != null}">
    <input type="hidden" name="idStaff" value="<c:out value='${staff.idStaff}' />"/>
</c:if>
<input type="text" name="name" value="<c:out value='${staff.name}'/>"/>
<input type="text" name="email" value="<c:out value='${staff.email}'/>"/>
<input type="text" name="address" value="<c:out value='${staff.address}'/>"/>
<input type="number" name="phoneNumber" value="<c:out value='${staff.phoneNumber}'/>"/>
<input type="number" name="salary" value="<c:out value='${staff.salary}'/>"/>
<input type="number" name="idDepartment" value="<c:out value='${staff.idDepartment}'/>"/>
<input type="submit" value="Save">
</form>
<a href="StaffServlet">Back to list</a>
</body>
</html>
