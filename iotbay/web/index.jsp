<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Main Page</title>
    <link rel="stylesheet" href="css/democss.css">
    <style>
        .top-right {
            position: absolute;
            top: 20px;
            right: 20px;
            width: 200px; /* Set the width to your desired value */
            background-color: #ADD8E6; 
            border-radius: 10px; /* Add a background color if needed */
            padding: 10px; /* Add padding to give some space inside the table */
            overflow: auto; 
        }
        .button-table {
            width: 100%; /* Set the table width to 100% */
            border-collapse: collapse; /* Collapse table borders for better layout */
        }
        .button-table td {
            padding: 0; /* Remove padding to align buttons properly */
            border-bottom: none; /* Add bottom border to separate rows */
        }
        .button-table td a {
            display: block; /* Make buttons fill the whole cell */

            padding: 6px 20px; /* Adjust padding to make buttons slightly smaller */

            text-align: center; /* Center align button text */
            background-color: #00008B; /* Dark blue background for the button */
            color: white;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            text-decoration: none; /* Remove underline */
            font-size: 14px; /* Optionally adjust font size */
        }

        .button-table td a:hover {
            background-color: #003366; /* Darker shade of blue on hover */
        }
        /* Set color of h1 and label to white */
        h1 {
            color: white;
        }
    </style>
</head>
<body>
    <% User user = (User) session.getAttribute("user"); %>
    <% if (user != null) {%>
    <div class="top-right">
        <table class="button-table">
            <tr>
                <td style="text-align: center;">
                    <label style="display: block;">My Account</label>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="edit_user.jsp">Edit Account</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="user_access_logs.jsp" class="button">View Access Logs</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="LogoutServlet">Logout</a>
                </td>
            </tr>
        </table>
    </div>
    <div class="login-box">
        <h1>Welcome, <%= user.getName()%>!</h1>
        <div class="user-info">
            <div class="buttons">
                <!-- Add in order functionality -->
                
            </div>  
        </div>
    </div>
    <% } else { %>
    <div class="login-box">
        <p>Please log in to view your details.</p>
        <a href="login.jsp" class="button">Login</a>
    </div>
    <% }%>
</body>
</html>
