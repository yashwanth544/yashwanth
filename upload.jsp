<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
PreparedStatement pstmt= null;
String fileupld=request.getParameter("fileupld");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/captcha","root","");
	File image= new File(fileupld);
	pstmt=con.prepareStatement("insert into upload(img)values(?)");
	FileInputStream fis=new FileInputStream(image);
	pstmt.setBinaryStream(1, (InputStream) fis, (int) (image.length()));
	int count=pstmt.executeUpdate();
	if(count>0)
	{
		out.print("insert successfully");
	}
	else
	{
		out.print("not successful");
	}
}
catch(Exception e)
{
	out.print("error is "+e);
}
%>	
<html>
<jsp:forward page="file6.html"/>
</html>