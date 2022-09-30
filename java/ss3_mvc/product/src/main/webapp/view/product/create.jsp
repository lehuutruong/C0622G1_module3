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
    <title>Create new product</title>
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Create new product</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/product">Back to customer list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>ID: </td>
                <td><input type="text" name="id" id="id"></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>price: </td>
                <td><input type="text" name="price" id="price"></td>
            </tr>
            <tr>
                <td>product company: </td>
                <td><input type="text" name="productCompany" id="productCompany"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="saveProduct"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
