<HTML>
<HEAD>

<TITLE>Cart</TITLE>
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
		counter=Integer.parseInt((String)session.getValue("ctr_val"));
		int ctr=0;
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
		response.sendRedirect("Unauthorised.htm");
	}
%>
</body></html>
