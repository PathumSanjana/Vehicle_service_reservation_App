<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.uniquedeveloper.reservation.Reservation" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vehicle Service Reservation App</title>
    <link href="css/index.css" rel="stylesheet">
</head>
<body>
    <div class="navbar">
        <div class="logoname"><h1>Vehicle Service Reservation App</h1></div>
        <a href="logout?SAML2.HTTPBinding=HTTP-POST" class="logout">Log Out</a>
    </div>
    <section class="login">
        <div class="container1">
            <div class="app-name"><h1>View Reservations</h1></div>
            <div class="content">
                <table class="table">
                    <tr>
                        <th><h3>Date</h3></th>
                        <th><h3>Time</h3></th>
                        <th><h3>Location</h3></th>
                        <th><h3>Registration Number</h3></th>
                        <th><h3>Mileage</h3></th>
                        <th><h3>Message</h3></th>
                        <th><h3>Action</h3></th>
                    </tr>
                    <%  //Generate and set CSRF token in the session
                            	  String csrfToken = java.util.UUID.randomUUID().toString();
                            	  session.setAttribute("csrfToken", csrfToken);
                            	//String csrfToken = (String) request.getSession().getAttribute("csrfToken");
                    
                    
                        List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
                        Date today = new Date(); // Get the current date and time
                        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // Define a date and time format
                        if (reservations != null) {
                            for (Reservation reservation : reservations) {
                            	
                            	
                                Date reservationDateTime = dateTimeFormat.parse(reservation.getDate() + " " + reservation.getTime());
                                //String csrfToken = java.util.UUID.randomUUID().toString();
                                //session.setAttribute("csrfToken", csrfToken);
                                //csrfToken = (String) request.getSession().getAttribute("csrfToken");
                                if (csrfToken == null) {
                                    csrfToken = ""; // Handle the case where the CSRF token is not set
                                }
                    %>
                    <tr>
                        <td><%= reservation.getDate() %></td>
                        <td><%= reservation.getTime() %></td>
                        <td><%= reservation.getLocation() %></td>
                        <td><%= reservation.getVehicleNo() %></td>
                        <td><%= reservation.getMileage() %></td>
                        <td><%= reservation.getMessage() %></td>
                        <td>
                            <form method="post" action="DeleteReservationServlet">
                                <input type="hidden" name="csrfToken" value="<%= csrfToken %>">
                                <input type="hidden" name="reservationId" value="<%= reservation.getBookingid() %>">
                                <% if (reservationDateTime.compareTo(today) > 0) {  %>
                                    <button type="submit" class="delete" onclick="return confirm('Are you sure you want to delete this reservation?');">Delete</button>
                                <% } else { %>
                                    <p>Expired</p>
                                <% }  %>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </table>
            </div>
        </div>
        <a href="home.jsp"><h3 class="btn" style="width: 20rem; text-align: center;">Back to Home</h3></a>
        <div class="text">
            <span>Copyright &copy; 2023 | Pathum Sanjana</span>
        </div>
    </section>
</body>
</html>
