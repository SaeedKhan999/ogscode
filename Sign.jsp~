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
<TITLE>Insert New Category</TITLE>
</HEAD>

<BODY>
<link rel="stylesheet" type="text/css" href="prac.css">


	<CENTER> 	
<font size=8>Online Grocery Shop Management System </font size=8> 
	</CENTER> 
<br>
<ul>
  <li><a class="active" href="home.html">Home</a></li>

  </ul><br>
	
	<BR>

<%@  page errorPage="errorpage.jsp" language="java"  import="java.sql.*,java.util.*"  %>

<%
	Connection conn;
	conn=null;
	ResultSet rs;
	rs=null;

	String UserName=request.getParameter("UserName");
	String Password=request.getParameter("Password");
	String Password2=request.getParameter("Password2");
	String FirstName=request.getParameter("FirstName");
	String MiddleName=request.getParameter("MiddleName");
	String LastName=request.getParameter("LastName");
	String Address1=request.getParameter("Address1");
	String Address2=request.getParameter("Address2");
	String City=request.getParameter("City");
	String State=request.getParameter("State");
	String PinCode=request.getParameter("PinCode");
	String Email=request.getParameter("Email");
	String Phone=request.getParameter("Phone");
	
	int flag=0;
	
	try
	{
		Class.forName("org.postgresql.Driver");
		conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres","");  
		PreparedStatement stat= conn.prepareStatement("SELECT * FROM user_profile where username=?" );
		
            stat.setString(1,UserName);
		rs = stat.executeQuery();
            out.println("query executed");
		if(rs.next())
		{
			flag=1;
			%>
			<SCRIPT language="JavaScript">
			alert("User name already exists");
			location.href="NewUser.html";
			</SCRIPT>
			<%
		}
		else
		{
			flag=0; // conn.close();
		}
	}
	catch(Exception E)
	{
		out.println("Error  "+E);
	}
	if(flag == 0)
	{
		try
		{

		PreparedStatement stat1=conn.prepareStatement("INSERT INTO user_auth values(?,?)");
			stat1.setString(1,UserName);
			stat1.setString(2,Password);

			PreparedStatement stat=conn.prepareStatement("INSERT INTO user_profile values(?,?,?,?,?,?,?,?,?,?,?,?)");
			stat.setString(1,UserName);
			stat.setString(2,Password);
			stat.setString(3,FirstName);
			stat.setString(4,MiddleName);
			stat.setString(5,LastName);	
			stat.setString(6,Address1);
			stat.setString(7,Address2);
			stat.setString(8,City);
			stat.setString(9,State);
			stat.setString(10,PinCode);
			stat.setString(11,Email);
			stat.setString(12,Phone);

			stat.executeUpdate(); 
                        stat1.executeUpdate(); 
			flag=0;	
			session.setAttribute("u", UserName);
			session.setAttribute("p", Password);
			session.setAttribute("m", Email);
			response.sendRedirect("EmailServlet1");
		}
		catch(Exception E)
		{
			out.println("Error inserting value"+E);
		}	
		finally
		{
			rs.close();
			conn.close();
		}
		
	}
	
%>
</body>
</html>
