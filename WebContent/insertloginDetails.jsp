<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="conn1.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("user");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    
    System.out.println("user >>> "+user);
    System.out.println("fname >>> "+fname);
    System.out.println("lname >>> "+lname);
    System.out.println("email >>> "+email);

   
     System.out.println("driver loaded");
     Class.forName(db_DRIVER_NAME);   
  Connection con=DriverManager.getConnection(db_URL,db_USERNAME,db_PASSWORD);
     System.out.println("Conn created");
   Statement st = con.createStatement();
   System.out.println(" Statement executed");
    ResultSet rs;
    int i = st.executeUpdate("insert into members(first_name, last_name, email, user, pass, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "', CURDATE())");
    System.out.println("i......"+i);
    if (i > 0) {
        session.setAttribute("userid", user);
        out.print("Registration Successfull!"+"<a href='home.jsp'>Go to Login</a>");
        //response.sendRedirect("home.jsp");
      
    } else {
      //  response.sendRedirect("reg.jsp");
        out.print("Registration Failed !"+"<a href='reg.jsp'>Registration</a>");  
    }
%>

</body>
</html>