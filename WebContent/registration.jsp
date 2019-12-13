<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<style>
* { box-sizing: border-box }
html, body {
  display: table;
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  background: #eee;
}
body {
  display: table-cell;
  vertical-align: middle;
}
.box {
  margin: auto;
  padding: 25px 50px;
  width: 500px;
  min-height: 115px;
  background: #fff;
  border-left: 5px solid #9b2;
  box-shadow: 0 0 20px rgba(0,0,0,.15);
  font: 12px/15px Arial, Helvetica, sans-serif;
  color: #666;
}
h2 {
  margin: 0 10px;
  line-height: 20px;
  text-align: center;
}
form {
  padding: 0 10px 10px;
}
form::after {
  content: "";
  display: block;
  clear: both;
}
label {
  position: absolute;
  left: -9999px;
}
input {
  position: relative;
  z-index: 10;
  margin: 0;
  padding: 0 5px;
  width: 225px;
  height: 30px;
  border: 1px solid #ccc;
}
input:focus {
  z-index: 15;
  box-shadow: 0 0 10px rgba(0,0,0,.1);
  outline: 0;
}
#password {
  top:-1px;
  margin-bottom: 5px;
}
.register-form {
  display: none;
}
.register-form input {
  margin: -1px 0;
}
#first-name {
  margin-top: 5px;
}
.captcha {
  margin: 10px 0;
}
.captcha label {
  position: relative;
  left: 0;
}
#submit {
  padding: 0;
  width: 75px;
  background: #9b2;
  color: #140;
  border-color: #471;
}
#submit:hover {
  color: #025;
  background: #28e;
  border-color: #16c;
}
#submit ~ a {
  display: block;
  float: left;
  width: 120px;
  text-decoration: none;
  color: #666;
}
#submit ~ a:hover {
  text-decoration: underline;
</style>

<body>
	<h2>REGISTRATION TO OLA SERVICE</h2>
	<div class="box">
		<form action="RegistrationService" method="post">
			<table>
				<tr>
					<td>User Name</td>
					<td><input type="text" name="userName" /></td>
				</tr>
				<tr>
					<td>First Name</td>
					<td><input type="text" name="firstName" /></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input type="text" name="lastName" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="pass" /></td>
				</tr>
				<tr>
					<td>Email id</td>
					<td><input type="text" name="emailId" /></td>
				</tr>
				<tr>
					<td>Phone Number</td>
					<td><input type="text" name="phone" /></td>
				</tr>
				<tr>
					<td>Date of Birth </td>
					<td><input type="text" name="dob" /></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td><input type="text" name="gender" /></td>
				</tr>
			</table>
			<input type="submit" id="submit" value="register" />
		</form>
	</div>
</body>
</html>