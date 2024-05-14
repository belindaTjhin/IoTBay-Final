<%-- 
    Document   : catalogue_delete_device
    Created on : 14/05/2024, 11:47:26 AM
    Author     : btjhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/democss.css">
        <title>Delete Device</title>
    </head>
    <body>
        <% 
            String existErr = (String) session.getAttribute("existErr");
            String updated = (String) session.getAttribute("updated");
        %>
        <div class="login-box">
            <h1>Enter device name to delete: <span> <%=(existErr != null ? existErr : "")%></span></h1>
            <div class="form-container">
                <form action="DeleteDeviceServlet" method="post">
                    <table>
                        <tr>
                            <td>Product name:</td>
                            <td><input type="text" placeholder="Enter device name" name="productName"></td>
                        </tr>
                    </table>
                    <span class="message"> <%=(updated != null ? updated : "")%></span>
                    <br>
                    <div class="buttons">
                        <input class="button" type="submit" value="Delete Device">
                        <a class="button" href="catalogue_main.jsp">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
