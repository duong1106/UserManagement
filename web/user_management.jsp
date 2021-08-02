<%-- 
    Document   : user_management
    Created on : Jun 22, 2021, 8:39:03 AM
    Author     : IamDell
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="minh.dtos.UserDTO"%>
<%@page import="minh.daos.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="header.jsp" %>
        <title>User Management Page</title>
    </head>
    <body>
        <c:set value="${sessionScope.USERINFO}" var="admin" />
        <c:set value="${requestScope.USERLIST}" var="userList" />
        <c:set value="${requestScope.PATRONLIST}" var="patronList" />
        <c:set value="${requestScope.ADMINLIST}" var="adminList" />

        <h1>User Management</h1>

        <form action="searchUser" method="POST">
            Search: <input type="text" name="txtSearchValue" placeholder="Enter user's name" value="${param.txtSearchValue}" />
            <input type="submit" value="Search User" name="action" class="btn-clipboard"/>
            <c:url value="GetUsers" var="urlGetUsers">
                <c:param name="action" value="GetUsers" />
            </c:url>
            <a href="${urlGetUsers}" class="btn-clipboard">Get Users</a> | 
            
            <c:url value="GetPromotionList" var="urlGetPromotionList">
                <c:param name="action" value="GetPromotionList" />
            </c:url>
            <a href="${urlGetPromotionList}" class="btn-clipboard">Promotion List</a> | 
            
            <a href="user_profile.jsp" class="btn-clipboard">My Profile</a>
            <c:if test="${empty userList}">
                <font color="red">${requestScope.NOUSERFOUND}</font>
            </c:if>
        </form><br>
        
        <c:if test="${requestScope.DELETESUCCESS != null}">
            <font color="green">${requestScope.DELETESUCCESS}</font>
        </c:if>
        <c:if test="${requestScope.DELETEFAILED != null}">
            <font color="red">${requestScope.DELETEFAILED}</font>
        </c:if>
        <c:if test="${requestScope.INVALID != null}">
            <font color="red">${requestScope.INVALID}</font>
        </c:if>
        
        <!-- Tab links -->
        <div class="tab">
            <button class="tablinks" onclick="openTab(event, 'All')" id="defaultOpen">All</button>
            <button class="tablinks" onclick="openTab(event, 'Patron')">Patron</button>
            <button class="tablinks" onclick="openTab(event, 'Admin')">Admin</button>
            <c:if test="${requestScope.SEARCHEDUSER != null}">
                <button class="tablinks" onclick="openTab(event, 'Searched Users')">Searched Users</button>
            </c:if>
        </div>

        <!-- Tab content -->
        <div id="All" class="tabcontent">
            <table border="2">
                <thead>
                    <tr>
                        <th>Photo</th>
                        <th>Username</th>
                        <th>Role</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${not empty userList}">
                        <c:forEach items="${userList}" var="user">
                            <tr>
                                <td>
                                    <img src="${user.userPhoto}" width="80" height="80" alt="avatar"/>
                                </td>
                                <td>
                                    ${user.username}
                                </td>
                                <td>
                                    ${user.role}
                                </td>
                                <td>
                                    ${user.userFname}
                                </td>
                                <td>
                                    ${user.userLname}
                                </td>
                                <td>
                                    ${user.userEmail}
                                </td>
                                <td>
                                    ${user.userPhone}
                                </td>
                                <td>
                                    <form action="PromoteUser">
                                        <input type="submit" value="Promote" name="action" />
                                        <input type="hidden" name="userID" value="${user.userID}" />
                                        <input type="hidden" name="userPhoto" value="${user.userPhoto}" />
                                    </form>
                                </td>
                                <td>
                                    <form action="DeleteUser">
                                        <input type="submit" value="Delete" name="action" />
                                        <input type="hidden" name="username" value="${user.username}" />
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
        </div>

        <div id="Patron" class="tabcontent">
            <table border="2">
                <thead>
                    <tr>
                        <th>Photo</th>
                        <th>Username</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${not empty patronList}">
                        <c:forEach items="${patronList}" var="patron">
                            <tr>
                                <td>
                                    <img src="${patron.userPhoto}" width="80" height="80" alt="avatar"/>
                                </td>
                                <td>
                                    ${patron.username}
                                </td>
                                <td>
                                    ${patron.userFname}
                                </td>
                                <td>
                                    ${patron.userLname}
                                </td>
                                <td>
                                    ${patron.userEmail}
                                </td>
                                <td>
                                    ${patron.userPhone}
                                </td>
                                <td>
                                    <form action="PromoteUser">
                                        <input type="submit" value="Promote" name="action" />
                                        <input type="hidden" name="userID" value="${patron.userID}" />
                                        <input type="hidden" name="userPhoto" value="${patron.userPhoto}" />
                                    </form>
                                </td>
                                <td>
                                    <form action="DeleteUser">
                                        <input type="submit" value="Delete" name="action" />
                                        <input type="hidden" name="username" value="${patron.username}" />
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
        </div>

        <div id="Admin" class="tabcontent">
            <table border="2">
                <thead>
                    <tr>
                        <th>Photo</th>
                        <th>Username</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${not empty adminList}">
                        <c:forEach items="${adminList}" var="admin">
                            <tr>
                                <td>
                                    <img src="${admin.userPhoto}" width="80" height="80" alt="avatar"/>
                                </td>
                                <td>
                                    ${admin.username}
                                </td>
                                <td>
                                    ${admin.userFname}
                                </td>
                                <td>
                                    ${admin.userLname}
                                </td>
                                <td>
                                    ${admin.userEmail}
                                </td>
                                <td>
                                    ${admin.userPhone}
                                </td>
                                <td>
                                    <form action="PromoteUser">
                                        <input type="submit" value="Promote" name="action" />
                                        <input type="hidden" name="userID" value="${admin.userID}" />
                                        <input type="hidden" name="userPhoto" value="${admin.userPhoto}" />
                                    </form>
                                </td>
                                <td>
                                    <form action="DeleteUser">
                                        <input type="submit" value="Delete" name="action" />
                                        <input type="hidden" name="username" value="${admin.username}" />
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
        </div>

        <c:if test="${requestScope.SEARCHEDUSER != null}">
            <div id="Searched Users" class="tabcontent">
                <table border="2">
                    <thead>
                        <tr>
                            <th>Photo</th>
                            <th>Username</th>
                            <th>Role</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.SEARCHEDUSER}" var="searchedUser">
                            <tr>
                                <td>
                                    <img src="${searchedUser.userPhoto}" width="80" height="80" alt="avatar"/>
                                </td>
                                <td>
                                    ${searchedUser.username}
                                </td>
                                <td>
                                    ${searchedUser.role}
                                </td>
                                <td>
                                    ${searchedUser.userFname}
                                </td>
                                <td>
                                    ${searchedUser.userLname}
                                </td>
                                <td>
                                    ${searchedUser.userEmail}
                                </td>
                                <td>
                                    ${searchedUser.userPhone}
                                </td>
                                <td>
                                    <form action="PromoteUser">
                                        <input type="submit" value="Promote" name="action" />
                                        <input type="hidden" name="userID" value="${searchedUser.userID}" />
                                        <input type="hidden" name="userPhoto" value="${searchedUser.userPhoto}" />
                                    </form>
                                </td>
                                <td>
                                    <form action="DeleteUser">
                                        <input type="submit" value="Delete" name="action" />
                                        <input type="hidden" name="username" value="${searchedUser.username}" />
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </body>
    <footer>
        <%@include file="footer.jsp" %>
    </footer>
</html>
