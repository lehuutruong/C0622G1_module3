<%--
  Created by IntelliJ IDEA.
  User: Vanxuan
  Date: 10/3/2022
  Time: 3:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employee Management Application</title>
</head>
<body>
<center>
    <h1>Employee Management</h1>
    <h2>
        <a href="/employee?action=">List All Employee</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit User
                </h2>
            </caption>
            <c:if test="${employeeList != null}">
                <input type="hidden" name="id" value="<c:out value='${employeeList.id}' />"/>
            </c:if>
            <tr>
                <th>Employee Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${employeeList.name}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Employee dateOfBirth:</th>
                <td>
                    <input type="text" name="email" size="45"
                           value="<c:out value='${employeeList.dateOfBirth}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>idCard:</th>
                <td>
                    <input type="text" name="country" size="15"
                           value="<c:out value='${employeeList.idCard}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>salary:</th>
                <td>
                    <input type="text" name="country" size="15"
                           value="<c:out value='${employeeList.salary}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>phoneNumber:</th>
                <td>
                    <input type="text" name="country" size="15"
                           value="<c:out value='${employeeList.phoneNumber}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>email:</th>
                <td>
                    <input type="text" name="country" size="15"
                           value="<c:out value='${employeeList.email}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>address:</th>
                <td>
                    <input type="text" name="country" size="15"
                           value="<c:out value='${employeeList.address}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>positionId:</th>
                <td>
                    <input type="text" name="country" size="15"
                           value="<c:out value='${employeeList.positionId}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>educationDegreeId:</th>
                <td>
                    <input type="text" name="country" size="15"
                           value="<c:out value='${employeeList.educationDegreeId}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>divisionId:</th>
                <td>
                    <input type="text" name="country" size="15"
                           value="<c:out value='${employeeList.divisionId}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>userName:</th>
                <td>
                    <input type="text" name="country" size="15"
                           value="<c:out value='${employeeList.userName}' />"
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
