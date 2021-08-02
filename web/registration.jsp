<%-- 
    Document   : register
    Created on : Jun 28, 2021, 8:48:19 AM
    Author     : IamDell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <h1>Registration</h1>
        <c:if test="${requestScope>INVALID}">
            <font color="red">${requestScope>INVALID}</font>
        </c:if>
        <form action="RegisterUser" method="POST">
            Username * <input type="text" name="txtUsername" value="" /><br>
            Password * <input type="password" name="txtPassword" value="" /><br>
            First name <input type="text" name="txtFname" value="" /><br>
            Last name <input type="text" name="txtLname" value="" /><br>
            Email <input type="text" name="txtEmail" value="" /><br>
            Phone <input type="text" name="txtPhone" value="" /><br>
            Photo <img src="" width="150px" height="150px" class="img-thumbnail" alt="Avatar"/><br>
            <input type="file" accept="image/*" name="txtPhoto" value="" /></br>
            <input type="submit" value="Register" name="action" />
            <input type="reset" value="Reset" name="action" />
        </form>
    </body>
    <footer>
        <%@include file="footer.jsp" %>
    </footer>
</html>
