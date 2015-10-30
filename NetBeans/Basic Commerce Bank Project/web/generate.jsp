<%-- 
    Document   : generate
    Created on : Oct 12, 2015, 6:27:22 PM
    Author     : Jackson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generate</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="generateResult.jsp" method="post">
            Country Name: <input type="text" name="countryName" value="United States" required><br>
            State or Province Name: <input type="text" name="stateName" value ="Missouri" required><br>
            Locality Name: <input type="text" name="localityName" value="Kansas City" required><br>
            Organization Name: <input type="text" name="organizationName" value="Commerce Bacshares Inc" required><br>
            Organizational Unit Name: <input type="text" name="organizationUnitName" value="Information Technology" required><br>
            Common Name: <input type="text" name="commonName" required><br>
            Email Address: <input type="text" name="emailAddress" required<br>
            <button type="submit">Submit</button>
        </form>
    </body>
</html>
