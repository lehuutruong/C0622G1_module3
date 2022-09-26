<%--
  Created by IntelliJ IDEA.
  User: Vanxuan
  Date: 9/26/2022
  Time: 1:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Product Discount Calculator App$</title>
    <style>
      .format{
        font-family: "Times New Roman";
        font-size: 25px;
      }
      .format input{
        border: 1px solid black;
        border-radius: 10px;
        height: 25px;
      }
    </style>
  </head>
  <body>
  <h2>Product Discount Calculator App</h2>
  <form action="/display-discount" method="get" class="format">
    <label>Product Description </label><br/>
    <input type="text" name="product_description" placeholder="Product Description" /><br/><br/>
    <label>List Price </label><br/>
    <input type="text" name="list_price" placeholder="List Price" /><br/><br/>
    <label>Discount Percent </label><br/>
    <input type="text" name="discount_percent" placeholder="Discount Percent" /><br/><br/>
    <input type = "submit" id = "submit" value = "Calculate Discount"/>
  </form>
  </body>
</html>
