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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
<ul class="nav nav-pills nav-fill">
    <li class="nav-item">
        <a class="nav-link active" href="StaffServlet">Home Page</a>
    </li>
</ul>
<form method="post" class="needs-validation" novalidate>
        <input type="hidden" name="idStaff" value='${staff.idStaff}' />
    <div class="form-row">
        <div class="col-md-6 mb-3">
            <label for="validationCustom01">Name</label>
            <input name="name" type="text" class="form-control" id="validationCustom01" value="${staff.name}" required>
            <div class="valid-feedback">
                Looks good!
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <label for="validationCustom02">Email</label>
            <input name="email" type="email" class="form-control" id="validationCustom02" value="${staff.email}" required>
            <div class="valid-feedback">
                Looks good!
            </div>
        </div>
    </div>
    <div class="form-row">
        <div class="col-md-6 mb-3">
            <label for="validationCustom03">Address</label>
            <input name="address" type="text" class="form-control" id="validationCustom03" value="${staff.address}" required>
            <div class="invalid-feedback">
                Please provide a valid city.
            </div>
        </div>
        <div class="col-md-3 mb-3">
            <label for="validationCustom04">Department</label>
            <select name="idDepartment" class="custom-select" id="validationCustom04" required>
                <c:forEach var="i" begin="0" end="${departmentList.size()-1}">
                    <option
                            value="${departmentList.get(i).idDepartment}">${departmentList.get(i).name}
                    </option>
                </c:forEach>
            </select>
            <div class="invalid-feedback">
                Please select a valid state.
            </div>
        </div>
        <div class="col-md-3 mb-3">
            <label for="validationCustom05">Phone Number</label>
            <input name="phoneNumber" type="number" class="form-control" id="validationCustom05" value="${staff.phoneNumber}" required>
            <div class="invalid-feedback">
                Please provide a valid zip.
            </div>
        </div>
        <div class="col-md-3 mb-3">
            <label for="validationCustom05">Salary</label>
            <input name="salary" type="number" class="form-control" id="validationCustom06" value="${staff.salary}" required>
            <div class="invalid-feedback">
                Please provide a valid zip.
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
            <label class="form-check-label" for="invalidCheck">
                Agree you sure???
            </label>
            <div class="invalid-feedback">
                You must agree before submitting.
            </div>
        </div>
    </div>
    <button class="btn btn-primary" type="submit">Submit form</button>
</form>

<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>