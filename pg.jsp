<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<!DOCTYPE html>
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
String s1 = request.getParameter("course");
if(s1.equals("Bca")){
    SQL="SELECT*FROM PGRADUATE WHERE C_NAME='BCA' ";
}
else if(s1.equals("Btech")){
    SQL="SELECT*FROM PGRADUATE WHERE C_NAME='BTECH' ";
}
else if(s1.equals("B-com")){
    SQL="SELECT*FROM PGRADUATE WHERE C_NAME='BCOM' ";
}else if(s1.equals("B-pharma")){
    SQL="SELECT*FROM PGRADUATE WHERE C_NAME='BPHARMA' ";
}else if(s1.equals("BA")){
    SQL="SELECT*FROM PGRADUATE WHERE C_NAME='BA' ";
}else{
    SQL="SELECT*FROM PGRADUATE WHERE C_NAME='BBA' ";
}
try {
            
    Class.forName("com.mysql.cj.jdbc.Driver");

   Connection cn = DriverManager.getConnection("jdbc:mysql://@localhost:3306/career", "root", "Abhi@11");
    PreparedStatement pst = cn.prepareStatement(SQL);
    ResultSet rs=pst.executeQuery();
    while(rs.next()){
        String C_ACCESS =rs.getString(2);

%>
<tr>
    <td><%=C_ACCESS%></td>
</tr>
<% 
    }
}catch(Exception e){
out.println("problem");
}

%>
<%      
String s2=request.getParameter("name");
String s3=request.getParameter("course");
String s4=request.getParameter("date");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/career", "root", "Abhi@11");
            
            PreparedStatement pst = cn.prepareStatement("insert into admin2(name,course,date) values(?,?,? )");
            
            pst.setString(1,s2);
            pst.setString(2,s3);
            pst.setString(3,s4);
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