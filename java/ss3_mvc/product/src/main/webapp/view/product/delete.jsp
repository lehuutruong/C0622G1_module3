<%--
  Created by IntelliJ IDEA.
  User: Vanxuan
  Date: 9/30/2022
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<h1>Delete Product</h1>
<p>
    <a href="/product">Come back product list</a>
</p>
<form method="post">
    <h3>Are you sure delete</h3>
    <fieldset>
        <legend>Information product</legend>
        <table>
            <tr>
                <td>Id: </td>
                <td>${product.getId()}</td>
            </tr>
            <tr>
                <td>Name: </td>
                <td>${product.getName()}</td>
            </tr>
            <tr>
                <td> Price: </td>
                <td>${product.getPrice()}</td>
            </tr>
            <tr>
                <td>Product company: </td>
                <td>${product.getProductCompany()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete product"></td>
                <td><a href="/product">come back list product</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>