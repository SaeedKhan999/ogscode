<!DOCTYPE html>
<html>
<head>
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
<TITLE>Order Details</TITLE>
</head>
<BODY>
<link rel="stylesheet" type="text/css" href="prac.css">


	<CENTER> 	
<font size=8>Online Grocery Shop Management System </font size=8> 
	</CENTER> 
<br>
<ul>
  <li><a class="active" href="Admin.html">Home</a></li>
  <li><a href="Logout.jsp">Logout</a></li>
<li><a href="Admin.html">Back</a></li>
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
  </ul>


<center>
<H1>Order Details</H1>
	</CENTER>
	
	<%@ page errorPage="errorpage.jsp" import="java.net.*"%>
	<%@ page import="java.io.*" %>
	<%@ page import="java.sql.*" %>
	<%@ page import="java.util.*" %>
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
		
		java.util.Date d=new java.util.Date();
		//out.println(d.getMonth());

		int date=d.getDate();
		int m=d.getMonth()+1;	
		//out.println(date+"-"+m);

		String cdate=m+"/"+date+"/18";
		//out.println(cdate);

		query="Select * from Order_Table where OrderDate='"+cdate+"'";
		stat = con.prepareStatement(query);
		
		rs=stat.executeQuery();
	%>
		<br><h3>List of Order:</h3>
		<form name="Mod" action="Modify_Product.jsp">
		<table border=1>
		<tr>
		<td>Order ID</td>
		<td>User ID</td>
		<td>User Name</td>
		<td>Total Amount</td>
		<td>Order Date</td>
		</tr>
		<% 
		int int_OrderID,int_TotalAmount;
		String str_UserID,str_OrderDate;
		while(rs.next())
		{
			ctr=ctr+1;
			out.println("<tr><td>"+ctr);
			
						
			int_OrderID=rs.getInt(1);
			out.println("<td>");
			out.println(int_OrderID);
			
			str_UserID=rs.getString(2);
			out.println("<td>");
			out.println(str_UserID);
				
			int_TotalAmount=rs.getInt(3);
			out.println("<td>");
			out.println(int_TotalAmount);
					
			out.println("<td>");
			out.println(rs.getString(4));
			
			out.println("</tr>");
		}
	%>
		
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
