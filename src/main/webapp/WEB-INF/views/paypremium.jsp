<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Insurance - Pay Premium</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.0.min.js"/>"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    
     <style>
        #paypremium{
            display: flex;
            justify-content: center;
            align-items: center;
            height: 70vh;
            color: aliceblue;
            
            
        }
        #paypremium button{
            background-color: #fff;
            margin-top: 30px;
            padding: 5px;
           width: 100px; 
           font-family: 'Roboto', sans-serif;
           font-size: 20px;
           outline: none;
           border: none;
           box-shadow: 2px 2px 2px rgba(255, 255, 255, 1);
           background-color: rgb(46, 0, 88);
           color: #fff;
        }
        #paypremium button:active{
            transform: translate(1px,1px);
            box-shadow: 2px 2px 10px rgba(255, 255, 255, 0.8);
        }
        #paypremium form{
            display: flex;
            align-items: center;
            flex-direction: column;
            justify-content: center;
            background-color: rgb(113, 3, 163);
            padding: 20px;
            box-shadow: 2px 2px 40px rgba(5, 5, 5, 0.322);
            border-radius: 5px;
        }
       #paypremium label{
        font-family: 'Open Sans', sans-serif;
           width: 200px;
       }#paypremium input{
           width: 250px;
           padding:5px;
       }
       #paypremium .frm-group{
           width: 400px;
           display: flex;
           justify-content: space-between;
           margin: 5px;
       }
       
        #errors{
            color: red;
            text-align: center;
        }
        #success{
            color: #81b214;
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
		<!-- <c:if var="hide" test='${command!="YES"}'>
			<a href="<c:url value = "/insureyou/home"/>">Home</a>
		</c:if> -->
		<a href="<c:url value = "/insureyou/home"/>">Home</a>
		</nav>
		<header>
			<div>
				<p>Pay Premium</p>
				<span> <label id="loggedInUser" style="text-transform: capitalize;">Welcome ${user.username}</label> 
						<a href="logout">Logout</a>
				</span>
			</div>
		</header>
		
      <section id="body">
		
		 <div id="errors" class="hide">Payment failed</div>
		
         <c:if  test='${status !=null}'>
         	<c:if test='${status !="success"}'>
         	   <div id="errors" class="">Payment failed</div>
         	</c:if>
         	
         	<c:if test='${status =="success"}'>
         	    <div id="success">You have bought a policy successfully</div>
         	</c:if>
		</c:if> 

	
		<section id="paypremium">
			
       <form action="paypremium" name="paypremiumform" onsubmit="return validateForm()" method="post">
           <div class="frm-group">
            <label for="policyNumber€">Policy Number: </label> <label id="policyNumber">${policy.policynumber}</label>
           </div>
           <div class="frm-group">
            <label for="premiumAmount">Premium Amount: </label> <label id="premiumAmount" >${policy.premium}</label>
           </div>
           
           <div class="frm-group">
               <label for="">Card Number:</label>
               <input type="text" id="cardNumber" name="cardNumber">
           </div>
           <div class="frm-group">
            <label for="">Date of Expiry:</label>
            <input type="text" id="expiryDate€" name="expiryDate">
           </div>
        <div class="frm-group">
            <label for="">CVV:</label>
            <input type="text" id="cvv" name="cvv">
        </div>
        <div class="frm-group">
            <label for="">Name on Card:</label>
            <input type="text" id="name" name="nameoncard">
        </div>
        <c:if test='${type.equals("fromhome")}'>
        	<input type="hidden"  name="type" value="fromhome">
        </c:if>
         
        <button type="submit" id="pay">Pay</button>
       </form>
    </section>
		</section>
	</section>

<script type="text/javascript">



if (window.performance && window.performance.navigation.type === window.performance.navigation.TYPE_BACK_FORWARD) {
    window.location.reload();
}


   
	function validateForm()
	{
    let errorDiv=document.getElementById("errors");
	var cardNumber = document.forms["paypremiumform"]["cardNumber"].value.trim();
    var exDate = document.forms["paypremiumform"]["expiryDate"].value.trim(); 
    var cvv =document.forms["paypremiumform"]["cvv"].value.trim();
    var nameOnCard =document.forms["paypremiumform"]["nameoncard"].value.trim(); 
    
    if(cardNumber == null || cardNumber == "" || exDate == null || exDate == "" || cvv == null || cvv == "" || nameOnCard == null || nameOnCard =="")
    	{
    	   errorDiv.classList.remove("hide");
		   return false;
    	}
    else
    {	
    	
    	let x=validateCardName(nameOnCard);
    	let y=validateDate(exDate);
    	let z=validateCvv(cvv);
    	let w=validateCardNumber(cardNumber);
    	console.log("cardname ",x);
    	console.log("date ",y);
    	console.log("cvv ",z);
    	console.log("number ",w);
    	
    	if(x && y && z && w)
    	{
    		return true;
    	}
    	else{
    		errorDiv.classList.remove("hide");
    		return false;
    	}

    }   
    
}
	

	function validateCardName(name)
	{
		  if(/^[a-zA-Z][a-zA-Z ]*[a-zA-Z]$/.test(name))
		 {
			  if(name.length <= 20){
				  return true;
			  }
			  else{
				  return false;
			  }
		  }
		  else
		  {
			  return false;
		  }
	
	  }
	  
    function validateDate(date)
    {
    	  
        	if(/^\d{2}([/])\d{4}$/.test(date))
        	{      		
        		let s=date.split("/");
        		s=parseInt(s[0]);
        		if(s>12 || s<1)
        		{
        			return false;
        		}
        		else
        		{
        			return true;
        		}	
        	}
        	else{
        		return false;
        	}  
	  }
    
   function validateCvv(num)
      {
	    if( !/^[0-9]+$/.test(num) ) 
		 {    
			  return false;
		 }
	    else{
	    	if(num.length==3){
	    		return true;
	    	}
	    	else{
	    		return false;
	    	}	
	    }
	  }

   function validateCardNumber(num)
   {
	 
	 let n=parseInt(num);
	 if( !/^[0-9]+$/.test(num) ) 
	 {    
		  return false;
	 }
     else
     {
    	 if(num.length == 16 || num .length == 15)
    	 {
    		 
    		 if(num.length==15)
    		 {
    			 
    			 if(num[0]=="3")
    			 {
    				 return true;
    			 }
    			 else{
    				 return false;
    			 }
    		 }
    		 else
    		 {
    			 if(num[0] == "4" || num[0] == "5")
    			 {
    				 return true;
    			 }
    			 else{
    				 return false;
    			 }
    			 
    		 }
    	 }
    	 else{
    		 return false;
    	 }
  
     }
  	 
}
	
   /*
*/
</script>
</body>

</html>