<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page - Visitor Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f6f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 1200px;
            margin: 20px 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #50b3a2;
            color: #ffffff;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        h1, h2 {
            text-align: center;
        }
        footer {
            background-color: #50b3a2;
            color: #ffffff;
            padding: 10px 0;
            width: 100%;
            text-align: center;
            position: fixed;
            bottom: 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Visitor Data</h1>
        
        <h2>Undergraduate Visitors</h2>
        <table>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Stream</th>
                <th>Year</th>
            </tr>
            <%
                String url = "jdbc:mysql://localhost:3306/career";
                String username = "root";
                String password = "Abhi@11";

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(url, username, password);

                    // Retrieve data from table
                    String sqlUG = "SELECT * FROM admin";
                    PreparedStatement stmtUG = conn.prepareStatement(sqlUG);
                    ResultSet rsUG = stmtUG.executeQuery();

                    while (rsUG.next()) {
                        String name = rsUG.getString("student_name");
                        String email = rsUG.getString("student_email");
                        String stream = rsUG.getString("stream");
                        String year = rsUG.getString("year");
            %>
            <tr>
                <td><%= name %></td>
                <td><%= email %></td>
                <td><%= stream %></td>
                <td><%= year %></td>
            </tr>
            <%
                    }
                    rsUG.close();
                    stmtUG.close();
            %>
        </table>

        <h2>Postgraduate Visitors</h2>
        <table>
            <tr>
                <th>Name</th>
                <th>Course</th>
                <th>Date</th>
            </tr>
            <%
                    // Retrieve data from  table
                    String sqlPG = "SELECT * FROM admin2";
                    PreparedStatement stmtPG = conn.prepareStatement(sqlPG);
                    ResultSet rsPG = stmtPG.executeQuery();

                    while (rsPG.next()) {
                        String name = rsPG.getString("name");
                        String course = rsPG.getString("course");
                        String date = rsPG.getString("date");
            %>
            <tr>
                <td><%= name %></td>
                <td><%= course %></td>
                <td><%= date %></td>
            </tr>
            <%
                    }
                    rsPG.close();
                    stmtPG.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
            %>
            <tr>
                <td colspan="3">Error retrieving data</td>
            </tr>
            <%
                }
            %>
        </table>
    </div>

    <footer>
        <p>Contact us: 7566716101</p>
    </footer>
</body>
</html>

