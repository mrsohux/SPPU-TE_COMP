<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!--Invisible Part-->
<head>
<title>Student Registration Form</title>
<script>
function validate(){
var uname = stdreg.uname.value;
var upwd = stdreg.upwd.value;
var fname = stdreg.fname.value;
var lname = stdreg.lname.value;
var uemail = stdreg.uemail.value;
var ucourse = stdreg.ucourse.selectedIndex;
var umobno = stdreg.umno.value;
var flag = false;
var str = "";
var efilter = /^([a-zA-Z0-9\_\.\-])+\@(([a-zA-Z0-9\-])
+\.)+([a-zA-Z0-9]{2,4})+$/;
if(uname.trim()===""){
flag=true;
str +=" Username should not be blank!!\n";
}
if(upwd.trim()===""){
flag=true;
str +=" Password is Blank or Does not Match!!\n";
}
if(fname.trim()===""){
flag = true;
str += " Firstname should not be blank!!\n";
}
if(lname.trim()===""){
flag=true;
str += " Lastname should not be blank!!\n";
ROLL NO.15 Mayur.D.Nikam
}
if(stdreg.gender[0].checked==false&&stdreg.gender[1].checked==fals
e){
flag=true;
str +=" Gender is not selected!!\n";
}
if(!efilter.test(uemail)){
flag=true;
str +=" Email is not valid!!!\n";
}
if(ucourse==0){
flag=true;
str+=" Course is not selected!!\n";
}
if(isNaN(umobno)||umobno.length<12){
flag = true;
str+=" Mobile Number is not valid!!\n";
}
if(flag){
alert("Warning!!\n"+str);
return false;
}
else{
return true;
}
}
</script>
<link rel="stylesheet" href="style.css">
</head>
<!--Visible Part-->
<body>
<h1 align="center">Registration Form</h1>
<hr>
<div class="container">
<form name="stdreg" action="register" method="POST"
onsubmit="return validate();">
<div class="row">
<div class="col-
20"><label>Username:</label></div>
<div class="col-80"><input type="text"
name="uname" placeholder="Enter your username"></div>
</div>
<div class="row">
<div class="col-
20"><label>Password:</label></div>
<div class="col-80"><input type="password"
name="upwd" placeholder="Enter your password"></div>
</div>
<div class="row">
<div class="col-
20"><label>Firstname:</label></div>
<div class="col-80"><input type="text"
name="fname" placeholder="Enter your firstname"></div>
</div>
<div class="row">
<div class="col-
20"><label>Lastname:</label></div>
<div class="col-80"><input type="text"
name="lname" placeholder="Enter your lastname"></div>
</div>
<div class="row">
<div class="col-
20"><label>Gender:</label></div>
<div class="col-80">
<input type="radio" name="gender"
value="Male">Male
<input type="radio" name="gender"
value="Female">Female
</div>
</div>
<div class="row">
<div class="col-
20"><label>Email:</label></div>
<div class="col-80"><input type="text"
name="uemail" placeholder="Enter your email id"></div>
</div>
<div class="row">
<div class="col-
20"><label>Course:</label></div>
<div class="col-80"><select name="ucourse">
<option>Select Class</option>
<option>SE COMP</option>
<option>TE COMP</option>
<option>BE COMP</option>
</select></div>
</div>
<div class="row">
<div class="col-20"><label>Mobile
No.:</label></div>
<div class="col-80"><input type="text"
name="umno" placeholder="Enter your mobile number"></div>
</div>
<div class="row">
<input type="submit" value="Submit">
<input type="reset" value="Reset">
</div>
</form>
</div>
</body>
</html>