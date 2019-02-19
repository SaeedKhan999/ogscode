<html>

<head>
<title>Search Results</title>
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
  
  </ul><br>
	
	
	<%@  page errorPage="errorpage.jsp" language="java"  import="java.sql.*"  %>
	<%
  	String user_src=(String)session.getValue("user");
  	if (user_src!=null)
  	{
	String str_searchvar=null;
	String str_colvar=null;
	String query="";
	String tab_var="";
	int total_sel=Integer.parseInt((String)session.getValue("TotalSel"));
	int[] old_productid=new int[total_sel];
	Connection conn;
	conn=null;
	ResultSet rs;
	rs=null;
	Class.forName("org.postgresql.Driver");
	conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres",""); 
	
	PreparedStatement stat=null,stat_ins=null,stat_del=null;
	

	for (int i=1;i<=total_sel;i++)
	{
		old_productid[i-1]=Integer.parseInt((String)session.getValue("chk_var"+i));
		
	}%>
		<h3>Your Cart Details are as follows:</h3>
		<form name="shop" action="Cart_quantity.jsp">
		<table border=1>
		<tr>
		<td>S.No</td>
		<td>Product Name</td>
		<td>Price (in Rs./kg)</td>
		</tr>	
		<%
		int price=0; int productprice=0;
		for (int j=0;j<total_sel;j++)
		{
			out.println("<tr><td>"+j+1);
			

			query="select title, price from product_details where productid=?";
			stat= conn.prepareStatement(query);
			stat.setInt(1,old_productid[j]);

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
			out.println("</tr>");
		}%>
		<tr>
		<td colspan=3>Total Cart Amount(in Rs.)=
		<%=productprice%>
		<td></tr>
		</table>
		<br>
		<input type=submit value="Place Order">
		</form>
	<%
	String test_src=null;
	int chk_ctr=0;
	
	
	if(request.getParameter("R1").equals("Title"))
	{
		str_searchvar=request.getParameter("PTitle");
		str_colvar="Title";
		
	}
	if(request.getParameter("R1").equals("Category"))	
	{
		chk_ctr=1;
		str_searchvar=request.getParameter("ProductCategory");
		str_colvar="Categoryname";
	}
	
	if(request.getParameter("R1").equals("Company"))	
	{
		str_searchvar=request.getParameter("PCompany");
		
		str_colvar="Company";
	}
	if(request.getParameter("R1").equals("Dealer"))
	{
		str_searchvar=request.getParameter("PDealer");
		str_colvar="Dealer";
	}
		
	String ss = request.getParameter("R2");
	
	if (request.getParameter("R2")==null)
	{
		tab_var="product_details";		
	}
	else
	{
	// to get the name of the table in which the search to be done-------
		if (request.getParameter("R2").equals("A"))
		{
			
			tab_var="temp_detail";
		}
		else
		{  
			tab_var="product_details";
			
		}
	}
	
		
	//-------- whether search is by category or other criteria-----------
	if (chk_ctr==0)
	{

		query="select a.* from "+tab_var+" a, category_details b where a."+str_colvar+" = ? and a.CATEGORYID = b.CATEGORYID";
	}
	else
	{
			
		query="SELECT a.*,b.categoryname FROM "+tab_var+" a,CATEGORY_DETAILS b where b."+str_colvar+"=? and a.categoryid=b.categoryid";
	}
		
	try
	{
		stat=conn.prepareStatement(query);
		stat.setString(1,str_searchvar);


		rs = stat.executeQuery();

		int ctr=0;%>
		<h3>Search Results are as follows:</h3>
		<form name="cart" action="NewInter_cart.jsp" method="POST">
		<table border=1>
		<tr>
		<td>S.No</td>
		<td>Select</td>
		<td>Product Name</td>
		<td>Company Name</td>
		<td>Dealer</td>
		
		<td>Price (in Rs./kg)</td>
		<td>Quantity Available(Nos.)</td>
		<td>Description</td>
		</tr>
		<%
		String delete_query="Delete from TEMP_DETAIL";
		stat_del= conn.prepareStatement(delete_query);
		String ins_query=null;
		int int_ProductID,int_CATEGORYID,int_PRICE,int_QUANTITY;
		String str_TITLE,str_Company,str_Dealer,str_DESCRIPTION;

		int rs_del=stat_del.executeUpdate();
		while(rs.next())
		{
			ctr=ctr+1;
			out.println("<tr><td>"+ctr);
			int_ProductID=rs.getInt(1);
			out.println("<td><input type=checkbox name=chk"+ctr+" value="+int_ProductID+">");
					
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

			
			out.println("</tr>");

			ins_query="INSERT INTO TEMP_DETAIL VALUES(?,?,?,?,?,?,?,?)";
			stat_ins=conn.prepareStatement(ins_query);
			stat_ins.setInt(1,int_ProductID);
			stat_ins.setInt(2,int_CATEGORYID);
                        stat_ins.setString(3,str_TITLE);
			stat_ins.setString(4,str_Company);
			stat_ins.setString(5,str_Dealer);
			
			stat_ins.setInt(6,int_PRICE);
                        stat_ins.setInt(7,int_QUANTITY);
			stat_ins.setString(8,str_DESCRIPTION);
			

		int rs_ins=stat_ins.executeUpdate();
		
		}
		String str_ctr=String.valueOf(ctr);
		session.putValue("ctr_val",str_ctr);
		
		%>
	
		
	</table>
	
	<input type="submit" value="    Add to Cart    " name="Add">
	</form>
	<%

	ResultSet rscombo=null;
		String query1="select * from category_details";
		PreparedStatement stat_combo = conn.prepareStatement(query1);

		rscombo=stat_combo.executeQuery();%>	
	
	<br><h3>Search Results are as follows:</h3>
	<form name="newsrc" action="NewSearch.jsp" method="POST">
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
	catch(Exception E)
	{
		out.println("Error  "+E);
	}
	finally{conn.close();}


}
else
	{
		response.sendRedirect("Unauthorised.htm");
	}
%>
</body>
</html>
