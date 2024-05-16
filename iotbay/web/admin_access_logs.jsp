<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.isd.model.AccessLog" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Access Logs</title>
    <link rel="stylesheet" href="css/democss.css">
</head>
<body>
    <div class="accessLog-box">
        <h1>Access Log Search</h1>
        <form action="AdminAccessLogsServlet" method="get">
            <label for="date">Search by Date:</label>
            <input type="date" id="date" name="date">
            <button type="submit">Search</button>
        </form>
        <table border="1">
            <thead>
                <tr>
                    <th>Email</th>
                    <th>Login Time</th>
                    <th>Logout Time</th>
                </tr>
            </thead>
            <tbody>
                <% ArrayList<AccessLog> accessLogs = (ArrayList<AccessLog>) session.getAttribute("accessLogs");
                   if (accessLogs != null) {
                       for (AccessLog log : accessLogs) { %>
                           <tr>
                               <td><%= log.getEmail() %></td>
                               <td><%= log.getLoginTime() %></td>
                               <td><%= log.getLogoutTime() %></td>
                           </tr>
                <%     }
                   } else { %>
                       <tr>
                           <td colspan="3">No access logs found.</td>
                       </tr>
                <% } %>
            </tbody>
        </table>
        <div class="buttons">
            <a class="button" href="admin_index.jsp">Back to home page</a>
        </div>
    </div>
</body>
</html>
