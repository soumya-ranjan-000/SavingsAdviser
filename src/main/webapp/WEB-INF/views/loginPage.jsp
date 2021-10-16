<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
   
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Insurance - Login</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/loginpage.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">
     <link rel="stylesheet" href="<c:url value="/resources/js/jquery-3.6.0.min.js"/>">
     <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.0.min.js"/>"></script>
    <style type="text/css">
      #errors{
            color: red;
        }
         .hide{
             display: none;
         }
    </style>
</head>

<body>
    <jsp:include page="banner.jsp" /> 
    <section id="login-form-container">
    <%
    String error=(String) request.getAttribute("error");
    
    if(error != null){
    	if(error.equals("error")){
    	 %>
    	<div id="errors">Invalid credentials</div>
    	 <%
    	}
    }
    %> 
        <form action="login" id="login-frm" method="post" name="loginForm" onsubmit="return validateForm()">
            <div class="mb-3">
                <label for="userName" class="form-label">Username</label>
                <input type="text" name="username" id="userName" class="form-control">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="text" name="password" id="password" class="form-control">
            </div>

            <input type="submit" class="btn btn-primary" value="login" id="login">
        </form>

    </section>
<script type="text/javascript">

$(document).ready(function(){
	console.log("document is ready");
}
//validate form or check empty string
function validateForm() {
        let errorDiv=document.getElementById("errors");
	  var x = document.forms["loginForm"]["userName"].value; 
      var y = document.forms["loginForm"]["password"].value;

	  if (x == "" || x == null || y == "" || y == null) {
	    errorDiv.classList.remove("hide");
	    return false;
	  }
     else if (!/^[a-zA-Z]*$/g.test(x)) {
        errorDiv.classList.remove("hide");
        return false;
      }
	}
</script>
</body>

</html>