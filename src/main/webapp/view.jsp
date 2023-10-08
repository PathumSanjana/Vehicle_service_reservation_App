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
    <div class="navbar">
		<div class="logoname"><h1>Vehicle service reservation App</h1></div>
		<a href="logout?SAML2.HTTPBinding=HTTP-POST" class="logout">Log Out</a>
	</div>
    <section class="login">
        <div class="container1">
            <div class="app-name"><h1>View reservations</h1></div>
            <div class="content">
                <form action="DeleteReservationServlet" method="post"> <!-- Specify the action URL and method for the deletion -->
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
                            <td>
                                <!-- Add a delete button and a hidden input field to store the reservation ID -->
                                <input type="hidden" name="bookingID" value="<%= reservation.getBookingid() %>">
                                <button type="submit" class="delete" onclick="return confirmDelete();">Delete</button>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </table>
                </form>
                
            </div>
        </div>
        <a href="home.jsp"><h3 class="btn" style="width: 20rem; text-align: center;">Back to Home</h3></a>
        <div class="text">
            <span>Copyright &copy; 2023 | Pathum Sanjana</span>
        </div>
    </section>
    
    
    <script>
    function confirmDelete() {
        return confirm("Are you sure you want to delete this reservation?");
    }
</script>
</body>
</html>
