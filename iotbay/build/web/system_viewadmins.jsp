<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Admin Management</title>
    <!-- Internal CSS styles -->
    <style>
        /* Table styles */
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; background-color: transparent; }
        th { background-color: transparent; }
        @media (max-width: 600px) { table, th, td { padding: 4px; } }

        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            padding-top: 100px; /* Increased padding to push the modal down a bit */
        }

        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Restrict modal width for better aesthetics */
        }

        .form-group {
            margin-bottom: 15px; /* Uniform margin for visual spacing between form groups */
        }

        .form-group label {
            display: block; /* Make labels block to align with the input */
            margin-bottom: 5px; /* Space between label and input */
        }

        .form-group input {
            width: calc(100% - 20px); /* Full width minus padding */
            padding: 10px;
        }

        .button {
            padding: 10px 20px;
            background-color: #4CAF50; /* A more visible color */
            color: white;
            border: none;
            cursor: pointer;
            width: 100%; /* Full width buttons */
            box-shadow: 0px 1px 2px grey; /* Adds a subtle shadow to button */
        }

        .button:hover {
            background-color: #45a049; /* Darker shade on hover */
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            cursor: pointer;
        }

        .close:hover {
            color: black;
        }
    </style>
    <!-- JavaScript function to open edit modal -->
    <script>
    function openEditModal(email, name, gender, address, password) {
        // Display the modal
        document.getElementById('editAdminModal').style.display = 'block';


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

</head>
<body>
    <!-- Back to Home button -->
    <button class="button" onclick="window.location.href='system_index.jsp';">Back to Home</button>
    <!-- Admin List heading with Search Admins button -->
    <h1>Admin List</h1>
    <button class="button" onclick="document.getElementById('searchAdminModal').style.display='block'">Search Admins</button>
    <!-- Admin table -->
    <table>
        <thead>
            <tr>
                <th>Email</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Address</th>

                <th>Password</th>

                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>

            <% // Java code for iterating over admins and populating the table
                ArrayList<Admin> admins = (ArrayList<Admin>) session.getAttribute("adminsList");
                if (admins != null && !admins.isEmpty()) {
                    for (Admin admin : admins) {
                        out.println("<tr><td>" + admin.getEmail() + "</td>"
                            + "<td>" + admin.getName() + "</td>"
                            + "<td>" + admin.getGender() + "</td>"
                            + "<td>" + admin.getAddress() + "</td>"
                            + "<td>" + admin.getPassword() + "</td>"
                            + "<td><button onclick=\"openEditModal('" + admin.getEmail()
                            + "', '" + admin.getName().replace("'", "\\'")
                            + "', '" + admin.getGender()
                            + "', '" + admin.getAddress().replace("'", "\\'")
                            + "', '" + admin.getPassword().replace("'", "\\'")

                            + "')\">Edit</button></td>"
                            + "<td><a href='DeleteUserAdminServlet?email=" + admin.getEmail()
                            + "' onclick='return confirm(\"Are you sure you want to delete this admin?\");'>Delete</a></td></tr>");
                    }
                } else {

                    out.println("<tr><td colspan='7'>No admins found.</td></tr>");

                }
            %>
        </tbody>
    </table>
    <!-- The Modal for Search Admin -->
    <div id="searchAdminModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="document.getElementById('searchAdminModal').style.display='none'">&times;</span>
            <h2>Search Admin</h2>
            <!-- Form to search for admins -->
            <form action="SearchAdminServlet" method="post">
                <div class="form-group">
                    <label>Name:</label>
                    <input type="text" name="name" required>
                </div>
                <div class="form-group">
                    <label>Email:</label>
                    <input type="text" name="email" required>
                </div>
                <button type="submit" class="button">Search</button>
            </form>
        </div>
    </div>

    <!-- The Modal for Edit Admin -->
    <div id="editAdminModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="document.getElementById('editAdminModal').style.display='none'">&times;</span>
            <h2>Edit Admin</h2>
            <!-- Form to edit admin information -->
            <form action="EditUserAdminServlet" method="post">
                <input type="hidden" id="oldEmail" name="oldEmail">
                <input type="hidden" id="oldPassword" name="oldPassword">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="userEmail" name="email" required>
                </div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="userName" name="name" required>
                </div>
                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <input type="text" id="userGender" name="gender" required>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="userAddress" name="address" required>
                </div>
                <div class="form-group">
                    <label for="password">Password (new or to change):</label>
                    <input type="text" id="userPassword" name="password" required pattern=".{6,}" title="Password must be at least 6 characters long">
                </div>
                <button type="submit" class="button">Save Changes</button>
            </form>
        </div>
    </div>
</body>
</html>
