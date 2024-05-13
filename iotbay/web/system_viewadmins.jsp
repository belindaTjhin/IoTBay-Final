<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Management</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; background-color: transparent; }
        th { background-color: transparent; }
        @media (max-width: 600px) { table, th, td { padding: 4px; } }
    </style>
    <script>
        function openEditModal(email, name, gender, address) {
            document.getElementById('editAdminModal').style.display = 'block';
            document.getElementById('adminEmail').value = email;
            document.getElementById('adminName').value = name;
            document.getElementById('adminGender').value = gender;
            document.getElementById('adminAddress').value = address;
        }
    </script>
    <h1>Admin List</h1>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>Email</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Address</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <%
                ArrayList<Admin> users = (ArrayList<Admin>) session.getAttribute("adminsList");
                if (users != null && !users.isEmpty()) {
                    for (Admin user : users) {
                        out.println("<tr><td>" + user.getEmail() + "</td>"
                            + "<td>" + user.getName() + "</td>"
                            + "<td>" + user.getGender() + "</td>"
                            + "<td>" + user.getAddress() + "</td>"
                            + "<td><button onclick=\"openEditModal('" + user.getEmail() 
                            + "', '" + user.getName().replace("'", "\\'") 
                            + "', '" + user.getGender() 
                            + "', '" + user.getAddress().replace("'", "\\'") 
                            + "')\">Edit</button></td>"
                            + "<td><a href='DeleteUserAdminServlet?email=" + user.getEmail() 
                            + "' onclick='return confirm(\"Are you sure you want to delete this user?\");'>Delete</a></td></tr>");
                    }
                } else {
                    out.println("<tr><td colspan='6'>No users found.</td></tr>");
                }
            %>
        </tbody>
    </table>
    <div id="editAdminModal" class="modal" style="display:none;">
        <div class="modal-content">
            <span class="close" onclick="document.getElementById('editAdminModal').style.display='none'">&times;</span>
            <h2>Edit User</h2>
            <form action="EditUserAdminServlet" method="post">
                <input type="hidden" name="email" id="userEmail">
                <label for="name">Name:</label>
                <input type="text" id="userName" name="name"><br>
                <label for="gender">Gender:</label>
                <input type="text" id="userGender" name="gender"><br>
                <label for="address">Address:</label>
                <input type="text" id="userAddress" name="address"><br>
                <label for="password">Password:</label>
                <input type="password" id="userPassword" name="password"><br>
                <button type="submit">Save Changes</button>
            </form>
        </div>
    </div>
</body>
</html>
