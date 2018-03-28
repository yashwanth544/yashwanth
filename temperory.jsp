<%@ page import="java.sql.*" %>
<%
String fn=request.getParameter("fn");
String gender=request.getParameter("gender");
String ad=request.getParameter("ad");
String email=request.getParameter("email");
String pwd=request.getParameter("pwd");
String mobile=request.getParameter("mobile");
String question=request.getParameter("question");
String answer=request.getParameter("answer");

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/captcha","root","");
	Statement stmt=con.createStatement();
	String sql="insert into user_reg(name,gender,addr,email,pwd,mob,que,ans)values('"+fn+"','"+gender+"','"+ad+"','"+email+"','"+pwd+"','"+mobile+"','"+question+"','"+answer+"')";
	stmt.executeUpdate(sql);
}
catch(Exception e)
{
	out.print("error is "+e);
}
%>
<html>
<head>
<jsp:forward page="file5.html"/>
</head>
</html>