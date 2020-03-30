<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.sql.*" %>
<%Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-
8">
<title>Home Page</title>
</head>
<body>
<%
//Check whether session has been set or not
if((session.getAttribute("unm")==null)){
response.sendRedirect("login.jsp");
}
//Accept data from input fields
String uname = request.getParameter("username");
String upwd = request.getParameter("password");
%>
<h1>Welcome <%= uname %> ..!!</h1>
<hr>
<%
//Connection with the database
Connection con =
DriverManager.getConnection("jdbc:mysql://localhost:3306/akshay","
root","root");
//Prepare the sql query
PreparedStatement ps = con.prepareStatement("select * from mydata
where username=? and password=?");
//Assign the values to the columns
ps.setString(1,uname);
ps.setString(2,upwd);
//Execute the query
ResultSet rs = ps.executeQuery();
%>
<table border="1" cellspacing="3" cellpadding="10">
<tr>
<th>Username</th>
<th>Password</th>
<th>Firstname</th>
<th>Lastname</th>
<th>Gender</th>
<th>Email</th>
<th>Course</th>
<th>Mobile Number</th>
</tr>
<% while(rs.next()){ %>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(3) %></td>
<td><%= rs.getString(4) %></td>
<td><%= rs.getString(5) %></td>
<td><%= rs.getString(6) %></td>
<td><%= rs.getString(7) %></td>
<td><%= rs.getString(8) %></td>
</tr>
<% }%>
</table><br>
<form action="logout" method="post">
<input type="submit" value="Logout">
</form>
</body>
</html>