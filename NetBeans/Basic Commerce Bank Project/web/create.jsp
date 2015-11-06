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
            <form method="post" action="createResult.jsp" enctype="multipart/form-data">>
                Certificate<input type="file" name="certInput" size="50" /><br />
                PK<input type="file" name="pkInput" size="50"/><br>
                Password for Keystore<input type="text" name="password" value="changeit" required="true"><br>
                Private Key Entry Alias Name<input type="text" name="alias"><br>
                <button type="submit">Generate Keystore</button>
            </form>
    </body>
</html>
