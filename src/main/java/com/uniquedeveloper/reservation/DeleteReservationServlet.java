package com.uniquedeveloper.reservation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteReservationServlet")
public class DeleteReservationServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://172.187.178.153:3306/isec_assessment2";
    private static final String JDBC_USERNAME = "isec";
    private static final String JDBC_PASSWORD = "EUHHaYAmtzbv";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Validate CSRF token
        if (!isValidCSRFToken(request)) {
            response.getWriter().println("Invalid CSRF Token. Request denied.");
            return;
        }
        
        // Remove the CSRF token from the session after use
        //request.getSession().removeAttribute("csrfToken");

        // Get the bookingid from the request parameter
        String bookingid = request.getParameter("reservationId");

        if (bookingid != null) {
            // Validate bookingid
            if (isValidBookingId(bookingid)) {
                // Delete the reservation
                boolean deleted = deleteReservation(bookingid);

                if (deleted) {
                    // Reservation deleted successfully, you can redirect to a success page or update the reservation list
                    response.sendRedirect(request.getContextPath() + "/view");
                } else {
                    // Handle the case where deletion fails (e.g., display an error message)
                    response.getWriter().println("Failed to delete reservation.");
                }
            } else {
                // Handle the case where bookingid is not a valid integer
                response.getWriter().println("Invalid bookingid. Please provide a valid bookingid.");
            }
        } else {
            // Handle the case where bookingid is missing in the request
            response.getWriter().println("Invalid request.");
        }
    }

    // Method to validate bookingid as an integer
    private boolean isValidBookingId(String bookingid) {
        try {
            // Attempt to parse bookingid as an integer
            Integer.parseInt(bookingid);
            return true;
        } catch (NumberFormatException e) {
            // bookingid is not a valid integer
            return false;
        }
    }

    // Method to delete a reservation from the database
    private boolean deleteReservation(String bookingid) {
        try {
            // Load the JDBC driver and establish a connection to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

            // Define a SQL query to delete the reservation
            String sql = "DELETE FROM vehicle_service WHERE booking_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, bookingid);

            // Execute the query
            int rowsAffected = preparedStatement.executeUpdate();

            // Close the resources
            preparedStatement.close();
            connection.close();

            // Check if the deletion was successful
            return rowsAffected > 0;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return false; // Deletion failed
        }
    }

    // Method to validate CSRF token
    private boolean isValidCSRFToken(HttpServletRequest request) {
        String csrfToken = request.getParameter("csrfToken");
        String sessionToken = (String) request.getSession().getAttribute("csrfToken");

        return csrfToken != null && csrfToken.equals(sessionToken);
    }
}
