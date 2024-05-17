<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="uts.isd.model.System" %>
<%@ page import="uts.isd.model.Customer" %>
<%@ page import="uts.isd.model.dao.DBManager" %>
<%@ page import="java.util.List" %>
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

    int customerId = Integer.parseInt(request.getParameter("id"));
    DBManager manager = (DBManager) session.getServletContext().getAttribute("manager");
    Customer customer = manager.findCustomer(customerId);

    if (customer == null) {
        session.setAttribute("editErr", "Customer not found.");
        response.sendRedirect("customer_list.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer</title>
    <link rel="stylesheet" href="css/democss.css">
</head>
<body>
    <div class="login-box">
        <h1>Edit Customer</h1>
        <form action="EditCustomerServlet" method="post">
            <input type="hidden" name="id" value="<%= customer.getId() %>">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<%= customer.getName() %>" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= customer.getEmail() %>" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" value="<%= customer.getPassword() %>" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <input type="text" id="gender" name="gender" value="<%= customer.getGender() %>">
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="<%= customer.getAddress() %>" required>
            </div>
            <div class="form-group">
                <label for="type">Type:</label>
                <select id="type" name="type">
                    <option value="Company" <%= "Company".equals(customer.getType()) ? "selected" : "" %>>Company</option>
                    <option value="Individual" <%= "Individual".equals(customer.getType()) ? "selected" : "" %>>Individual</option>
                </select>
            </div>
            <div class="buttons">
                <button type="submit" class="button">Update</button>
                <a href="customer_list.jsp" class="button">Cancel</a>
            </div>
        </form>
    </div>
    <jsp:include page="/ConnServlet" flush="true"/>
</body>
</html>
