<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle_service_reservation_App</title>
<link href="css/index.css" rel="stylesheet">
</head>
<body>
	<section class="login">
	    <div class="container">
			<div class="app-name"><h1>Vehicle Service Reservation Application</h></div>
			<div class="image">
				<img src="img/profile.jpg" class="login-img"/>
			</div>
			<div class="app-name"><h3>Reserve your vehicle service now!</h3></div>
			<form class="app-login-form" action="samlsso?SAML2.HTTPBinding=HTTP-POST" method="post">
				<input type="submit" id="btn-login" class="btn_login" value="LOGIN with Asgardeo"/>
			</form>
			<p style="text-align: center;">If not <a href="https://wso2.com/asgardeo/" >Create a new Asgardeo account</a></p>
			
	    </div>
	    <div class="text">
	        <span>Copyright &copy 2023 | Pathum Sanjana</span>
	    </div>
	</section>
</body>
</html>