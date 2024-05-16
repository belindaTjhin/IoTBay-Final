<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
        <!--<link rel="stylesheet" href="css/democss.css">-->
        <link rel="stylesheet" href="css/HomePage.css"> 
        <style>
            table .button {
                width:90%;
            }
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

                /*padding: 6px 20px;  Adjust padding to make buttons slightly smaller */

                text-align: center; /* Center align button text */
                /*background-color: #00008B;  Dark blue background for the button */
                color: white;
                border: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
                text-decoration: none; /* Remove underline */
                font-size: 14px; /* Optionally adjust font size */
            }

/*            .button-table td a:hover {
                background-color: #003366;  Darker shade of blue on hover 
            }*/
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
                        <a href="edit_user.jsp" class="button">Edit Account</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="PaymentHistoryServlet"class="button">View Payment History</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="user_access_logs.jsp" class="button">View Access Logs</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="LogoutServlet" class="button">Logout</a>
                    </td>
                </tr>
            </table>
        </div>
        <% } else { %>
        <div class="top-right">
            <!--<div class="button-group">-->
                <table class="button-table" style="background-color: #ADD8E6; border-radius: 10px;">
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <label style="display: block;">Customer:</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="one.jsp">
                                <button class="button">Customer Register</button>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="login.jsp">
                                <button class="button">Customer Login</button>
                            </a>
                        </td>
                    </tr>
                </table>

                <table class="button-table" style="background-color: #ADD8E6; border-radius: 10px;">
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <label style="display: block;">Admin:</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="admin_login.jsp">
                                <button class="button">Staff Login</button>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="system_login.jsp">
                                <button class="button">System Admin Login</button>
                            </a>
                        </td>

                    </tr>

                </table>
            <!--</div>-->
        </div>
        <% }%>
        <div class="login-box" style="text-align:center;">
            <% if (user != null) {%>
            <h1>Welcome, <%= user.getName()%>!</h1>
            <% } else { %>
            <h1>IoTBay</h1>   
            <% }%>
            <div class="button-group">
                <a href="catalogue_main.jsp">
                    <button class="button">Device Catalogue</button>
                </a>
                <a href="order.jsp">
                    <button class="button">Make Order</button>
                </a>
                <a href="payment_create.jsp">
                    <button class="button">Create Payment</button>
                </a>
            </div>
        </div>
        <!--        <div class="login-box">
                    <p>Please log in to view your details.</p>
                    <a href="login.jsp" class="button">Login</a>
                </div>-->
    </body>
</html>
