<HTML>

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
<li><a class="active" href="Logout.jsp">Logout</a></li>
  <li><a class="active" href="Insert_Category.jsp">Back</a></li>
 <li><a class="active" href="Admin.html">Admin Home</a></li>
  </ul><br>
	<HR>
	<BR>

	<%@ page errorPage="errorpage.jsp" import="java.net.*" %>
	<%@ page import="java.io.*" %>
	<%@ page import="java.sql.*" %>
	<%
		Connection con = null;
		
		PreparedStatement stat = null;
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres",""); 
		

		int rs;
		int int_CATEGORYID;
		
		String query=null;
		String str_CATEGORY;

 		int_CATEGORYID=(int)(10000*Math.random()+1);
 		str_CATEGORY=request.getParameter("cat_name");
 
 	
		query="insert into CATEGORY_details values (?,?)";
		stat = con.prepareStatement(query);
		stat.setInt(1,int_CATEGORYID);
		stat.setString(2,str_CATEGORY);
 		
		rs=stat.executeUpdate();
 		if (rs==1)
 		{
			%><H3>New Category Successfully Added</H3><%
		}
		else
		{
			%><H3>Transaction Not Allowed</H3><%
		}
 	%>
 	<BR>

</BODY>
</HTML>
