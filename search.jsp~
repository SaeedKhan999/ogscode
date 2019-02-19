<%@  page errorPage="errorpage.jsp" language="java"  import="java.sql.*"  %>
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
<li><a class="active" href="SearchCriteria.jsp">Back</a></li>
  </ul>
<br>
<center>
<font size="5" >Search Results</font>
</center>
<br>
<%
	
	String str_searchvar=null;
	int chk_ctr=0;
	String str_colvar=null;
	String tab_var="";
	String user_src=(String)session.getValue("user");
	System.out.println("0");	
	if (user_src!=null)
   	{
		String query=null;
		Connection conn;
		conn=null;
		ResultSet rs;
		rs=null;
		if(request.getParameter("R1").equals("Title"))
		{
			str_searchvar=request.getParameter("PTitle");
			str_colvar="TITLE";
			
		}
		if(request.getParameter("R1").equals("Category"))	
		{
			chk_ctr=1;
			str_searchvar=request.getParameter("ProductCategory");
			
			str_colvar="Categoryname";
		}
		if(request.getParameter("R1").equals("Dealer"))	
		{
			str_searchvar=request.getParameter("PDealer");
			str_colvar="Dealer";
		}
		if(request.getParameter("R1").equals("Company"))
		{
			str_searchvar=request.getParameter("PCompany");
			str_colvar="Company";
		}	
		if (request.getParameter("R2")==null)
		{
			tab_var="PRODUCT_DETAILS";		
		}
		else
		{
		// to get the name of the table in which the search to be done-------
			if (request.getParameter("R2").equals("A"))
			{
				tab_var="TEMP_DETAIL";
			}
			else
			{
				tab_var="PRODUCT_DETAILS";
			}
		}


	
      if (chk_ctr==0)
	{

		query="select a.* from "+tab_var+" a, category_details b where a."+str_colvar+" = ? and a.CATEGORYID = b.CATEGORYID";
	//out.println(query);
	}
	else
	{
			
		query="SELECT a.*,b.categoryname FROM "+tab_var+" a,CATEGORY_DETAILS b where b."+str_colvar+"=? and a.categoryid=b.categoryid";
	//out.println(query);
	}

	System.out.println("1");
	
	try
	{
	Class.forName("org.postgresql.Driver");
	conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres","");  
	int ctr=0;
	System.out.println("2");
	

	PreparedStatement stm = conn.prepareStatement(query);
	
	stm.setString(1,str_searchvar);
	
	rs = stm.executeQuery();
%>

			<form name="cart" action="Inter_Cart.jsp" method="POST">
			<table border=1>
			<tr>
			<td>S.No</td>
			<td>Select</td>
			<td>Product Name</td>
			<td>Company Name</td>
			<td>Dealer</td>
			
			<td>Price (in Rs./kg)</td>
			<td>Quantity Available(in kg)</td>
			<td>Description</td>
			</tr>

<%
	while(rs.next())
	{
	//out.println("inside while");
	ctr=ctr+1;
	out.println("<tr><td>"+ctr+"</td>");
	int int_ProductID=0;
	int_ProductID=rs.getInt(1);
	System.out.println(int_ProductID);	
	out.println("<td><input type=checkbox name=chk"+ctr+" value="+int_ProductID+">");
				
	int int_CATEGORYID=rs.getInt(2);
					
	String str_TITLE=rs.getString(3);
	out.println("<td>");
	out.println(str_TITLE);
	out.println("</td>");

	String str_Company=rs.getString(4);
	out.println("<td>");
	out.println(str_Company);
	out.println("</td>");
		
	
	String str_Dealer=rs.getString(5);
	out.println("<td>");
	out.println(str_Dealer);
	out.println("</td>");
	
		
			
	int int_PRICE=rs.getInt(6);
	out.println("<td>");
	out.println(int_PRICE);
	out.println("</td>");
		
	int int_QUANTITY=rs.getInt(7);
	out.println("<td>");
	out.println(int_QUANTITY);
	out.println("</td>");

	String str_DESCRIPTION=rs.getString(8);
	out.println("<td>");
	out.println(str_DESCRIPTION);
	out.println("</td></tr>");

	String ins_query ="INSERT INTO temp_detail VALUES (?,?,?,?,?,?,?,?)";
	
	PreparedStatement stat_ins= conn.prepareStatement(ins_query);
	stat_ins.setInt(1,int_ProductID);
	stat_ins.setInt(2,int_CATEGORYID);
	stat_ins.setString(3,str_TITLE);
	stat_ins.setString(4,str_Company);
	stat_ins.setString(5,str_Dealer);
	
	stat_ins.setInt(6,int_PRICE);
	stat_ins.setInt(7,int_QUANTITY);
	stat_ins.setString(8,str_DESCRIPTION); 

	int x = stat_ins.executeUpdate();	
	System.out.println(x);

	}	
		
			String str_ctr=String.valueOf(ctr);
			session.putValue("ctr_val",str_ctr);

%>
	</table>
	<br>
	<input type="submit" value="    Add to Cart    " name="Add">	
	</form>

<%

	rs.close();
	stm.close();
	}
	catch(Exception e){}
	}
	else
		{
			response.sendRedirect("Unauthorised.htm");
		}
%>
</body>
</html>	
