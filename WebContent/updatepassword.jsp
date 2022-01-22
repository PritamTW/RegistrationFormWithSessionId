<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>

<%@include file="conn1.jsp"%>
<head>
<meta charset="UTF-8">
<title>password</title>
</head>
<%-- <%=session.getAttribute("userid")%> --%>
<%

	String user = request.getParameter("user");
	String Newpass = request.getParameter("new");
	String cnfpass = request.getParameter("confirm");

	System.out.println("Username>>>" + user);
	System.out.println("Newpass>>>" + Newpass);
	System.out.println("cnfpass>>>" + cnfpass);

	/* String connurl = "jdbc:mysql://localhost:3306/mydb"; */
	Connection con = null;
	
	
	/* session.setAttribute("userid", user) */;

	
	try {
		Class.forName(db_DRIVER_NAME);
		con = DriverManager.getConnection(db_URL, db_USERNAME, db_PASSWORD);
		Statement st = con.createStatement();
		
			Statement st1 = con.createStatement();
			String UpdateQry="update members set pass='" +Newpass+ "' where user='" +user+ "'";
			System.out.println("UpdateQry>>>> :"+UpdateQry);
  			
			int i = st1.executeUpdate(UpdateQry);
			System.out.println("i :" + i);
			 out.println("<table><tr><td>welcome " + user);
		     out.println("</td></tr>");
	        out.println("<tr><td>Password changed Successfully...! <br>"+"<a href='home.jsp'> Go to Login</a>");
	        out.println("</td></tr>");
	        out.println("<tr><td>username : "+user);
	        out.println("</td></tr><tr><td>password : "+Newpass);
	        out.println("</td></tr></table>");
			st1.close();
			con.close();
		/* } else {
			out.println("Invalid Current Password");
		} */
	} catch (Exception e) {
		out.println(e);
	}
%>