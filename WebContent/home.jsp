<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<link rel="icon" type="image/x-icon" href="/images/favicon.ico">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
	function validate() {
		if (document.getElementById("user").value == "") {
			alert("Please Enter User Name");
			return false;
		}
		if (document.getElementById("password").value == "") {
			alert("Please Enter password");
			return false;
		}
		return true;
	}
</script>
</head>
<body>

	<!-- <div id="header">
			<div id="logo">
				<img src="login.jpg"></img>
			</div> 
</div>
 -->
	<form name=userinfo method="post" action="loginsession.jsp"
		onSubmit="return validate();">
		<center>
			<br> <br> <br> <br>

			<div style="margin: 24px 0;">
				<a href="https://www.google.com/"><i class="fa fa-dribbble"></i></a>
				<a href="https://www.twitter.com/"><i class="fa fa-twitter"></i></a>
				<a href="https://www.linkedin.com/"><i class="fa fa-linkedin"></i></a>
				<a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a>
			</div>
			<div class="form">

				<h2>Login to your Account</h2>
				<form>
					<table border="1" width="30%" cellpadding="3">
						<thead>
							<tr>
								<th colspan="2">Login Here</th>
							</tr>
						</thead>
						<tbody>
							<td colspan="2">&nbsp; <%
 	try {
 		String msg = request.getParameter("err");
 		if (msg.equals("err1")) {
 			out.print("<font color='Red' size='2'>Please enter correct user name and password</font>");
 		}
 		if (msg.equals("err2")) {
 			out.print("<font color='Red' size='2'>Session expired, please login again.</font>");
 		}
 	} catch (Exception a) {
 	}
 %>
							</td>
							</tr>
							<tr>
								<td>UserName</td>
								<td><input type="text" name="user" value="" id="user"
									placeholder="Username" /></td>
							</tr>

							<tr>
							<tr>
								<td>Password</td>
								<td><input type="password" name="password" value=""
									id="password" placeholder="Password" /></td>
							<tr>
								<td colspan="1"><input type="image" src="Images/login1.jpg"
									width="85px" height="45px"></td>
								<td><a href="reg.jsp">Register Here</a> <br>
								<br> <a href="forgetpassword.jsp">forget password ??</a></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
</body>
</html>