<%-- 
    Document   : responce
    Created on : Oct 9, 2015, 9:26:17 AM
    Author     : Jackson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="counter" scope="session" class="com.commercebank.studentProject.Main"/> <!-- is Main counter = new Counter(); -->

        <% 
          String w1= request.getParameter("fName"); 
          int l1 = 0;
          counter.setWord(w1);
          l1 = counter.getLength();
        %>

        <h3> The word <%= w1 %> has <%= l1 %> characters.</h3>
    </body>
</html>
