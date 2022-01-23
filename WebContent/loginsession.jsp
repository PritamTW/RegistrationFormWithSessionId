<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="Header.jsp" %>
<%@include file="conn1.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
    Connection con=null;
    Statement st=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
%>

<%
 
 
   String userid = request.getParameter("user"); 
   System.out.println("Username = "+userid);

   String pwd = request.getParameter("password");
   System.out.println("password = "+pwd);
%>


<%
 //load  driver class
 try{
 Class.forName(db_DRIVER_NAME);
  con=DriverManager.getConnection(db_URL,db_USERNAME,db_PASSWORD);
  
  Statement st = con.createStatement();
  Statement st1 = con.createStatement();
  Statement s2 = con.createStatement();
  
 String sessionid = "";
 

 ResultSet rs,rs1;
     rs = st.executeQuery("select * from members where user='" + userid + "' and pass='" + pwd + "'");
 if (rs.next()) {
     session.setAttribute("userid", userid);
     session.setAttribute("User", rs.getString("user"));
    /*  System.out.println("rs object created"); */
     
 	java.util.Date now = new java.util.Date();
     /* out.println("now >>"+now.toString()); */ 
     
     
     long millis=System.currentTimeMillis();  
     java.sql.Date date=new java.sql.Date(millis);  
     System.out.println("logindate :"+date);  
     
     java.util.Date date1 = new java.util.Date();
     String[] d = date1.toString().split("\\s+");
      String ss=d[3];
         System.out.println("logintime  :"+d[3]);

 	session.setAttribute("logindate",now);
 	session.setAttribute("logintime",now);
 	sessionid=session.getId().toString();

     String logindetails="insert into db_GlobalERP.t_loguseractivity(loginDate,loginTime,UserName,UserIp,SessionID) values('"+date+"','"+ss+"','"+userid+"','"+request.getRemoteAddr()+"','"+sessionid+"')";
     int count=s2.executeUpdate(logindetails);
 	
     System.out.println("logindetails>>>>"+logindetails);
     System.out.println(count+" row inserted ");
     
     out.println("<table><tr><td>welcome  </td><td>" + userid);
     out.println("</td></tr>");
     out.println("<tr><td><a href='logout.jsp'><input type='image' src='Images/logout.png' width='45px' height='45px'></a>");
     out.println("</td></tr></table>");
 }
 else{
	 response.sendRedirect("home.jsp?err=err1");
 }
 }
 
 catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>