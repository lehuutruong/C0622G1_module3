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
<div class="col-auto">
    <a href="/employee?action=add">ADD</a>
</div>
<form  action="/employee?action=search" class="row g-3 d-fex justify-content-end"  method="get">
    <input type="text" name="action" value="search" hidden>
    <div class="col-auto">
        <input type="text" name="searchName" class="form-control" placeholder="Name">
    </div>
    <div class="col-auto">
        <input type="text" name="searchEmail" class="form-control" placeholder="Email">
    </div>
    <div class="col-auto">
        <select class="form-select" name="searchPositionIdName">
            <option selected value="">Select Position</option>
            <c:forEach var="position" items="${position}">
                <option value="${position.positionName}">${position.positionName}</option>
            </c:forEach>
        </select>
    </div>
    <div class="col-auto">
        <button type="submit" class="btn btn-outline-primary mb-3">Search</button>
    </div>
</form>
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
              <th>Position</th>
        <%--    <th>Education Degree Id</th>--%>
        <%--    <th>Division</th>--%>
        <th>User Name</th>
        <th> Edit</th>
        <th> Delete</th>
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
            <td>${employeeList.getPositionIdName()}</td>
                <%--            <td><c:out value="${employeeList.getEducationDegreeId()}"></c:out></td>--%>
                <%--            <td><c:out value="${employeeList.getDivisionId()}"></c:out></td>--%>
            <td>${employeeList.getUserName()}</td>
            <td>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#hehe${employeeList.id}">
                    Edit
                </button>

                <!-- Modal edit -->
                <div class="modal fade" id="hehe${employeeList.id}" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel" style="color: #000">sửa sản phẩm</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body" style="color: #000">
                                Bạn có muốn chỉnh sửa không ?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Quay lại
                                </button>
                                <a href="/employee?action=edit&id=${employeeList.id}" class="btn btn-danger">Edit</a>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
            <td>
                <!-- Button trigger modal edit -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#exampleModal${employeeList.id}">
                    Xoá
                </button>


                <!-- Modal -->
                <div class="modal fade" id="exampleModal${employeeList.id}" tabindex="-1"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel_delete" style="color: #000">Xoá sản
                                    phẩm</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body" style="color: #000">
                                Bạn có muốn xoá không ?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Quay lại
                                </button>
                                <a href="/employee?action=delete&id=${employeeList.id}" class="btn btn-danger">Xoá</a>
                            </div>
                        </div>
                    </div>
                </div>
            </td>

        </tr>
    </c:forEach>
</table>
<div>
    <a href="/view/home.jsp">BACK HOME</a>
</div>
<script src="../bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
</body>
</html>
