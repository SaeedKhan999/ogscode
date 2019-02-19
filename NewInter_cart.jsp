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
<TITLE>New cart</TITLE>
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
    </ul><br>
	<HR>
	<BR>
<%@  page errorPage="errorpage.jsp" language="java" %>

<%
	int i;
	String productid=null;
	String user_src=null;
	user_src=(String)session.getValue("user");
	if (user_src!=null)
   	{
		int counter=0;
		int total_sel=Integer.parseInt((String)session.getValue("TotalSel"));
		counter=Integer.parseInt((String)session.getValue("ctr_val"));
		int ctr=total_sel;
		for(i=1;i<=counter;i++)
		{
			if(request.getParameter("chk"+i)!=null)
			{
				productid=request.getParameter("chk"+i);
				ctr=ctr+1;
				session.putValue("chk_var"+ctr,productid);
			}
		}
		session.putValue("TotalSel",String.valueOf(ctr));	
		response.sendRedirect("Cart.jsp");
	}
	else
	{
		out.println("Unauthorised Shopping is not allowed");
	}
%></body>
</html>
