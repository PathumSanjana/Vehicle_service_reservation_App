# Vehicle Service Reservation Web Application

This web application allows users to reserve vehicle services securely, with a focus on authentication, access control, and mitigation of OWASP Top 10 vulnerabilities.

## Table of Contents

- [Features](#features)
- [Authentication](#authentication)
- [Security](#security)
- [Access Control](#access-control)
- [Technology Stack](#technology-stack)
- [MySQL Database](#mysql-database)
- [Getting Started](#getting-started)
- [Configuration](#configuration)


## Features

1. Reserve vehicle services:
   - Display user profile information.
   - Insert reservation details including date, time, location, vehicle information, and a message.
   - Delete upcoming reservations.
   - View all reservation information (past and future).

2. Authentication:
   - Implement authentication and logout using SAML protocol.
   - Use a cloud-based Identity Provider (IDP) for user management.

3. Security:
   - Mitigate OWASP Top 10 vulnerabilities (SQL injection, XSS, CSRF, authentication bypass).
   - Ensure a secure development process.

4. Access Control:
   - Users can only access and delete their own reservation information.
   - Access control based on the IDP's access token.

## Authentication

Authentication is implemented using [Cloud-Based Identity Provider](https://wso2.com/asgardeo/), specifically utilizing the OIDC/SAML protocols for a secure login and logout flow.

## Security

The application has been designed and developed with a focus on security. We have identified and mitigated potential OWASP Top 10 vulnerabilities, including SQL injection, XSS, CSRF, and authentication bypass.

## Access Control

Access control is enforced based on the access token obtained from the cloud-based Identity Provider. Users can only perform actions related to their own reservation information.

## Technology Stack

- Frontend: JavaServer Pages (JSP)
- Backend: Java Servlets
- Server: Apache Tomcat 9 with HTTPS
- Database: MySQL
- IDP: [Cloud-Based IDP - Asgardeo](https://wso2.com/asgardeo/)

## MySQL Database

- IP Address: 
- Port: 3306
- Username: 
- Password: 
- Database: isec_assessment2
- Table: vehicle_service

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/PathumSanjana/Vehicle_service_reservation_App.git

 2.Install dependencies and set up the environment.

 3.Deploy the web application on Tomcat.

## Deployment on Tomcat
Prerequisites
- Apache Tomcat 9 installed on your server.
- Java Development Kit (JDK) installed.

## Steps
1. Build the Project:
Navigate to the project directory and build the WAR (Web Application Archive) file.
   ```bash
   cd your-repository
   ./gradlew build
This will create a build directory containing the WAR file (e.g., your-repository.war).

2. Deploy to Tomcat:
Copy the WAR file to the Tomcat webapps directory.
   ```bash
   cp build/libs/your-repository.war /path/to/tomcat/webapps/
      
3. Start Tomcat:
Start or restart your Tomcat server.
   ```bash
   /path/to/tomcat/bin/startup.sh

4. Access the Application:
Open a web browser and navigate to the following URL:
   ```bash
   https://localhost:8080/your-repository
Replace your-repository with the name of your deployed WAR file.

## Configuration
Ensure all configurable parameters and credentials are updated in the application.properties file.
