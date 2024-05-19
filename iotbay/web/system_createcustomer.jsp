<%@page import="uts.isd.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create Customer</title>
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
    <button class="back-button" onclick="window.location.href='system_index.jsp';">Back to Home</button>
    <div class="form-container">
        <h1>Create Customer</h1>
        <form action="CreateCustomerServlet" method="post">
            <input type="email" class="form-input" name="email" placeholder="Email" required><br>
            <input type="text" class="form-input" name="name" placeholder="Name" required><br>
            <input type="text" class="form-input" name="address" placeholder="Address" required><br>
            <input type="text" class="form-input" name="type" placeholder="Type (company or individual)" required><br>
            <input type="submit" class="button" value="Create Customer">
        </form>
    </div>
</body>
</html>
