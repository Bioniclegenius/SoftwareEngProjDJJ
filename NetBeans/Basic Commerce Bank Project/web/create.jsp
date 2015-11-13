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
        <form method="post" action="createResult.jsp" >
                Certificate<input type="text" name="certInput"><br>
                Private Key<input type="text" name="pkInput"><br>
                Password for Keystore<input type="text" name="password" value="changeit" required="true"><br>
                Private Key Entry Alias Name<input type="text" name="alias"><br>
                <button type="submit">Generate Keystore</button>
            </form>
    </body>
</html>
