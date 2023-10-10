<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="io.asgardeo.java.saml.sdk.util.SSOAgentConstants" %>
<%@ page import="io.asgardeo.java.saml.sdk.bean.LoggedInSessionBean" %>
<%@ page import="io.asgardeo.java.saml.sdk.bean.LoggedInSessionBean.SAML2SSO" %>
<%@ page import="java.util.Map" %>

<%
// Retrieve the session bean.
LoggedInSessionBean sessionBean = (LoggedInSessionBean) session.getAttribute(SSOAgentConstants.SESSION_BEAN_NAME);
// SAML response
SAML2SSO samlResponse = sessionBean.getSAML2SSO();
// Autheticated username
String subjectId = samlResponse.getSubjectId();
// Authenticated user's attributes
Map<String, String> saml2SSOAttributes = samlResponse.getSubjectAttributes();
%>

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

    <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">


	<section class="login">
	    <div class="container">
			<div class="app-name"><h1>Reserve a Vehicle Service</h></div>
			<div class="image">
				<img src="img/date.png" class="date-img"/>
			</div>
            <div class="content">
                <form method="post" action="reservation">
                    <table style="width: 50rem;">
                        <% 
                            String username = null;
                            if (saml2SSOAttributes != null) {
                                for (Map.Entry<String, String> entry : saml2SSOAttributes.entrySet()) {
                                    String attributeName = entry.getKey();
                                    String attributeValue = entry.getValue();
                                    if ("http://wso2.org/claims/username".equals(attributeName)) {
                                        username = attributeValue;
                                    }
                                    
                                }
                            }
				        %>
                        <tr>
                            <th style="width: 20rem;"><h3>Username</h3></th>
                            <td><h3>:</h3></td>
                            <td><input type="text" id="" name="username" required="required" value="<%=username %>"></td>
                        </tr>
                        <tr>
                            <th style="width: 20rem;"><h3>Date</h3></th>
                            <td><h3>:</h3></td>
                            <td><input type="date" id="" name="date" required="required"></td>
                        </tr>
                        <tr>
                            <th style="width: 20rem;"><h3>Preferred time</h3></th>
                            <td><h3>:</h3></td>
                            <td><input type="time" id="" name="time" required="required"></td>
                        </tr>
                        <tr>
                            <th style="width: 20rem;"><h3>Preferred Location</h3></th>
                            <td><h3>:</h3></td>
                            <td><select id="" name="location" required="required">
                                <option value="Colombo">Colombo</option>
                                <option value="Kalutara">Kalutara</option>
                                <option value="Gampaha">Gampaha</option>
                                <option value="Galle">Galle</option>
                                <option value="Kandy">Kandy</option>
                                <option value="Jaffna">Jaffna</option>
                                <option value="Anuradhapura">Anuradhapura</option>
                                <option value="Matara">Matara</option>
                                <option value="Hambantota">Hambantota</option>
                                <option value="Rathnapura">Rathnapura</option>
                                <option value="Mulativ">Mulativ</option>
                                <option value="Polonnaruwa">Polonnaruwa</option>
                              </select></td>
                        </tr>
                        <tr>
                            <th style="width: 20rem;"><h3>Vehicle Registration Number</h3></th>
                            <td><h3>:</h3></td>
                            <td><input type="text" id="" name="registration_number" placeholder="XYZ242" required="required"></td>
                        </tr>
                        <tr>
                            <th style="width: 20rem;"><h3>Current Mileage</h3></th>
                            <td><h3>:</h3></td>
                            <td><input type="text" id="" name="current_mileage" placeholder="1000" required="required"></td>
                        </tr>
                        <tr>
                            <th style="width: 20rem;"><h3>Message</h3></th>
                            <td><h3>:</h3></td>
                            <td><textarea name="message" rows="3" cols="30" placeholder="message" required="required"></textarea></td>
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
	
	<!-- JS -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/dist/sweetalert.css">
    
    <script type="text/javascript">
    
    var status = document.getElementById("status").value;
    if(status == "success"){
    	swal("Congrats","Reservation Added Successfully","success");
    }
    if(status == "empty"){
    	swal("Wrong","Please fill all fields","error");
    }
    if(status == "invaliduser"){
    	swal("Wrong","Invalid Username","error");
    }
    if(status == "invalidno"){
    	swal("Wrong","Invalid Vehicle Number","error");
    }
    if(status == "invalidmileage"){
    	swal("Wrong","Incorrect mileage","error");
    }
    if(status == "invalidmessage"){
    	swal("Wrong","Incorrect message","error");
    }
    if(status == "invaliddate"){
    	swal("Wrong","Incorrect date","error");
    }
    if(status == "invalidtime"){
    	swal("Wrong","Incorrect time","error");
    }
    if(status == "invalidlocation"){
    	swal("Wrong","Incorrect location","error");
    }
    </script>
</body>
</html>