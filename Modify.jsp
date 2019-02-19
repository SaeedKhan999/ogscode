<!DOCTYPE html>
<html>
<head>
<TITLE>Modify Details</TITLE>
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
</head>
<BODY>
<link rel="stylesheet" type="text/css" href="prac.css">


	<CENTER> 	
<font size=8>Online Grocery Shop Management System </font size=8> 
	</CENTER> 
<br>
<ul>
  
  <li><a href="Logout.jsp">Logout</a></li>

  <div class="dropdown">
    <a href="#" class="dropbtn">Product</a>
    <div class="dropdown-content">
      <a href="Insert.jsp">Insert</a>
      <a href="Modify.jsp">Modify</a>
      
    </div>
</div>

 <div class="dropdown">
    <a href="#" class="dropbtn">Category</a>
    <div class="dropdown-content">
      <a href="Insert_Category.jsp">Insert</a>
      <a href="Update_Category.jsp">Modify</a>
	
  </div>
  </div>

<div class="dropdown">
    <a href="#" class="dropbtn">Details</a>
    <div class="dropdown-content">
      <a href="cust.jsp">View Customer</a>
      <a href="report.jsp">View all Report</a>
<a href="current.jsp">View current Report</a>
  </div>
  </div>
<li><a  href="Admin.html">Admin Home</a></li>
  </ul>

<center>
	<H1>Modify Product Details</H1>
	</CENTER>
	
	<%@ page errorPage="errorpage.jsp" import="java.net.*" %>
	<%@ page import="java.io.*" %>
	<%@ page import="java.sql.*" %>
	<%
		Connection con = null;
		
		PreparedStatement stat = null;
			
		ResultSet rs = null;
		String query=null;
		int ctr=0;
		try
		{
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres",""); 
		
			
		query="Select a.*,b.categoryname from product_details a, category_details b where a.categoryid=b.categoryid";
		stat = con.prepareStatement(query);
		
		rs=stat.executeQuery();
	%>
		<br><h3>List of Available Products:</h3>
		<form name="Mod" action="Modify_Product.jsp">
		<table border=1>
		<tr>
		<td>S.No</td>
		<td>Product Id</td>
		<td>Product Name</td>
		<td>Company Name</td>
		<td>Dealer</td>
		
		<td>Price (in Rs./kg)</td>
		<td>Quantity Available(in kg)</td>
		<td>Description</td>
		<td>Category</td>
		</tr>
		<% 
		int int_ProductID,int_CATEGORYID,int_PRICE,int_QUANTITY;
		String str_TITLE,str_Company,str_Dealer,str_DESCRIPTION;
		while(rs.next())
		{
			ctr=ctr+1;
			out.println("<tr><td>"+ctr);
			int_ProductID=rs.getInt(1);
			out.println("<td>");
			out.println("<input type=radio name=R1 value="+int_ProductID+">");
					
			int_CATEGORYID=rs.getInt(2);
						
			str_TITLE=rs.getString(3);
			out.println("<td>");
			out.println(str_TITLE);
			
			str_Company=rs.getString(4);
			out.println("<td>");
			out.println(str_Company);
				
			str_Dealer=rs.getString(5);
			out.println("<td>");
			out.println(str_Dealer);
			
			
			int_PRICE=rs.getInt(6);
			out.println("<td>");
			out.println(int_PRICE);
			
			int_QUANTITY=rs.getInt(7);
			out.println("<td>");
			out.println(int_QUANTITY);

			str_DESCRIPTION=rs.getString(8);
			out.println("<td>");
			out.println(str_DESCRIPTION);

			out.println("<td>");
			out.println(rs.getString(9));
			
			out.println("</tr>");
		}
	%>
		<tr>
			<td><input type="submit" value="   Modify    "></td>
			<td><input type="Reset" value="   Clear    "></td>
		</tr>
		</table>
		</form>
	<%
		}
		catch(Exception e)
		{
		out.print("Error = " + e + "<HR>");
	}
	%>
</BODY>
</HTML>
