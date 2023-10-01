<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.uniquedeveloper.reservation.Reservation" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle_service_reservation_App</title>
<link href="css/index.css" rel="stylesheet">
</head>
<body>
    <section class="login">
        <div class="container1">
            <div class="app-name"><h1>View reservations</h1></div>
            <div class="content">
                <table class="table">
                    <tr>
                        <th><h3>Date</h3></th>
                        <th><h3>Time</h3></th>
                        <th><h3>Location</h3></th>
                        <th><h3>Registration Number</h3></th>
                        <th><h3>Mileage</h3></th>
                        <th><h3>Message</h3></th>
                        <th><h3>Cancel</h3></th>   
                    </tr>
                    <% 
                        List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
                        if (reservations != null) {
                            for (Reservation reservation : reservations) {
                    %>
                    <tr>
                        <td><%= reservation.getDate() %></td>
                        <td><%= reservation.getTime() %></td>
                        <td><%= reservation.getLocation() %></td>
                        <td><%= reservation.getVehicleNo() %></td>
                        <td><%= reservation.getMileage() %></td>
                        <td><%= reservation.getMessage() %></td>
                        <td><button class="delete">Delete</button></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </table>
                <a href="home.jsp"><h3 class="btn"style=" margin-left: 30rem; margin-right: 30rem;">Back to Home</h3></a>
            </div>
        </div>
        <div class="text">
            <span>Copyright &copy; 2023 | Pathum Sanjana</span>
        </div>
    </section>
</body>
</html>
