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
	<section class="login">
	    <div class="container">
			<div class="app-name"><h1>Profile Information</h></div>
			<div class="image">
				<img src="img/person.png" class="person-img"/>
			</div>
            <div class="content">
                <table>
			     <% 
					String username = null;
					String email = null;
					String country = null;
					String mobile = null;
					String name = null;
					if (saml2SSOAttributes != null) {
					    for (Map.Entry<String, String> entry : saml2SSOAttributes.entrySet()) {
					        String attributeName = entry.getKey();
					        String attributeValue = entry.getValue();
					        if ("http://wso2.org/claims/username".equals(attributeName)) {
					             username = attributeValue;
					        }
					        else if ("http://wso2.org/claims/emailaddress".equals(attributeName)) {
					             email = attributeValue;
					        }
					        else if ("http://wso2.org/claims/country".equals(attributeName)) {
					             country = attributeValue;
					        }
					        else if ("http://wso2.org/claims/mobile".equals(attributeName)) {
					            mobile = attributeValue;
					        }
					        else if ("http://wso2.org/claims/givenname".equals(attributeName)) {
					            name = attributeValue;
					        }
					    }
					}
				%>
                    <tr>
                        <th><h3>Username</h3></th>
                        <td><h3>:</h3></td>
                        <td><%=username %></td>
                    </tr>
                    <tr>
                        <th><h3>Name</h3></th>
                        <td><h3>:</h3></td>
                        <td><%=name %></td>
                    </tr>
                    <tr>
                        <th><h3>Email</h3></th>
                        <td><h3>:</h3></td>
                        <td><%=email %></td>
                    </tr>
                    <tr>
                        <th><h3>Contact Number</h3></th>
                        <td><h3>:</h3></td>
                        <td><%=mobile %></td>
                    </tr>
                    <tr>
                        <th><h3>Country</h3></th>
                        <td><h3>:</h3></td>
                        <td><%=country %></td>
                    </tr>
                </table>
                <a href="home.jsp" ><h3 class="btn">Back to Home</h3></a>
            </div>
	    </div>
	    <div class="text">
	        <span>Copyright &copy 2023 | Pathum Sanjana</span>
	    </div>
	</section>
</body>
</html>