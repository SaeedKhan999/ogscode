<html>
<HEAD>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
    background-color: #111;
}

.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}
</style>
<TITLE>validation</TITLE>
</HEAD>
<body>
<link rel="stylesheet" type="text/css" href="prac.css">
<CENTER> 	
<font size=8>Online Grocery Shop Management System </font size=8> 
	</CENTER> 
<br>
<ul>
  <li><a class="active" href="home.html">Home</a></li>
<li><a class="active" href="Login.html">Login</a></li>
  
  </ul><br>
	<HR>
	<BR>

<%@  page errorPage="errorpage.jsp" language="java"  import="java.sql.*"  %>
<%
	Connection conn;
	conn=null;
	ResultSet rs;
	rs=null;
	try
	{
		String strName=request.getParameter("UserName");
		String strPass=request.getParameter("Password");
		Class.forName("org.postgresql.Driver");
		conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres","");  
		PreparedStatement stat= conn.prepareStatement("SELECT * FROM user_auth where username=? and password =?");
		stat.setString(1,strName);
		stat.setString(2,strPass);
		rs = stat.executeQuery();
		if(rs.next())
		{
			
			String str1,str2;
			str1=rs.getString(1);
			str2=rs.getString(2);
			out.println(str1+str2);
			session.putValue("user",strName);
			if(str1.equals("Administrator"))
			{
				response.sendRedirect("Admin.html");
			}
			else
			{
				out.println("Logged IN");
				response.sendRedirect("SearchCriteria.jsp");
			}
		}       
		else
		{
			response.sendRedirect("InvalidUser.html");
		}
	}
	catch(Exception E)
	{
		out.println("Error "+E);
	}
	finally
	{
		rs.close();
		conn.close();
	}
	%>
</body>
</html>
