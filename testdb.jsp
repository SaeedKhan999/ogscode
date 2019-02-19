<html>
<body>
<%@  page errorPage="errorpage.jsp" language="java"  import="java.sql.*"  %>

<%
	Connection conn;
	conn=null;
	ResultSet rs;
	rs=null;

	try
	{
		Class.forName("org.postgresql.Driver");
		out.println("Driver Loaded...");
		conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres",""); 
		 out.println("Connection Created...");

		PreparedStatement stat= conn.prepareStatement("SELECT * FROM user_auth where username=? and password =?");

		
	}
	catch(Exception E)
	{
		out.println("Error  "+E);
	}

%>
</body>
</html>
