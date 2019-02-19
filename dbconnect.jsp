<html>
<body>

<%@  page  language="java"  import="java.sql.*"  %>
<%
	out.println("Hellooooooooo.................");
	Connection conn;
	conn=null;
	try
	{
		
		Class.forName("org.postgresql.Driver");
		out.println("Driver Loaded");
		conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres",""); 
		out.println("Connected...");
				
	}
	catch(Exception E)
	{
		out.println("Error "+E);
	}
	%>
</body>
</html>
