<%--
  Created by IntelliJ IDEA.
  User: Vanxuan
  Date: 9/30/2022
  Time: 1:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<h1>Product</h1>
<p>
    <a href="/product?action=add">Create new Product</a>
</p>
<table border="1">
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Price</td>
        <td>Product Company</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${showProduct}' var="product">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.productCompany}</td>
            <td><a href="/product?action=edit&id=${product.getId()}">edit</a></td>
            <td><a href="/product?action=delete&id=${product.getId()}" onclick="return confirm('are you sure want to delete?')">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
