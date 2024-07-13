<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Processing</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Hardcoded credentials for demonstration purposes. Replace with secure method.
    String correctUsername = "admin";
    String correctPassword = "admin123";

    if (correctUsername.equals(username) && correctPassword.equals(password)) {
        // Successful login, redirect to admin page
        response.sendRedirect("admin.jsp");
    } else {
        // Failed login
        out.println("<script>alert('Invalid login credentials');location='login.html';</script>");
    }
%>
</body>
</html>
