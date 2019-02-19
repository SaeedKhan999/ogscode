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
<TITLE>Insert New Book</TITLE>
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
  <li><a class="active" href="Insert.jsp">Back</a></li>
 <li><a class="active" href="Admin.html">Admin Home</a></li>
  </ul><br>
	<BR>
	

	<%@ page errorPage="errorpage.jsp" import="java.net.*" %>
	<%@ page import="java.io.*" %>
	<%@ page import="java.sql.*" %>
	<%
	Connection con = null;
	
	PreparedStatement stat = null;
	
	Class.forName("org.postgresql.Driver");
	con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres",""); 

	ResultSet rs1 = null;

	int rs;
	String query=null;
	String query1=null;
	String TITLE;
	TITLE=request.getParameter("title");
	
query1="Select a.* from product_details a where a.title=?";
	PreparedStatement stat1= con.prepareStatement(query1);
	stat1.setString(1,TITLE);
	rs1=stat1.executeQuery();

	if(rs1.next())
	{
	%>
		<SCRIPT language="JavaScript">
		alert("This product already exists.");
		location.href="Insert.jsp";
		</SCRIPT>
	<%
	}
	else
	{
 	int int_ProductID,int_CATEGORYID,int_PRICE,int_QUANTITY;
String str_TITLE,str_Company,str_Dealer,str_DESCRIPTION;
	
 		int_ProductID=(int)(10000*Math.random()+1);
 		int_CATEGORYID=Integer.parseInt(request.getParameter("cat"));
 		str_TITLE=request.getParameter("title");
 		str_Company=request.getParameter("company");
 		str_Dealer=request.getParameter("dealer");
 		
 		int_PRICE=Integer.parseInt(request.getParameter("price"));
 		int_QUANTITY=Integer.parseInt(request.getParameter("qty"));
 		str_DESCRIPTION=request.getParameter("desc");
 

		query="insert into product_details values (?,?,?,?,?,?,?,?)";
 		stat = con.prepareStatement(query);
		stat.setInt(1,int_ProductID);
		stat.setInt(2,int_CATEGORYID);
		stat.setString(3,str_TITLE);
		stat.setString(4,str_Company);		
		stat.setString(5,str_Dealer);
		
		stat.setInt(6,int_PRICE);
		stat.setInt(7,int_QUANTITY);
		stat.setString(8,str_DESCRIPTION);
		
		rs=stat.executeUpdate();
 		if(rs==1)
 		{%>
  		<BR>
 		<H3>Successfully inserted the data.</H3>
 		<% }
 		else
  		{%>
  			<BR>
 			<H3>Could not add the book</H3>
 		<%}
 	}%>

 	

 </BODY>
 </HTML>
