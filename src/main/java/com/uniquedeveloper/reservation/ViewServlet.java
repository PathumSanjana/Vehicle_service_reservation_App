package com.uniquedeveloper.reservation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import io.asgardeo.java.saml.sdk.util.SSOAgentConstants;
import io.asgardeo.java.saml.sdk.bean.LoggedInSessionBean;
import io.asgardeo.java.saml.sdk.bean.LoggedInSessionBean.SAML2SSO;

@WebServlet("/view")
public class ViewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Reservation> reservations = new ArrayList<>();
        Connection con = null;

        try {
            // Retrieve the session bean.
            LoggedInSessionBean sessionBean = (LoggedInSessionBean) request.getSession().getAttribute(SSOAgentConstants.SESSION_BEAN_NAME);
            // SAML response
            SAML2SSO samlResponse = sessionBean.getSAML2SSO();
            // Authenticated username
            String username = samlResponse.getSubjectId();

            // Load the MySQL driver and establish a connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/isec_assessment2?useSSL=false", "root", "");

            // Prepare the SQL query with a placeholder for the username
            String sql = "SELECT booking_id, date, time, location, vehicle_no, mileage, message FROM vehicle_service WHERE username = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, username); // Set the username in the query

            // Execute the query
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setBookingid(rs.getString("booking_id"));
                reservation.setDate(rs.getString("date"));
                reservation.setTime(rs.getString("time"));
                reservation.setLocation(rs.getString("location"));
                reservation.setVehicleNo(rs.getString("vehicle_no"));
                reservation.setMileage(rs.getString("mileage"));
                reservation.setMessage(rs.getString("message"));
                reservations.add(reservation);
            }

            request.setAttribute("reservations", reservations);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("view.jsp");
        dispatcher.forward(request, response);
    }
}
