<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<style>
#example1 {
    background: url(image.png);
    background-repeat: no-repeat;
   background-size:50%
}

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
  line-height: 40px;
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
  float: right;
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
}
</style>

<body id="example1">
	<div class="box">
  
  <h2>Login</h2>
  
  <form method="post">
    
    <!-- Login -->
    
    <div class="login-form">
      
      <label for="username">Username</label>
      <input type="text" id="username" name="userName" placeholder="Username">
      
      <label for="password">Password</label>
      <input type="password" id="password" name="pass" placeholder="Password">
      
    </div>
     
    <input type="submit" id="submit" value="sign in" onclick="form.action='LoginService';"/>
	<input type="submit" id="submit" value="sign up" onclick="form.action='registration.jsp';">
    
    
    
  </form>
</div>
</body>
</html>