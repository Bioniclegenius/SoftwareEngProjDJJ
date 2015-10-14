<%-- 
    Document   : result1
    Created on : Oct 12, 2015, 6:32:02 PM
    Author     : Jackson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<jsp:useBean id="code" scope="session" class="com.commerceBank.studentProject.Main"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String fN = request.getParameter("fName");
            String lN = request.getParameter("lName");
            String x = code.process(fN, lN);
        %>
        <h1>Hello World!</h1>
        <h3>Welcome <%= x %> to the site!</h3>
    </body>
</html>
