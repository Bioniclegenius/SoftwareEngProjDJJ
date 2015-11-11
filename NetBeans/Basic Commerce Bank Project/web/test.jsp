<%-- 
    Document   : test
    Created on : Nov 6, 2015, 12:05:25 PM
    Author     : Jackson
--%>

<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        String in = request.getParameter("certInput");
        ByteArrayInputStream bais = new ByteArrayInputStream(in.getBytes("UTF-8"));
        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        int i;
        while ( ( i = bais.read() ) != -1  ){
            baos.write(i);
            baos.flush();
             }

        String output = baos.toString(); //System.out.print(baos.toString());
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <p><%= request.getParameter("certInput") %></p>
        <p><%= output %>
    </body>
</html>
