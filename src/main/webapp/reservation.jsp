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
			<div class="app-name"><h1>Reserve a Vehicle Service</h></div>
			<div class="image">
				<img src="img/date.png" class="date-img"/>
			</div>
            <div class="content">
                <form method="post" action="reservation">
                    <table style="width: 50rem;">
                        <tr>
                            <th style="width: 20rem;"><h3>Username</h3></th>
                            <td><h3>:</h3></td>
                            <td><input type="text" id="" name="username"></td>
                        </tr>
                        <tr>
                            <th style="width: 20rem;"><h3>Name</h3></th>
                            <td><h3>:</h3></td>
                            <td><input type="text" id="" name="name"></td>
                        </tr>
                        <tr>
                            <th style="width: 20rem;"><h3>Email</h3></th>
                            <td><h3>:</h3></td>
                            <td><input type="email" id="" name="email"></td>
                        </tr>
                        <tr>
                            <th style="width: 20rem;"><h3>Contact Number</h3></th>
                            <td><h3>:</h3></td>
                            <td><input type="text" id="" name="contact_number"></td>
                        </tr>
                        <tr>
                            <th style="width: 20rem;"><h3>Country</h3></th>
                            <td><h3>:</h3></td>
                            <td><input type="text" id="" name="country"></td>
                        </tr>
                        <tr>
                            <th style="width: 20rem;"><h3>Date</h3></th>
                            <td><h3>:</h3></td>
                            <td><input type="date" id="" name="date"></td>
                        </tr>
                        <tr>
                            <th style="width: 20rem;"><h3>Preferred time</h3></th>
                            <td><h3>:</h3></td>
                            <td><select id="" name="time">
                                <option value="10 AM">10 AM</option>
                                <option value="11 AM">11 AM</option>
                                <option value="12 PM">12 PM</option>
                              </select></td>
                        </tr>
                        <tr>
                            <th style="width: 20rem;"><h3>Preferred Location</h3></th>
                            <td><h3>:</h3></td>
                            <td><select id="" name="location">
                                <option value="Colombo">Colombo</option>
                                <option value="Kalutara">Kalutara</option>
                                <option value="Gampaha">Gampaha</option>
                                <option value="Galle">Galle</option>
                                <option value="Kandy">Kandy</option>
                                <option value="Jaffna">Jaffna</option>
                              </select></td>
                        </tr>
                        <tr>
                            <th style="width: 20rem;"><h3>Vehicle Registration Number</h3></th>
                            <td><h3>:</h3></td>
                            <td><input type="text" id="" name="registration_number"></td>
                        </tr>
                        <tr>
                            <th style="width: 20rem;"><h3>Current Mileage</h3></th>
                            <td><h3>:</h3></td>
                            <td><input type="text" id="" name="current_mileage"></td>
                        </tr>
                        <tr>
                            <th style="width: 20rem;"><h3>Message</h3></th>
                            <td><h3>:</h3></td>
                            <td><textarea name="message" rows="3" cols="30">
                                message</textarea></td>
                        </tr>
                    </table>
                    <input type="submit" id="btn-login" class="btn_login" value="SUBMIT" style="font-weight: 600; margin-top: 30px;"/>
                </form>
                <a href="home.jsp"><h3 class="btn" style=" margin-left: 20%; margin-right: 20%;">Back to Home</h3></a>
            </div>
	    </div>
	    <div class="text">
	        <span>Copyright &copy 2023 | Pathum Sanjana</span>
	    </div>
	</section>
</body>
</html>