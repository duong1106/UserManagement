<%-- 
    Document   : promotion_list
    Created on : Jun 26, 2021, 3:29:48 PM
    Author     : IamDell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="header.jsp" %>
        <title>Promotion Page</title>
    </head>
    <body>
        <c:set value="${requestScope.PROMOTIONLIST}" var="promoteList" />
        <h1>Promotion List</h1>

        <c:url value="GetUsers" var="urlGetUsers">
            <c:param name="action" value="GetUsers" />
        </c:url>
        <a href="${urlGetUsers}">User Management</a><br>

        <c:if test="${not empty promoteList}">
            <c:if test="${requestScope.INVALID != null}">
                <font color="red">${requestScope.INVALID}</font>
            </c:if>

            <c:if test="${requestScope.ISUPDATED != null}">
                <font color="green">${requestScope.ISUPDATED}</font>
            </c:if>

                <table border="1">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Promote Code</th>
                            <th>Rank</th>
                            <th>Promote Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.PROMOTIONLIST}" var="promote">
                        <form action="updateRank" method="POST">
                            <tr>
                                <td>${promote.userID}</td>
                                <td>${promote.promoteCode}</td>
                                <td>
                                    <input type="text" name="promoteRank" value="${promote.promoteRank}" />
                                </td>
                                <td>${promote.promoteDate}</td>
                                <td>
                                    <input type="submit" value="Update" name="action" />
                                    <input type="hidden" name="userID" value="${promote.userID}" />
                                    <input type="hidden" name="promoteRank" value="${promote.promoteRank}" />
                                </td>
                                <td>
                                    <c:url value="DemoteUser" var="urlDemoteUser">
                                        <c:param name="action" value="DemoteUser" />
                                        <c:param name="userID" value="${promote.userID}" />
                                    </c:url>
                                    <a href="${urlDemoteUser}" class="btn-clipboard">Remove</a>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </body>
</html>
