<html>
<head>
<title>Order Details</title>
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
	<hr>

<CENTER> 	
<font size=5><b>Credit Card Payment</b></font size=5> 
	</CENTER><br>
	
	<%@  page errorPage="errorpage.jsp" language="java"  import="java.sql.*"  %>
	<%
	if (session.getValue("user")!=null)
	{%>
	<script language="Javascript">
	function validate()
	{
 	var r = document.form1;
    	var creditcard=r.Card.value;
 	var year = r.Year.value;
 	var month = r.Month.value;
     	var day = r.Day.value;
   
     	if(creditcard.length!=16)
 	{
		   alert("Invalid Credit Card Number");
		   r.Card.focus();
		   return;
  	}		   
//-----------------------------------------------------------------------   	
	
	if(day=="Select Day")
	{ 
		alert("Please select the day");
		r.Day.focus();
		return;
	}  	
//-----------------------------------------------------------------------   		
	if(month=="Select Month")
	{ 
		alert("Please select the month");
		r.Month.focus();
		return;
	}
//----------------------------------------------------------------------- 	
  	if(year.length==0)
	{ 
		alert("Please enter the year");
		r.Year.focus();
	}
     	else if (year.length!=4)
	{
		alert("Please enter the year in YYYY format");
 		r.Year.focus();
	}
//-----------------------------------------------------------------------
     	if (( month == "3" || month == "5" || month == "8" || month == "10") && (day == "31"))
        {
        	alert("Please enter a valid date");
                r.Day.focus();
        }
     	if ((month == "1") && (day == "30" || day == "31"))
        {
                alert("Please enter a valid date");
                r.Day.focus();
        }
        
        //------- To check that card date  is not less than current date----------
        var vr_day;
	var vr_month;
	var vr_year;
	var d=new Date();
	vr_year=d.getFullYear();
	vr_month=d.getMonth();
	vr_day=d.getDate();

	if(parseInt(vr_year)>parseInt(document.form1.Year.value))
	{
		alert("Year cannot be less than Current Year");
		return false;
	}
	else if(parseInt(vr_year)==parseInt(document.form1.Year.value))
	{
		if(parseInt(vr_month)>parseInt(document.form1.Month.value))
		{
			alert("Month cannot be less than Current Month");
			return false;
		}
		else if(parseInt(vr_month)==parseInt(document.form1.Month.value))
		{
			if(parseInt(vr_day)>parseInt(document.form1.Day.value))
			{
				alert("Day cannot be less than current Day");
				return false;
			}
		}
	}
	
	//------------------------------------------------------------------------
	document.form1.submit();
	document.forms[0].action="Final.jsp";
	}
	</script>
	<%
		int counter=0;	
		counter=Integer.parseInt((String)session.getValue("TotalSel"));
		String query="";
		int[] productid=new int[counter];
		int[] p_price=new int[counter];
		int[] p_quantity=new int[counter];
		
                Connection conn;
		conn=null;
		ResultSet rs;
		rs=null;
		Class.forName("org.postgresql.Driver");
		conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres","");  
		
		PreparedStatement stat=null;
		int ctr=0,productprice=0;
		int i=1;
		while(i<=counter)
		{
			if((String)session.getValue("chk_var"+i)!=null)
			{
				productid[i-1]=Integer.parseInt((String)session.getValue("chk_var"+i));
		
				query="SELECT PRICE FROM PRODUCT_DETAILS WHERE PRODUCTID=?";
				stat=conn.prepareStatement(query);
				stat.setInt(1,productid[i-1]);
		
				rs=stat.executeQuery();
				if(rs.next())
				{
					p_price[i-1]=rs.getInt(1);
				}
				else
				{
					p_price[i-1]=0;
				}
			
			}
			
			if(request.getParameter("qty"+i)!=null)
			{
				p_quantity[i-1]=Integer.parseInt(request.getParameter("qty"+i));
				String sess_var=String.valueOf(p_quantity[i-1]);
				session.putValue(sess_var,String.valueOf(p_quantity[i-1]));
			}
			
			productprice=productprice+(p_price[i-1]*p_quantity[i-1]);
			i++;
		}
		session.putValue("pPrice",String.valueOf(productprice));
	%>
	
	<form method="POST" action="Final.jsp" name="form1">
  	<table width="70%">
    	<tr>
    		<td colspan=4 ><b>Total Amount (in Rs.) is : <%=productprice%></b></td></tr>
    	<tr>
    	</tr>
    	<tr>
    		<td><font size="3"><b>Credit Card Number: </b></font></td>
      		<td colspan=3>
      	<input type="text" name="Card" size="39" maxlength="16" tab="1"></td>
    	</tr>
    	<tr>
      		<td><font size="3"><b>Expiry Date :     </b></font></td>
      		<td>
      		     		
      		<select size="1" name="Day">
          	<option value="Select Day">Select Day</option>
          	<option value="1">1</option>
          	<option value="2">2</option>
          	<option value="3">3</option>
          	<option value="4">4</option>
          	<option value="5">5</option>
          	<option value="6">6</option>
          	<option value="7">7</option>
          	<option value="8">8</option>
          	<option value="9">9</option>
          	<option value="10">10</option>
          	<option value="11">11</option>
         	<option value="12">12</option>
         	<option value="13">13</option>
         	<option value="14">14</option>
         	<option value="15">15</option>
         	<option value="16">16</option>
         	<option value="17">17</option>
         	<option value="18">18</option>
        	<option value="19">19</option>
        	<option value="20">20</option>
        	<option value="21">21</option>
        	<option value="22">22</option>
        	<option value="23">23</option>
         	<option value="24">24</option>
        	<option value="25">25</option>
          	<option value="26">26</option>
          	<option value="27">27</option>
          	<option value="28">28</option>
          	<option value="29">29</option>
          	<option value="30">30</option>
          	<option value="31">31</option>
        	</select>
        	</td>
        	<td>
        	<select size="1" name="Month">
          	<option value="Select Month">Select Month</option>
          	<option value="0">January</option>
          	<option value="1">February</option>
          	<option value="2">March</option>
          	<option value="3">April</option>
          	<option value="4">May</option>
          	<option value="5">June</option>
          	<option value="6">July</option>
          	<option value="7">August</option>
          	<option value="8">September</option>
          	<option value="9">October</option>
          	<option value="10">November</option>
          	<option value="11">December</option>
        	</select>
        	</td>
        	<td>
        	<font size="3"><input type="text" name="Year" size="11"></font>
      		</td>
    	</tr>
  	</table>
  
  	</font><input type="button" value="Submit" name="B1" onClick="validate();" >
<br><hr><br>
<CENTER> 	
<font size=5><b>Click here for : <a href="Final.jsp"><i> Cash On Delivery</i></a></b></font size=5> 
	</CENTER> 
	<br><hr>
  	</form>
	<%
	}
	else
	{
		response.sendRedirect("Unauthorised.htm");
	}%>
</body>
</html>
