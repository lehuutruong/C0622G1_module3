<%--
  Created by IntelliJ IDEA.
  User: Vanxuan
  Date: 10/6/2022
  Time: 11:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Employee List</title>
    <link rel="stylesheet" href="../bootstrap-5.0.2-dist/css/bootstrap.min.css">
</head>
<body>
<h1> Employee List</h1>
<table class="table table-striped" border=1 style="border: 1px solid black">
    <tr>
    <th>Id</th>
    <th>Name</th>
    <th>Day Of Birth</th>
    <th>Id Card</th>
    <th>Salary</th>
    <th>Phone Number</th>
    <th>Email</th>
    <th>Address</th>
<%--    <th>Position</th>--%>
<%--    <th>Education Degree Id</th>--%>
<%--    <th>Division</th>--%>
    <th>User Name</th>
    </tr>
    <c:forEach var="employeeList" items="${employeeList}">
        <tr>
            <td>${employeeList.getId()}</td>
            <td>${employeeList.getName()}</td>
            <td>${employeeList.getDateOfBirth()}</td>
            <td>${employeeList.getIdCard()}</td>
            <td><fmt:formatNumber value="${employeeList.getSalary()}"/></td>
            <td>${employeeList.getPhoneNumber()}</td>
            <td>${employeeList.getEmail()}</td>
            <td>${employeeList.getAddress()}</td>
<%--            <td><c:out value="${employeeList.getPositionId()}"></c:out></td>--%>
<%--            <td><c:out value="${employeeList.getEducationDegreeId()}"></c:out></td>--%>
<%--            <td><c:out value="${employeeList.getDivisionId()}"></c:out></td>--%>
            <td>${employeeList.getUserName()}</td>
              </tr>
    </c:forEach>
</table>
<div>
    <a href="/view/home.jsp">BACK HOME</a>
</div>
<script src="../bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
</body>
</html>
