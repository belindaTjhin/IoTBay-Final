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
    DBManager manager = (DBManager) session.getServletContext().getAttribute("manager");
    List<Customer> customers = manager.findAllCustomers();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer List</title>
    <link rel="stylesheet" href="css/democss.css">
</head>
<body>
    <h1>Customer List</h1>
    <input type="text" id="searchName" placeholder="Search by name">
    <select id="searchType">
        <option value="">All Types</option>
        <option value="Company">Company</option>
        <option value="Individual">Individual</option>
    </select>
    <button onclick="searchCustomers()">Search</button>
    <table id="customerTable">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Type</th>
                <th>Address</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (customers != null) {
                    for (Customer customer : customers) {
            %>
            <tr>
                <td><%= customer.getName() %></td>
                <td><%= customer.getEmail() %></td>
                <td><%= customer.getType() %></td>
                <td><%= customer.getAddress() %></td>
                <td>
                    <form action="customer_edit.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= customer.getId() %>">
                        <button type="submit">Edit</button>
                    </form>
                    <form action="DeleteCustomerServlet" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= customer.getId() %>">
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                } else {
                    out.println("<tr><td colspan='5'>No customers found.</td></tr>");
                }
            %>
        </tbody>
    </table>
    <script>
        function searchCustomers() {
            const searchName = document.getElementById('searchName').value.toLowerCase();
            const searchType = document.getElementById('searchType').value;
            const rows = document.querySelectorAll('#customerTable tbody tr');
            rows.forEach(row => {
                const name = row.cells[0].innerText.toLowerCase();
                const type = row.cells[2].innerText;
                if ((name.includes(searchName) || !searchName) && (type === searchType || !searchType)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }
    </script>
</body>
</html>
