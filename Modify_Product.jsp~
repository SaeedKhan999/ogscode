<HTML>
<HEAD>
<TITLE>Modify Product</TITLE>
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
  <li><a class="active" href="Modify.jsp">Back</a></li>
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

		ResultSet rs = null;
		String query=null;
		int product_sel = Integer.parseInt(request.getParameter("R1"));

		try
		{
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres","");  



		query="Select a.*,b.categoryname from product_details a, category_details b where a.productid=? and a.categoryid=b.categoryid";
	
		stat = con.prepareStatement(query);
		stat.setInt(1,product_sel);

		rs=stat.executeQuery();
		if(rs.next())
		{
	%>
		<br><h3>Details of Selected Product:</h3>
		<form name="Mod" action="Final_Mod_Product.jsp">
		<input type="hidden" name="categoryid" value="<%=rs.getString(2)%>">
		<table border=1>
		<tr>
		<td>Product Id</td><td><input type="hidden" name="productid" value="<%=product_sel%>"><%=product_sel%> </td></tr>
		<tr>
		<td>Product Name</td><td><input type="text" name="title" value=<%=rs.getString(3)%>></td>
		</tr>
		<tr>
		<td>Company Name</td><td><input type="text" name="company" value=<%=rs.getString(4)%>></td>
		</tr>
		<tr>
		<td>Dealer</td><td><input type="text" name="dealer" value=<%=rs.getString(5)%>></td>
		</tr>
		<tr>
		<td>Price (in Rs./kg)</td><td><input type="text" name="bprice" value=<%=rs.getString(6)%>></td>
		</tr>
		<tr>
		<td>Quantity Available(in kg)</td><td><input type="text" name="bqty" value=<%=rs.getString(7)%>></td>
		</tr>
		<tr>
		<td>Description</td><td><input type="text" name="bdesc" value=<%=rs.getString(8)%>></td>
		</tr>
		<tr>
		<td>Category</td><td><input type="text" name="bcat" value=<%=rs.getString(9)%>></td>
		</tr>
		<tr>
		<tr><td><input type="submit" value=" Save Changes "></td>
<td><input type="Reset" value="    Clear    "></td>
		</tr>
		</table>
		</form>
		<%
		}
	}
		catch(Exception e)
		{
			out.print("Error = " + e + "<HR>");
		}
	%>
</BODY>
</HTML>
