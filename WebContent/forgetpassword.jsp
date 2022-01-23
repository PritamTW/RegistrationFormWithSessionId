<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<%
	/* String userid = request.getParameter("user");
	System.out.println("Username = " + userid);
	
	String pwd = request.getParameter("password");
	System.out.println("password = " + pwd); */

	/* out.println("username :"); */
%>

<%-- <%=session.getAttribute("userid")%> --%>
</head>
<body>
	<form action="updatepassword.jsp" method="get">
		<table border="1" width="30%" cellpadding="3">
							<thead>
								<tr>
									<th colspan="2">change password Here</th>
								</tr>
							</thead>
							<tbody>
			<tr>
				<td>Enter UserName</td>
				<td><input type="text" name="user" value="" id="user"
					placeholder="Username" /></td>
			</tr>

			<tr>
				<td>New Password</td>
				<td><input type="password" name="new" placeholder="Enter password"></td>
			</tr>
			<tr>
				<td>Confirm Password</td>
				<td><input type="password" name="confirm" placeholder="Confirm password"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Change Password"></td>
				<td><a href="home.jsp"> <img alt="" src="Images/back1.png" width="50px" height="50px"></a></td>
			</tr>
			</tbody>
			
		</table>
	</form>
</body>
</html>