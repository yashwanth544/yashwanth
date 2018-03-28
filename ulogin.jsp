<%@ page import="java.sql.*" %>
<%
String uname=request.getParameter("uname");
String pwd=request.getParameter("pwd");	
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/captcha","root","");
	Statement stmt=con.createStatement();
	String sql="select pwd from user_reg where name='"+uname+"'";
	ResultSet rs=stmt.executeQuery(sql);
	while(rs.next())
	{
		if((rs.getString(1)).equals(pwd))
		{%>
		<html>
		<jsp:forward page="upload.html"/>
		</html>
		<%	
		}
		else
		{ %>
		<html>
		<jsp:forward page="file3.html"/>
		</html>
		<% }
	}
}
catch(Exception e)
{
	out.print("error"+e);
}
%>
