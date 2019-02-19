<%@ page isErrorPage="true" import = "java.io.PrintWriter" %>
<html>
<head>
<title>
OGS Error Page
</title>
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
  <li><a class="active" href="home.html">Home</a></li>
<li><a class="active" href="Login.html">Login Again</a></li>
  
  </ul><br>
	<h1>Error Page</h1>
	<br><hr>
	<h4>An error has ocurred in the application</h4>
	<br><p>
	The stack trace of the error is:
	<p>
  	<%= exception.toString() %>
	<%-- exception.printStackTrace(new PrintWriter(out)); --%>
</body>
</html>	 
