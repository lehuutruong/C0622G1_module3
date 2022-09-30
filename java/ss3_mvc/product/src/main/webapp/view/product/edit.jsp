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
    <title>Edit Product</title>
</head>
<body>
<h1>Edit Product</h1>
<p>
    <c:if test="${message != null}">
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/product">Come back list Product</a>
</p>
<form method="post">
    <fieldset>
        <legend>Product Information</legend>
        <table>
            <tr>
                <td>Id</td>
                <td><input type="text" name="id" id="id" value="${product.getId()}"></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" id="name" value="${product.getName()}"></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input type="number" name="price" id="price" value="${product.getPrice()}"></td>
            </tr>
            <tr>
                <td>Product Company</td>
                <td><input type="text" name="productCompany" id="productCompany" value="${product.getProductCompany()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>