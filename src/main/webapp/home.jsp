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
	<div class="navbar">
		<div class="logoname"><h1>Vehicle service reservation App</h1></div>
		<a href="logout?SAML2.HTTPBinding=HTTP-POST" class="logout">Log Out</a>
	</div>
	<section class="login">
	    <div class="container">
			<div class="app-name"><h1>WELCOME</h1></div>
			<div class="image">
				<img src="img/profile.jpg" class="login-img"/>
			</div>
            <div class="content">
				<a href="reservation.jsp"><h3 class="btn" style=" margin-left: 20%; margin-right: 20%;">Make a reservation</h3></a>
				<a href="profile.jsp"><h3 class="btn" style=" margin-left: 20%; margin-right: 20%;">View profile information</h3></a>
				<a href="view.jsp"><h3 class="btn" style=" margin-left: 20%; margin-right: 20%;">View reservations</h3></a>	
            </div>
	    </div>
	    <div class="text">
	        <span>Copyright &copy 2023 | Pathum Sanjana</span>
	    </div>
	</section>
</body>
</html>