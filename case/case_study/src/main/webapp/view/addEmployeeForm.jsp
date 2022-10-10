<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LAPTOP ACER
  Date: 06-10-2022
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3 style="text-align: center">Add Employee Form</h3>
<a href="/employee">Back Employee List!!!</a>

<c:if test="${mess!=null}">
    <span>${mess}</span>
</c:if>

<form action="/employee?action=add" method="post">
    <pre>Name:     <input type="text" name="name"> </pre>
    <c:if test="${map.get('name')!=null}" >
        <span>${map.get('name')}</span>
    </c:if>
    <pre>Birthday: <input type="date" name="birthday"> </pre>
    <c:if test="${map.get('birthDay')!=null}" >
        <span>${map.get('birthDay')}</span>
    </c:if>
    <pre>Id Card:    <input type="text" name="idCard"> </pre>
    <pre>Salary:  <input type="text" name="salary"> </pre>
    <c:if test="${map.get('salary')!=null}" >
    <span>${map.get('salary')}</span>
    </c:if>
    <pre>Phone number:    <input type="text" name="phoneNumber"> </pre>
    <c:if test="${map.get('phoneNumber')!=null}" >
        <span>${map.get('phoneNumber')}</span>
    </c:if>
    <pre>Email:  <input type="text" name="email"> </pre>
    <c:if test="${map.get('email')!=null}">
        <span>${map.get('email')}</span>
    </c:if>
    <pre>Address:  <input type="text" name="address"> </pre>
    <pre>Position ID:  <input type="number" name="positionId"> </pre>
    <pre>Education Degree ID:  <input type="number" name="educationDegreeId"> </pre>
    <pre>Division ID:  <input type="number" name="divisionId"> </pre>
    <pre>User Name ID:  <input type="text" name="userName"> </pre>
    <pre><button type="submit">Save</button></pre>
</form>
</body>
</html>