<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Form</title>
<link href="style.css" rel="stylesheet"/>
</head>
<body>
<h1 align="center">Login Form</h1>
<hr>
<div class="login">
<form action="login" method="post">
<div>
<div><label>Username:</label></div>
<div>
<input type="text" name="username"
placeholder="Enter your username"/>
</div>
</div>
<div class="leavespace">
<div><label>Password:</label></div>
<div>
<input type="password" name="password"
placeholder="Enter your password"/>
</div>
</div>
<div class="leavespace">
<input type="submit" value="Login">
<input type="reset" value="Reset"/><br><br>
<a href="register.jsp">Click Here for
Registration</a>
</div>
</form>
</div>
</body>
</html