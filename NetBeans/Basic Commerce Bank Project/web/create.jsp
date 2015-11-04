<%-- 
    Document   : DownloadKeystore
    Created on : Nov 2, 2015, 4:26:33 PM
    Author     : Jackson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<jsp:useBean id="create" scope="session" class="com.commerceBank.studentProject.CreateKeystore"/>
<!DOCTYPE html>
<html>
    <%
        if(request.getParameter("certInput") != null){
            String certificate = request.getParameter("certInput");
            String pk = request.getParameter("pkInput");
            String password = request.getParameter("password");
            String alias = request.getParameter("alias");
            create.makeKeystore(certificate, pk, password, alias);
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form method="post" action="create.jsp">
            CSR<input type="text" name="csrInput" required="true"><br>
            PK<input type="text" name="pkInput" required="true"><br>
            Password for Keystore<input type="text" name="password" value="changeit" required="true"><br>
            Private Key Entry Alias Name<input type="text" name="alias"><br>
            <button type="submit">Generate Keystore</button>
        </form>
    </body>
</html>
