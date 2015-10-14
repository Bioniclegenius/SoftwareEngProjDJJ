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
        <form action="generateResult.jsp">
            Country Name: <input type="text" name="countryName" value="United States"><br>
            State or Province Name: <input type="text" name="stateName"><br>
            Locality Name: <input type="text" name="localityName"><br>
            Organization Name: <input type="text" name="organizationName"><br>
            Organizational Unit Name: <input type="text" name="organizationUnitName"><br>
            Common Name: <input type="text" name="commonName"><br>
            Email Address (might be optional: <input type="text" name="emailAddress">
            <button type="submit">Submit</button>
        </form>
    </body>
</html>
