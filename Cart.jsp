<html>
<head>
<title>ogs</title>
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

<body>
<link rel="stylesheet" type="text/css" href="prac.css">



	<CENTER> 	
<font size=8>Online Grocery Shop Management System </font size=8> 
	</CENTER>
<br>
<ul>
  
<li><a class="active" href="Logout.jsp">Logout</a></li>
  </ul>

	<%@  page errorPage="errorpage.jsp" language="java"  import="java.sql.*"  %>
	<%
	int i;
	String user_src=null;
	user_src=(String)session.getValue("user");
	if (user_src!=null)
   	{
		int counter=0;		
		counter=Integer.parseInt((String)session.getValue("TotalSel"));
		int[] productid=new int[counter];
		Connection conn;
		conn=null;
		ResultSet rs;
		rs=null;
		Class.forName("org.postgresql.Driver");
		conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres",""); 

		PreparedStatement stat=null;
		int ctr=0,productprice=0;
		for(i=1;i<=counter;i++)
		{
			if((String)session.getValue("chk_var"+i)!=null)
			{
				productid[i-1]=Integer.parseInt((String)session.getValue("chk_var"+i));
			}
		}
		session.putValue("ProductArr",productid);	
		%>
		
		<h3>Your Cart Details are as follows:</h3>
		<form name="shop" action="Cart_Quantity.jsp">
		<table border=1>
		<tr>
		<td>S.No</td>
		<td>Product Name</td>
		<td>Price (in Rs./kg)</td>
		</tr>	
		<%
		int price=0;
		for (int j=1;j<=counter;j++)
		{
			out.println("<tr><td>"+j);
			
		
			String query="select title, price from product_details where productid=?";
			stat= conn.prepareStatement(query);
			stat.setInt(1,productid[j-1]);
		
			rs = stat.executeQuery();
			while (rs.next())
			{
				out.println("<td>");
				out.println(rs.getString(1));
				out.println("<td>");
				price=rs.getInt(2);
				out.println(price);
			}
			rs.close();
			productprice=productprice+price;
			session.putValue("pPrice",String.valueOf(productprice));
			out.println("</tr>");
			
		}
		ResultSet rscombo=null;
		String query1="select * from category_details";
		PreparedStatement stat_combo = conn.prepareStatement(query1);
		
		rscombo=stat_combo.executeQuery();%>
		<tr>
			<td colspan=3>Total Cart Amount(in Rs.)=
			<%=productprice%><td>
		</tr>
		</table>
		<br>
		<input type=submit value="Place Order">
		</form>
		<br><hr><h3>Search More</h3>
		
		<form name="search" action="NewSearch.jsp" method="POST">
		<table border=1>
		<tr>	
			<td><input type="radio" value="Category" checked name="R1"></td>
			<td>Search based on Category</td>
			<td>
	  		<select size="1" name="ProductCategory">
      			<option selected value="Select">Select Category</option>
				<%
				while(rscombo.next())
				{
					String category=rscombo.getString(2);
				%>
    				<option value="<%=category%>"><%=category%></option>
  				<%}%>
    			</select>
			</td>	
		</tr>
		<tr>
      			<td><input type="radio" name="R1" value="Title"></td>
     	 		<td>Search by Product Title</td>
      			<td><input type="text" name="PTitle" size="25"></td>
    		</tr>
    		<tr>
        		<td><input type="radio" name="R1" value="Company"></td>
      			<td>Search by Product Company</td>
      			<td><input type="text" name="PCompany" size="25"></td>
    		</tr>
    		<tr>
      			<td><input type="radio" name="R1" value="Dealer"></td>
     			<td>Search by Product Dealer</td>
      			<td><input type="text" name="PDealer" size="25"></td>
    		</tr>
    	    	<tr>
    			
    			<td><input type="radio" name="R2" value="N" checked></td>
				<td>New Search</td>
    			<td><input type=submit value="Search"></td>
    		</tr>    	
    		</table>
    		</form>
		<%}
	else
	{
		response.sendRedirect("Unauthorised.htm");
	}
	%>
</body>
</html>	
