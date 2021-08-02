<%-- 
    Document   : index
    Created on : Jun 16, 2021, 10:33:57 AM
    Author     : IamDell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="header.jsp" %>
        <title>Index Page</title>
    </head>
    <body>
        <h1>Sign In</h1>
        <c:if test="${requestScope.INVALID != null}">
            <font color="red">${requestScope.INVALID}</font>
        </c:if>
        <c:if test="${requestScope.ISREGISTERED != null}">
            <font color="green">${requestScope.ISREGISTERED}</font>
        </c:if>
        Don't have an account? <a href="registration.jsp">Sign up now!</a>
        <div>
            <form action="login" method="POST">
                Username: <input type="text" name="txtUsername" value="${param.txtUsername}" /><br>
                Password: <input type="password" name="txtPassword" value="" /><br>
                <input type="submit" value="Login" name="action" />
                <input type="reset" value="Reset" name="action" />
            </form>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
