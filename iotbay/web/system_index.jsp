<%@page import="uts.isd.model.System"%>
<%@page import="uts.isd.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Main Page</title>
    <!-- External CSS file -->
    <link rel="stylesheet" href="css/democss.css">
    <style>
        /* Internal CSS styles */
        /* Modal styles */
        .modal {
            /* Hidden by default */
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
            padding-top: 50px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 40%; /* Adjust for better spacing */
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            animation: animatetop 0.4s;
        }

        .form-input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px; /* Space between inputs */
            box-sizing: border-box; /* Border and padding included in width */
        }

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

        .buttons {
            display: flex;
            justify-content: space-around;
            margin: 20px 0;
        }

        .button {
            padding: 10px 20px;
            text-align: center;
            margin: 10px;
            cursor: pointer;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #0056b3;
        }

        /* Animation for modal appearance */
        @keyframes animatetop {
            from {top: -300px; opacity: 0}
            to {top: 0; opacity: 1}
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h1>Welcome!</h1>
        <div class="system-info">
            <% 
                // Accessing System information from session
                System system = (System) session.getAttribute("system");
            %>
            <p>Your email is <%= system.getEmail() %></p>
            <!-- Buttons for various actions -->
            <div class="buttons">
                <!-- Button to open Create User modal -->
                <button onclick="document.getElementById('createUserModal').style.display='block'">Create User</button>
                <!-- Button to open Create Admin modal -->
                <button onclick="document.getElementById('createAdminModal').style.display='block'">Create Admin</button>
                <!-- Button to view users -->
                <button onclick="window.location.href='/iotbay/ViewUsersServlet';">View Users</button>
                <!-- Button to view admins -->
                <button onclick="window.location.href='/iotbay/ViewAdminsServlet';">View Admins</button>
                <!-- Button to log out -->
                <button onclick="window.location.href='/iotbay/LogoutServlet';">Logout</button>

            </div>
        </div>
    </div>

    <!-- The Modal for Create User -->
    <div id="createUserModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="document.getElementById('createUserModal').style.display='none'">&times;</span>
            <h2>Create User Form</h2>
            <form action="CreateUserServlet" method="post">
                <!-- Input fields for user information -->
                <input type="email" class="form-input" id="email" name="email" placeholder="Email" required><br>
                <input type="password" class="form-input" id="password" name="password" placeholder="Password" required pattern=".{6,}" title="Password must be at least 6 characters long"><br>
                <input type="text" class="form-input" id="name" name="name" placeholder="Name" required><br>
                <input type="text" class="form-input" id="gender" name="gender" placeholder="Gender" required><br>
                <input type="text" class="form-input" id="address" name="address" placeholder="Address" required><br>
                <input type="submit" class="button" value="Submit">
            </form>
        </div>
    </div>

    <!-- The Modal for Create Admin -->
    <div id="createAdminModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="document.getElementById('createAdminModal').style.display='none'">&times;</span>
            <h2>Create Admin Form</h2>
            <form action="CreateAdminServlet" method="post">
                <!-- Input fields for admin information -->
                <input type="email" class="form-input" name="email" placeholder="Email" required><br>
                <input type="password" class="form-input" name="password" placeholder="Password" required pattern=".{6,}" title="Password must be at least 6 characters long"><br>
                <input type="text" class="form-input" name="name" placeholder="Name" required><br>
                <input type="text" class="form-input" name="gender" placeholder="Gender" required><br>
                <input type="text" class="form-input" name="address" placeholder="Address" required><br>
                <input type="submit" class="button" value="Submit">
            </form>
        </div>
    </div>

    <!-- JavaScript to close modal when clicking outside -->
    <script>
        window.onclick = function(event) {
            if (event.target.className === 'modal') {
                event.target.style.display = "none";
            }
        }
    </script>
</body>
</html>
