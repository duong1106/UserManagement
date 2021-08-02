<%-- 
    Document   : user_profile
    Created on : Jun 18, 2021, 10:30:24 AM
    Author     : IamDell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="header.jsp" %>
        <title>My Profile</title>
    </head>
    <body>
        <c:set value="${sessionScope.USERINFO}" var="user" />
        <c:set value="${sessionScope.USERROLE}" var="role" />
        <c:set value="${requestScope.UPDATESUCCESS}" var="userUpdated" />

        <h1>Welcome, ${user.userFname}</h1>
        <h2>ID:# ${user.userID} | Role: ${role}</h2>

        <c:url value="Logout" var="urlLogout">
            <c:param name="action" value="Logout" />
            <c:param name="ID" value="${user.userID}" />
        </c:url>
        <a href="${urlLogout}">Logout</a>

        <c:if test="${role eq 'admin'}">
            <c:url value="GetUsers" var="urlGetUsers">
                <c:param name="action" value="GetUsers" />
                <c:param name="ID" value="${user.userID}" />
            </c:url>
            | <a href="${urlGetUsers}">User Management</a>
        </c:if>

        <c:if test="${requestScope.INVALID != null}">
            <font color="red">${requestScope.INVALID}</font>
        </c:if>     

        <form action="updateUser" method="POST">
            <div>
                <c:if test="${requestScope.INVALID != null}">
                    <font color="red">${requestScope.INVALID}</font>
                </c:if><br>
                <c:if test="${requestScope.UPDATESUCCESS != null}">
                    <font color="green">Your information were updated.</font>
                </c:if><br>
                Username: <input type="text" name="txtUsername" value="${user.username}" /><br>
                First name: <input type="text" name="txtFname" value="${user.userFname}" /><br>
                Last name: <input type="text" name="txtLname" value="${user.userLname}" /><br>
                Email: <input type="text" name="txtEmail" value="${user.userEmail}" /><br>
                Phone: <input type="text" name="txtPhone" value="${user.userPhone}" /><br>
                <c:if test="${userUpdated == null}">
                    Photo: <img src="${user.userPhoto}" width="150px" height="150px" class="img-thumbnail" alt="Avatar"/><br>
                </c:if>
                <c:if test="${userUpdated != null}">
                    Photo: <img src="${userUpdated.userPhoto}" width="150px" height="150px" class="img-thumbnail" alt="Avatar"/><br>
                </c:if>
                <input type="file" accept="image/*" name="txtPhoto" value="${param.txtPhoto}" /></br>
            </div>
            <div>
                <input type="submit" value="Update" name="action" />
            </div>
        </form>
        <%@include file="footer.jsp" %>
    </body>
</html>
