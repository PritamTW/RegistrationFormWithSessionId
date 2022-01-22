<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@include file="conn1.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout page</title>
</head>
<body>

<% 
Class.forName(db_DRIVER_NAME);

Connection con=DriverManager.getConnection(db_URL,db_USERNAME,db_PASSWORD);
Statement st=con.createStatement();
Statement st1=con.createStatement();
Statement stquery=con.createStatement();
ResultSet rs,rs1,rs2;

try{
	/* String logindate=session.getAttribute("logindate").toString();
	String logintime=session.getAttribute("logintime").toString();
	 System.out.println("logindate  : "+logindate);
	 System.out.println("logintime  : "+logintime); */
    
	 String RecordDate="",RecordTime="",SQLQuery="";
	  
	 String username=session.getAttribute("userid").toString();
	 System.out.println("username >>>> "+username);
	 
	 SQLQuery="SELECT * FROM db_GlobalERP.t_loguseractivity where UserName='"+username+"' ";
	 System.out.println("SQLQuery: " + SQLQuery);
	  rs =stquery.executeQuery(SQLQuery); 
	 while (rs.next()) 
	 {
		 RecordDate = rs.getString("loginDate");
		  
		 
		 RecordTime = rs.getString("loginTime");
	 }
	 System.out.println("RecordDate >>> "+RecordDate);
	 System.out.println("RecordTime>>>> "+RecordTime); 

	 String logoutdate="",logouttime="";
	 java.util.Date now = new java.util.Date();
	     logoutdate=""+(now.getYear()+1900)+"-"+(1+now.getMonth())+"-"+now.getDate();
	     logouttime=""+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
	 
	  String updatesql="update db_GlobalERP.t_loguseractivity set LogOutDate='"+logoutdate+"', LogOutTime='"+logouttime+"' where loginDate='"+RecordDate+"' and loginTime='"+RecordTime+"' and UserName='"+username+"'";
	  int count2 =st.executeUpdate(updatesql);
	  
	  System.out.println("updatesql : "+updatesql);
	  System.out.println(count2+" row updated ");
 	  System.out.println("logoutdate : "+logoutdate);
 	  System.out.println("logouttime : "+logouttime);
 	  System.out.println("Logout Successfully....!");
}
catch(Exception e){
	e.printStackTrace();
}

session.setAttribute("userid", null);
session.invalidate();
response.sendRedirect("home.jsp");
%>
</body>
</html>