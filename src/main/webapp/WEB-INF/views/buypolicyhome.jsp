<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
  
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Insurance - Buy Policy</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.0.min.js"/>"></script>
     <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
     <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>
    <style>
#buypolicy-frm {
	font-size: 14px; 
	padding: 1rem 2rem;
	align-items: center;
	width: 50vw;
}

#buypolicy-frm input, #buypolicy-frm label, #buypolicy-frm button {
	margin: 2px;
}

#buypolicy-frm button {
	margin-top: 10px;
	padding: 10px;
	background-color: blueviolet;
	color: aliceblue;
	outline: none;
	border: none;
	border-radius: 10px;
}
   #errors{
   text-align:center;
            color: red;
            margin-bottom:30px;
            font-size:20px;
        }
         .hide{
             display: none;
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
				<p>Buy Policy</p>
				<span> <label id="loggedInUser"
					style="text-transform: capitalize;">Welcome
						${user.username}</label> 
					<a href="logout">Logout</a>
				</span>
			</div>


		</header>
		<section id="body">
			<section id="content" style="
 display:flex;
 justify-content: center;
 align-items: center;
">
				<form id="buypolicy-frm" action="buypolicy" method="post" name="buyPolicyForm" onsubmit="return validateForm()"  autocomplete="off">
				<div id="errors" class="hide">Failed to buy policy</div>
		<div class="row">
			<div class="form-group  col-md-6">
				<label for="name">Name:</label> 
				<input type="text" id="name" name="name"
					class="form-control" maxlength="30">
			</div>
			<div class="form-group col-md-6">
				<label for="nominee">Nominee:</label> 
				<input type="text" name="nomineename"
					id="nominee" class="form-control"  maxlength="30">
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-6">
				<label for="dateofbirth">Date of Birth:</label> <input type="text"
					id="dateOfBirth" class="form-control" name="dob" placeholder="mm/dd/yyyy">
			</div>
			<div class="form-group col-md-6">
				<label for="nomineeRelationship">Relationship:</label> <select
					name="relationship" id="nomineeRelationship" class="form-control">
					<optgroup>
						<option value="" selected>--select--</option>
						<option value="spouse">Spouse</option>
						<option value="father">Father</option>
						<option value="mother">Mother</option>
						<option value="friend">Friend</option>
					</optgroup>
				</select>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<label for="gender">Gender:</label> 
				<input type="radio"
					name="gender" id="genderMale" value="Male" required> 
					<label
					for="genderMale">Male</label>
					 <input type="radio" name="gender"
					id="genderFemale" value="Female" required> <label for="genderFemale">Female</label>
			</div>
			<div class="form-group col-md-6">
				<label for="address">Address:</label>
				<textarea name="address" id="address" cols="30" rows="2"
					class="form-control"  pattern="^[a-zA-Z0-9\s,'-]*$"></textarea>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<label for="policyName">Policy Name:</label> <select
					name="policyname" id="policyName" class="form-control" required>
					<optgroup>
						<option value="" selected>--select--</option>
						<option value="pol1">POL1</option>
						<option value="pol2">POL2</option>
						<option value="pol3">POL3</option>
					</optgroup>
				</select>
			</div>
			<div class="col">
				<label for="tenure">Tenure:</label> <select name="tenure"
					id="tenure" class="form-control" required>
					<optgroup>
						<option value="" selected>--select--</option>
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="20">20</option>
						<option value="25">25</option>
					</optgroup>
				</select>
			</div>

		</div>

		<div class="row">
			<div class="form-group col-md-6">
				<label for="paymentMode">Mode Of Payment:</label> <select
					name="paymentmode" id="paymentMode" class="form-control" required>
					<optgroup>
						<option value="" selected>--select--</option>
						<option value="monthly">Monthly</option>
						<option value="quarterly">Quarterly</option>
						<option value="yearly">Yearly</option>
					</optgroup>
				</select>
			</div>
			
			<div class="form-group col-md-6" style="margin-top:20px;display:flex;align-items:center;">
				<label id="premium"></label>
			</div>
		</div>
		  <input id="hidden_input" type="hidden" name="premium" value="">
		  <input id="total" type="hidden" name="total" value="">
		  <input type="hidden" name="command" value="frombuypolicy">
		<div class="row">
			<button id="buy" >Buy</button>
		</div>

	</form>
				
			</section>
		</section>
	</section>
 <script type="text/javascript" src="<c:url value="/resources/js/bypolicy.js"/>"></script>
</body>
</html>