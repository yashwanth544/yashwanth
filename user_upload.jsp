<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
String fileupld=request.getParameter("fileupld");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/captcha","root","");
	PreparedStatement pstmt=con.prepareStatement("select img from upload where id=?");
	out.print(pstmt);
	ResultSet rs=pstmt.executeQuery();
	
	while(rs.next())
	{
		if(rs.getString(1).equals(fileupld))
		{%>
		<html>
		<jsp:forward page="file8.html"/>
		</html>
		<%	
		}
		else
		{ %>
		<html>
		<jsp:forward page="upload.html"/>
		</html>
		<% }
	}
}
catch(Exception e)
{
	out.print("error"+e);
}
%>
