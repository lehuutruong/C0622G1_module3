<%--
  Created by IntelliJ IDEA.
  User: Vanxuan
  Date: 9/26/2022
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
</head>
<body>
<h1>Product Description: <%=request.getAttribute("productDescription")%></h1>
<h1>Discount Amount: <%=request.getAttribute("discountAmount")%></h1>
<h1>Discount Price: <%=request.getAttribute("discountPrice")%></h1>
</body>
</html>
