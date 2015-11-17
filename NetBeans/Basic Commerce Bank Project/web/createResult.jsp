<%-- 
    Document   : createResult
    Created on : Nov 6, 2015, 11:55:37 AM
    Author     : Jackson
--%>

<%@page import="java.security.KeyStore"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<jsp:useBean id="create" scope="session" class="com.commerceBank.studentProject.CreateKeystore"/>

<!DOCTYPE html>
<html>
    <%
        KeyStore key = null;
        String certificate = request.getParameter("certInput");
        String pk = request.getParameter("pkInput");
        String password = request.getParameter("password");
        String alias = request.getParameter("alias");
        create.makeKeystore(certificate, pk, password, alias);
        key = create.getKey();
        //response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment;filename=" + key);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <p><%= certificate %></p>
        <p><%= pk %></p>
        <p><%= password %></p>
        <p><%= alias %></p>
    </body>
</html>
