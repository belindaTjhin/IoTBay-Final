<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Management</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; background-color: transparent; }
        th { background-color: transparent; }
        @media (max-width: 600px) { table, th, td { padding: 4px; } }
    </style>
<script>
    function openEditModal(email, name, gender, address, password) {
        // Display the modal
        document.getElementById('editUserModal').style.display = 'block';

        // Set existing user information in the form
        document.getElementById('userEmail').value = email;
        document.getElementById('userName').value = name;
        document.getElementById('userGender').value = gender;
        document.getElementById('userAddress').value = address;
        document.getElementById('userPassword').value = password;

        // Set old email and password in hidden fields for comparison
        document.getElementById('oldEmail').value = email;
        document.getElementById('oldPassword').value = password;
    }
</script>
    <button class="button" onclick="window.location.href='system_index.jsp';">Back to Home</button>
    <h1>User List</h1>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>Email</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Address</th>
                <th>Password</th> <!-- Added password header -->
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <%
                ArrayList<User> users = (ArrayList<User>) session.getAttribute("usersList");
                if (users != null && !users.isEmpty()) {
                    for (User user : users) {
                        out.println("<tr><td>" + user.getEmail() + "</td>"
                            + "<td>" + user.getName() + "</td>"
                            + "<td>" + user.getGender() + "</td>"
                            + "<td>" + user.getAddress() + "</td>"
                            + "<td>" + user.getPassword() + "</td>" // Display password
                            + "<td><button onclick=\"openEditModal('" + user.getEmail() 
                            + "', '" + user.getName().replace("'", "\\'") 
                            + "', '" + user.getGender() 
                            + "', '" + user.getAddress().replace("'", "\\'")
                            + "', '" + user.getPassword().replace("'", "\\'")  // Ensure password is included for editing
                            + "')\">Edit</button></td>"
                            + "<td><a href='DeleteUserServlet?email=" + user.getEmail() 
                            + "' onclick='return confirm(\"Are you sure you want to delete this user?\");'>Delete</a></td></tr>");
                    }
                } else {
                    out.println("<tr><td colspan='7'>No users found.</td></tr>"); // Updated colspan to 7
                }
            %>
        </tbody>
    </table>
    <div id="editUserModal" class="modal" style="display:none;">
        <div class="modal-content">
            <span class="close" onclick="document.getElementById('editUserModal').style.display='none'">&times;</span>
            <h2>Edit User</h2>
            <form action="EditUserServlet" method="post">
                <input type="hidden" id="oldEmail" name="oldEmail">
                <input type="hidden" id="oldPassword" name="oldPassword">

                <label for="email">Email:</label>
                <input type="text" id="userEmail" name="email"><br>

                <label for="name">Name:</label>
    <input type="text" id="userName" name="name"><br>

    <label for="gender">Gender:</label>
    <input type="text" id="userGender" name="gender"><br>

    <label for="address">Address:</label>
    <input type="text" id="userAddress" name="address"><br>

    <label for="password">Password (new or to change):</label>
    <input type="text" id="userPassword" name="password"><br>

    <button type="submit">Save Changes</button>
</form>

        </div>
    </div>
</body>
</html>
