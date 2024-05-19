<%@page import="uts.isd.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Customer</title>
    <link rel="stylesheet" href="css/democss.css">
    <style>
        .form-input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        .button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }

        .button:hover {
            background-color: #45a049;
        }

        .back-button {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <button class="back-button" onclick="window.location.href='system_viewcustomers.jsp';">Back to Customer List</button>
    <div class="form-container">
        <h1>Edit Customer</h1>
        <form action="EditCustomerServlet" method="post">
            <input type="hidden" name="oldEmail" value="<%= request.getParameter("email") %>">
            <input type="email" class="form-input" name="newEmail" placeholder="Email" value="<%= request.getParameter("email") %>" required><br>
            <input type="text" class="form-input" name="name" placeholder="Name" value="<%= request.getParameter("name") %>" required><br>
            <input type="text" class="form-input" name="address" placeholder="Address" value="<%= request.getParameter("address") %>" required><br>
            <input type="text" class="form-input" name="type" placeholder="Type (company or individual)" value="<%= request.getParameter("type") %>" required><br>
            <input type="submit" class="button" value="Save Changes">
        </form>
    </div>
</body>
</html>
