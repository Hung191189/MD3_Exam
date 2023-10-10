<%--
  Created by IntelliJ IDEA.
  User: Le Khanh
  Date: 10/10/2023
  Time: 12:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${staffByName}" var="staff">
    ${staff.name}, ${staff.email}, ${staff.address}, ${staff.phoneNumber}, ${staff.salary}, ${staff.idDepartment}
</c:forEach>
<a href="StaffServlet">Back to list</a>
</body>
</html>
