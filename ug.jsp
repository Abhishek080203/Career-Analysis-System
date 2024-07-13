<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    body {
       font-family: Arial, sans-serif;
            background-color: #d5eee9;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;

}
.container{
    width: 400%;
            max-width: 900px;
            margin: 200px ;
            background-color: #d8d5d7;
            padding: 50px;
            border-radius: 0px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
h1 {
    text-align: center;
            color: #333333;
            margin-bottom: 20px;
            font-size: 3.5em; /* Increase font size */
            padding: 20px; /* Add padding for extra space */
            background-color: #c8d4df; /* Background color for heading */
            border-radius: 10px; /* Rounded corners for heading */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 

        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 50px;
            border-bottom: 1px solid #ddd;
            text-align: left;
            background-color: #d0e8c4;
            background-color: #f4f8f3;
            font-size: large;
        }
        
    </style>
</head>
<body>
    <div class ="container">
    <h1>courses for you</h1>
 <table >
    <tr>
    </tr>
<%
String SQL = "";
String s1 = request.getParameter("stream");
if (s1 != null) {
    switch(s1) {
        case "maths":
            SQL = "SELECT * FROM UGRADUATE WHERE S_NAME='MATHS'";
            break;
        case "science":
            SQL = "SELECT * FROM UGRADUATE WHERE S_NAME='SCIENCE'";
            break;
        case "commerce":
            SQL = "SELECT * FROM UGRADUATE WHERE S_NAME='commerce'";
            break;
        default:
            SQL = "SELECT * FROM UGRADUATE WHERE S_NAME='arts'";
            break;
    }
}

try {
     
    Class.forName("com.mysql.cj.jdbc.Driver");
   Connection cn = DriverManager.getConnection("jdbc:mysql://@localhost:3306/career", "root", "Abhi@11");
    PreparedStatement pst = cn.prepareStatement(SQL);
    ResultSet rs=pst.executeQuery();
    while(rs.next()){
        String S_ACCESS =rs.getString(2);

%>
<tr>
    <td><%=S_ACCESS%></td>
</tr>
<% 
    }
}catch(Exception e){
out.println("problem");
}
%>
<%      
String s2=request.getParameter("student_name");
String s3=request.getParameter("student_email");
String s4=request.getParameter("stream");
String s5=request.getParameter("year");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/career", "root", "Abhi@11");
            
            PreparedStatement pst = cn.prepareStatement("insert into admin(student_name,student_email,Stream,year)  values(?,?,?,?)");
            
            pst.setString(1,s2);
            pst.setString(2,s3);
            pst.setString(3,s4);
            pst.setString(4,s5);
            int x = pst.executeUpdate();
        }
            catch (ClassNotFoundException e) {

             } 
            catch (SQLException e) {
             
            }
    
    
        %>
   </table>
</div>
</body>
</html>