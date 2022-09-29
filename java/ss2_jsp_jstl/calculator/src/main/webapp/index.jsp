<%--
  Created by IntelliJ IDEA.
  User: Vanxuan
  Date: 9/29/2022
  Time: 3:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Calculator</title>
  </head>
  <body>
  <h1>Calculator</h1>

  <form action="/calculator" method="post">
    <fieldset>
      <legend>Calculator</legend>

      <div class="calculator">
        <label>First operand:</label>
        <input type="number" name="firstOperand" placeholder="Enter value">
      </div>
      <br>

      <div>
        <label>Operator:</label>
        <select name="operator" id="operator">
          <option value="add">addition</option>
          <option value="div">division</option>
          <option value="sum">summation</option>
          <option value="sub">subtraction</option>
        </select>
      </div>
      <br>

      <div>
        <label>Second operand:</label>
        <input type="number" name="secondOperand" placeholder="Enter value">
      </div>
      <br> <br>

      <input type="submit" value="Calculate">

    </fieldset>
  </form>
  </body>
</html>
