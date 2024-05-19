<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Customer Management</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        tr:hover { background-color: #f5f5f5; }

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

        .modal {
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
            width: 40%;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            animation: animatetop 0.4s;
        }

        .form-input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
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

        @keyframes animatetop {
            from {top: -300px; opacity: 0}
            to {top: 0; opacity: 1}
        }
    </style>
</head>
<body>
    <button class="button" onclick="window.location.href='system_index.jsp';">Back to Home</button>
    <h1>Customer List</h1>
    <button class="button" onclick="document.getElementById('searchCustomerModal').style.display='block'">Search Customers</button>
    <table>
        <thead>
            <tr>
                <th>Email</th>
                <th>Name</th>
                <th>Address</th>
                <th>Type</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <% 
                ArrayList<User> customers = (ArrayList<User>) session.getAttribute("customersList");
                if (customers != null && !customers.isEmpty()) {
                    for (User customer : customers) {
                        out.println("<tr><td>" + customer.getEmail() + "</td>"
                            + "<td>" + customer.getName() + "</td>"
                            + "<td>" + customer.getAddress() + "</td>"
                            + "<td>" + customer.getType() + "</td>"
                            + "<td><button class='button' onclick=\"openEditModal('" + customer.getEmail()
                            + "', '" + customer.getName().replace("'", "\\'")
                            + "', '" + customer.getAddress().replace("'", "\\'")
                            + "', '" + customer.getType().replace("'", "\\'")
                            + "')\">Edit</button></td>"
                            + "<td><a href='DeleteCustomerServlet?email=" + customer.getEmail()
                            + "' onclick='return confirm(\"Are you sure you want to delete this customer?\");' class='button'>Delete</a></td></tr>");
                    }
                } else {
                    out.println("<tr><td colspan='6'>No customers found.</td></tr>");
                }
            %>
        </tbody>
    </table>
    <div id="editCustomerModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="document.getElementById('editCustomerModal').style.display='none'">&times;</span>
            <h2>Edit Customer</h2>
            <form action="EditCustomerServlet" method="post">
                <input type="hidden" id="oldEmail" name="oldEmail">
                <input type="hidden" name="action" value="update">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="customerEmail" name="newEmail" required class="form-input">
                </div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="customerName" name="name" required class="form-input">
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="customerAddress" name="address" required class="form-input">
                </div>
                <div class="form-group">
                    <label for="type">Type (company or individual):</label>
                    <input type="text" id="customerType" name="type" required class="form-input" pattern="^(company|individual)$" title="Type must be either 'company' or 'individual'">
                </div>
                <button type="submit" class="button">Save Changes</button>
            </form>
        </div>
    </div>
    <div id="searchCustomerModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="document.getElementById('searchCustomerModal').style.display='none'">&times;</span>
            <h2>Search Customer</h2>
            <form action="SearchCustomerServlet" method="post">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" name="name" required class="form-input">
                </div>
                <div class="form-group">
                    <label for="type">Type (company or individual):</label>
                    <input type="text" name="type" required class="form-input" pattern="^(company|individual)$" title="Type must be either 'company' or 'individual'">
                </div>
                <button type="submit" class="button">Search</button>
            </form>
        </div>
    </div>
    <script>
        function openEditModal(email, name, address, type) {
            document.getElementById('editCustomerModal').style.display = 'block';
            document.getElementById('customerEmail').value = email;
            document.getElementById('customerName').value = name;
            document.getElementById('customerAddress').value = address;
            document.getElementById('customerType').value = type;
            document.getElementById('oldEmail').value = email;
        }

        window.onclick = function(event) {
            if (event.target.className === 'modal') {
                event.target.style.display = "none";
            }
        };
    </script>
</body>
</html>
