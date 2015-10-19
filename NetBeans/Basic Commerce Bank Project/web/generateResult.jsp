<%-- 
    Document   : result1
    Created on : Oct 12, 2015, 6:32:02 PM
    Author     : Jackson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<jsp:useBean id="make" scope="session" class="com.commerceBank.studentProject.Generate"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generate CSR & Private Key</title>
    </head>
    <body>
        <%
            String country = request.getParameter("countryName");
            String state = request.getParameter("text");
            String locality = request.getParameter("localityName");
            String organization = request.getParameter("organizationName");
            String organizationUnit = request.getParameter("organizationUnitName");
            String commonName = request.getParameter("commonName");
            
            make.generate(country, state, locality, organization, organizationUnit, commonName);
            
            String privateKey = make.getPrivateKey();
            String CSR = make.getCSR();
        %>
        <h1>Hello World!</h1>
        <p>Private Key: <%= privateKey %></p>
        <p>Certificate Signing Request: <%= CSR %></p>
    </body>
</html>
