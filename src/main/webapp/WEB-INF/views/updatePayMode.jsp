<%@ page language="java" contentType="text/html;"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your Insurance – Change Payment Mode</title>
<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.0.min.js"/>"></script>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600&display=swap');
        #updatepaymode{
            display: flex;
            justify-content: center;
            align-items: center;
        }
        form
        {   
            font-size: 20px;
            font-family: 'Montserrat', sans-serif;
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            align-items: center;
            margin-top: 5rem;
            background-color: rgb(191, 69, 240);
            padding: 2rem;
            height: 50vh;
            color: #fff;
            box-shadow: 2px 2px 10px rgb(191, 69, 240);
           

        }
        input[type="text"]{
            margin: 10px;
            padding: 3px 3px;
            width:300px;
            height:30px;
            outline:none;
            border-radius:5px;
            border-color:#fff;
            box-shadow:inset 0 1px 2px rgba(0,0,0,0.5);
        }
        .myButton {
	box-shadow: 3px 4px 0px 0px #1564ad;
	background:linear-gradient(to bottom, #79bbff 5%, #378de5 100%);
	background-color:#79bbff;
	border-radius:5px;
	border:1px solid #337bc4;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:17px;
	font-weight:bold;
	padding:12px 44px;
	text-decoration:none;
	text-shadow:0px 1px 0px #528ecc;
}
.myButton:hover {
	background:linear-gradient(to bottom, #378de5 5%, #79bbff 100%);
	background-color:#378de5;
}
.myButton:active {
	position:relative;
	top:1px;
}
    </style>
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
				    <section id="updatepaymode">
		<c:if  test='${status !=null}'>
         	<c:if test='${status !="success"}'>
         	   <div id="errors" class="">Failed to update payment mode</div>
         	</c:if>
         	
         	<c:if test='${status =="success"}'>
         	    <div id="success">Payment mode changed successfully</div>
         	</c:if>
		</c:if> 
        <form action="changepaymentmode" method="post">
            <div class="row">
                    <label for="policyNumber">Policy Number: </label>
                    <input type="text" id="policyNumber" name="polnumber" class="form-control" value="${polnum}" readonly>
            </div>
            <div class="row">
                    <label >Mode Of Payment: </label>
                    <input type="radio" name="paymentMode" id="paymentModeMonthly" value="Monthly">
                    <label for="paymentModeMonthly">Monthly</label>
                    <input type="radio" name="paymentMode" id="paymentModeQuarterly" value="Quarterly">
                    <label for="paymentModeQuarterly">Quarterly</label>
                    <input type="radio" name="paymentMode" id="aymentModeYearly" value="Yearly">
                    <label for="aymentModeYearly">Yearly</label>
            </div>
            <button class="myButton" id="update" type="submit">Update</button>
        </form>
    </section>
			</section>
		</section>
	</section>
<script type="text/javascript">




</script>
</body>

</html>