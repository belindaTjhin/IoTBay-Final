<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="uts.isd.model.System" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.io.IOException" %>
<%
    System system = (System) session.getAttribute("system");
    if (session == null || system == null) {
        response.sendRedirect("system_login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Customer</title>
    <link rel="stylesheet" href="css/democss.css">
</head>
<body>
    <div class="login-box">
        <h1>Create Customer</h1>
        <form id="customerForm" action="CreateCustomerServlet" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <input type="text" id="gender" name="gender">
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="type">Type:</label>
                <select id="type" name="type">
                    <option value="Company">Company</option>
                    <option value="Individual">Individual</option>
                </select>
            </div>
            <div class="buttons">
                <button type="submit" class="button">Create</button>
                <a href="system_index.jsp" class="button">Cancel</a>
            </div>
        </form>
    </div>
    <jsp:include page="/ConnServlet" flush="true"/>
</body>
</html>
