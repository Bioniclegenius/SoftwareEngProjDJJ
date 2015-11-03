<%-- 
    Document   : DownloadKeystore
    Created on : Nov 2, 2015, 4:26:33 PM
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
        <form method="post" action="generateDownloadKeystore.jsp">
            CSR<input type="text" name="csrInput"><br>
            PK<input type="text" name="pkInput"><br>
            <button type="submit">Generate Keystore</button>
        </form>
    </body>
</html>
