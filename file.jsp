<%@ page import="java.sql.*" %>
<%
String alt=request.getParameter("alt");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/captcha","root","");
	Statement stmt=con.createStatement();
	String sql="insert into image1(alt)values('"+alt+"')";
	stmt.executeUpdate(sql);
}
catch(Exception e)
{
	out.print("error is "+e);
}
%>
