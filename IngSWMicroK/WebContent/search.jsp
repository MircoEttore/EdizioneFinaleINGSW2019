<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="persistance.DatabaseManager"%>
<%@page import="model.Canzone"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page session="true"%>


<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>--MicroK--MusicStore--</title>
  
<link  href="css/searchbar.css" rel="stylesheet" type="text/css">
<link href="bootstrap-4.1.3/css/bootstrap.min.css" rel="stylesheet"> 

</head>
<body class="searchbar">
<nav class="navbar navbar-light bg-light fixed-top">
  <a class="scritta navbar-brand">Navbar</a>
	<div class="container">
		<form action="search" method="POST" class="form-inline m-auto">
			<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search"  > 
			<button class="btn btn-outline-success my-20 my-sm-10" type="submit">Search</button>
		</form>
		<form>
			<div class="pull-left">
				<ul class="nav navbar-nav">
					<li><button type="submit" class="btn navbar-btn btn-danger" name="logout" id="logout"  value="Log Out">Log Out</button></li>
				</ul>
			</div>
		</form>
	</div>
</nav>



			



</body>
</html>