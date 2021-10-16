<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your Insurance - Home</title>
<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.0.min.js"/>"></script>
</head>

<body>
	<jsp:include page="banner.jsp"></jsp:include>
	<section id="home">
		<nav class="sidenav">
			<a href="<c:url value = "/insureyou/home"/>">Home</a>
		</nav>
		<header>
			<div>
				<p>Your Policies</p>
				<span> <label id="loggedInUser"
					style="text-transform: capitalize;">Welcome
						${user.username}</label> 
					<a href="logout">Logout</a>
				</span>
			</div>
	 <div id="msg">
  </div>

		</header>
		<section id="body">
			<section id="content">
				<jsp:include page="policy.jsp"></jsp:include>
			</section>
		</section>
	</section>
<script type="text/javascript">




</script>
</body>

</html>