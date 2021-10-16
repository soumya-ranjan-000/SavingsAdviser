<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
#policy {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

#policy table {
	margin: 10px;
	border: 1px slategray solid;
	font-size: 18px;
}

#policy thead {
	background-color: rgba(85, 85, 85, 0.657);
	color: #fff;
}

#policy  thead td {
	border: none;
}

#policy td {
	min-width: 150px;
	height: 30px;
	padding: 5px;
	text-align: center;
	border: 1px slategray solid;
	margin: 0;
}

#policy table button {
	border: none;
	outline: none;
	outline-style: none;
	outline-offset: none;
	margin: 0 0.2rem;
	padding: 0.2rem;
	border: 0.1rem solid rgba(102, 51, 153, 0);
	border-radius: 0.1rem;
	background: rgb(138, 2, 192);
	color: white;
	box-shadow: 1.5px 1.5px 1px rgb(185, 204, 255);
}

#policy table button:active {
	transform: translate(1px, 1px);
	box-shadow: 2px 2px 5px rgb(185, 204, 255);
	cursor: pointer;
}

#policy .buy-btn {
	font-size: 20px;
	margin: 10px;
	width: 200px;
	padding: 10px;
	border: none;
	outline: none;
	outline-style: none;
	outline-offset: none;
	box-shadow: 1.7px 1.7px 2px rgb(185, 204, 255);
	cursor: pointer;
}

#policy .buy-btn:active {
	transform: translate(1px, 1px);
	box-shadow: 2px 2px 5px rgb(185, 204, 255);
	cursor: pointer;
}
a{
text-decoration: none;
}
</style>
</head>

<body>
	<section id="policy">
		

		<c:set var="list" value="${user.policyList}" />
		<c:if test="${list.size()==0}">
			<div id="noRecord">No records available</div>
		</c:if>
		<c:if test="${list.size()!=0}">
			<table cellspacing="0" cellpadding="0">
			<thead id="myPolicies"><tr><td>My Policies</td></tr></thead>
			<thead  style="width: 100%;">
				<tr>
					<td>PolicyNumber</td>
					<td>Mode of Payment</td>
					<td>Premium</td>
					<td>Next Payment</td>
					<td></td>
				</tr>
			</thead>
			<tbody>
			<c:set var = "num" scope = "page" value="${0}" />
				<c:forEach var="list" items="${user.policyList}">
				<c:set var = "num" scope = "page" value="${num+1}" />
					<tr>
					
					
						<td id="policyNumber${num}">${list.policynumber }</td>
						<td id="modeOfPay${num}">${list.paymentmode }</td>
						<td id="premiumAmt${num}">${list.premium }</td>
						<td>${list.nextdob }</td>
						
						
						<c:url value="/insureyou/paypremium" var="pay">
						  <c:param name="command" value="PAY"></c:param>
						  <c:param name="policynumber" value="${list.policynumber}"></c:param>
					    </c:url> 
					    <c:url value="/insureyou/changepaymentmode" var="change">
						  <c:param name="command" value="CHANGE"></c:param>
						  <c:param name="policynumber" value="${list.policynumber}"></c:param>
					    </c:url> 
						
						<td>
						<a href="${pay}"><button id="payNow${num}" class="btn-1">Pay</button></a>
						<a href="${change}"><button id="change${num}" class="btn-2">Change</button></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</c:if>
		<c:url var="buyp" value = "buypolicy"/>
		<a href="${buyp}">
		<button id="buyPolicy" class="buy-btn">Buy Policy</button>
		</a>
		

		
	</section>
<script type="text/javascript">

$(document).ready(function(){
	console.log("document is ready");
}
</script>
</body>

</html>