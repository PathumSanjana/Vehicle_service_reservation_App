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
				<form action="reservation.jsp">
                    <input type="submit" id="btn-login" class="btn_login" value="Make a reservation" style="padding: 10px,20px; font-size: 1.1rem;font-weight: 600;"/>
                </form>
				<form action="profile.jsp">
                    <input type="submit" id="btn-login" class="btn_login" value="View profile information" style="padding: 10px,20px; font-size: 1.1rem;font-weight: 600;"/>
                </form>
                <form method="get" action="view">
                    <input type="submit" id="btn-login" class="btn_login" value="View reservations" style="padding: 10px,20px; font-size: 1.1rem;font-weight: 600;"/>
                </form>
				
            </div>
	    </div>
	    <div class="text">
	        <span>Copyright &copy 2023 | Pathum Sanjana</span>
	    </div>
	</section>
</body>
</html>