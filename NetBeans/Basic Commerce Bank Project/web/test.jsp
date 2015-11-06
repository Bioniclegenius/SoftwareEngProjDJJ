<%-- 
    Document   : test
    Created on : Nov 6, 2015, 12:05:25 PM
    Author     : Jackson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <h1><%= request.getParameter("certInput") %></h1>
        <h1><%= request.getParameter("certName") %></h1>
        <h1><%= request.getParameter("certName") %></h1>
        <h1><%= request.getParameter("certName") %></h1>
    </body>
</html>
