<%@page import="uts.isd.model.System"%>
<%@page import="uts.isd.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Main Page</title>
    <link rel="stylesheet" href="css/democss.css">
    <style>
        /* Style for Modal */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            padding-top: 50px;
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
        }

        /* Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
    
    
</head>
<body>
    <% System system = (System) session.getAttribute("system"); %>
    <% if (system != null) { %>
    <div class="login-box"> <!-- Apply the light blue box styling when system is logged in -->
        <h1>Welcome!</h1>
        <div class="system-info">
            <p>Your email is <%= system.getEmail() %></p>
            <div class="buttons">
                <!-- Button to open the modal form -->
                <button onclick="document.getElementById('createUserModal').style.display='block'">Create User</button>
                <button onclick="document.getElementById('createAdminModal').style.display='block'">Create Admin</button>
                <button onclick="window.location.href='/iotbay/ViewUsersServlet';">View Users</button>

                <button onclick="window.location.href='/iotbay/ViewAdminsServlet';">View Admins</button>
                
                <!-- Add other buttons as needed -->
            </div>
        </div>
    </div>

    <!-- The Modal for Create User -->
    <div id="createUserModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="document.getElementById('createUserModal').style.display='none'">&times;</span>
            <h2>Create User Form</h2>
            <!-- Form for creating user -->
            <form action="CreateUserServlet" method="post">
                Email: <input type="email" name="email"><br>
                Password: <input type="password" name="password"><br>
                name: <input type="name:" name="name:"><br>
                gender: <input type="gender:" name="gender:"><br>
                address: <input type="address:" name="address:"><br>
                <input type="submit" value="Submit">
            </form>
        </div>
    </div>

    <!-- The Modal for Create Admin -->
    <div id="createAdminModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="document.getElementById('createAdminModal').style.display='none'">&times;</span>
            <h2>Create User Form</h2>
            <!-- Form for creating user -->
            <form action="CreateAdminServlet" method="post">
                Email: <input type="email" name="email"><br>
                Password: <input type="password" name="password"><br>
                name: <input type="name:" name="name:"><br>
                gender: <input type="gender:" name="gender:"><br>
                address: <input type="address:" name="address:"><br>
                <input type="submit" value="Submit">
            </form>
        </div>
    </div>
    
       <!-- The Modal -->
    <div id="viewUsersModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="document.getElementById('viewUsersModal').style.display='none'">&times;</span>
            <h2>User List</h2>
            <table>
                <tr>
                    <th>Email</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Action</th>
                </tr>
                <% 
                ArrayList<User> users = (ArrayList<User>) session.getAttribute("usersList");
                if (users != null) {
                    for (User user : users) {
                        out.println("<tr><td>" + user.getEmail() + "</td><td>" + user.getName() + "</td><td>" + user.getGender() + "</td><td>" + user.getAddress() + "</td><td><a href='EditUserServlet?email=" + user.getEmail() + "'>Edit</a> | <a href='DeleteUserServlet?email=" + user.getEmail() + "' onclick='return confirm(\"Are you sure?\");'>Delete</a></td></tr>");
                    }
                }
                %>
            </table>
        </div>
    </div>


    <% } else { %>
    <div class="login-box">
        <p>Please log in to view your details.</p>
        <a class="button" href="system_login.jsp">Login</a>
    </div>
    <% } %>

    <script>
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target.className === 'modal') {
                event.target.style.display = "none";
            }
        }
    </script>
</body>
</html>
