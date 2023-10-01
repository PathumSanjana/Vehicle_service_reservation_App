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
			<div class="app-name"><h1>HELLO !</h></div>
			<div class="image">
				<img src="img/profile.jpg" class="login-img"/>
			</div>
            <div class="content">
                <a href="reservation.jsp" ><h3 class="btn">Make a reservation</h3></a>
                <a href="profile.jsp" ><h3 class="btn">View profile information</h3></a>
                <form method="get" action="view">
                    <input type="submit" id="btn-login" class="btn_login" value="View reservations"/>
                </form>
            </div>
	    </div>
	    <div class="text">
	        <span>Copyright &copy 2023 | Pathum Sanjana</span>
	    </div>
	</section>
</body>
</html>