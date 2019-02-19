<HTML>
<HEAD>
<TITLE>Modify Category</TITLE>
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
</HEAD>

<BODY>
<link rel="stylesheet" type="text/css" href="prac.css">


	<CENTER> 	
<font size=8>Online Grocery Shop Management System </font size=8> 
	</CENTER> 
<br>
<ul>
  <li><a class="active" href="Logout.jsp">Logout</a></li>
  <li><a class="active" href="Update_Category.jsp">Back</a></li>
 <li><a class="active" href="Admin.html">Admin Home</a></li>
  </ul><br><hr><br>

	<%@ page errorPage="errorpage.jsp" import="java.net.*" %>
	<%@ page import="java.io.*" %>
	<%@ page import="java.sql.*" %>
	<%
		Connection con = null;

		PreparedStatement stat = null;
		int rs = 0;
		String query=null;
		try
		{
		String new_cat="";
		int cat_id=0;
		
		new_cat=request.getParameter("vr_cat");
		cat_id=Integer.parseInt(request.getParameter("cat_val"));

		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres",""); 
		
		
		query="UPDATE category_details SET CATEGORYNAME=? WHERE CATEGORYID=?";
		
		stat = con.prepareStatement(query);
		stat.setString(1,new_cat);
		stat.setInt(2,cat_id);
		
		rs=stat.executeUpdate();
		
		if (rs==1)
		{
			out.println("Category Successfully Modified");
		}
		else
		{
			out.println("Transaction Not Allowed");
		}
		}
		catch(Exception e)
		{
			out.print("Error = " + e + "<HR>");
		}
		finally
		{
			con.close();
		}
	%>
		
</BODY>
</HTML>
