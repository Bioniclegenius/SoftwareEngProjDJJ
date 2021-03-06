<%-- 
    Document   : result1
    Created on : Oct 12, 2015, 6:32:02 PM
    Author     : Jackson
--%>

<%@page import="java.security.PrivateKey"%>
<%@page import="org.bouncycastle.pkcs.PKCS10CertificationRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<jsp:useBean id="make" scope="session" class="com.commerceBank.studentProject.Generate"/>
<!DOCTYPE html>
<html>
    <head>
            <%
            String country = request.getParameter("countryName");
            String state = request.getParameter("stateName");
            String locality = request.getParameter("localityName");
            String organization = request.getParameter("organizationName");
            String organizationUnit = request.getParameter("organizationUnitName");
            String commonName = request.getParameter("commonName");
            String altName = request.getParameter("altName");
            
            make.generate(country, state, locality, organization, organizationUnit, commonName, altName);
            
            String privateKey = make.getPrivateKey();
            String CSR = make.getCSR();
        %>
        <script type="text/javascript">
            function downloadPK(){
                var a = window.document.createElement('a');
                a.href = window.URL.createObjectURL(new Blob([ ' <%= privateKey %> '], {type: 'text/csv'}));
                a.download = 'privatekey.txt';

                // Append anchor to body.
                document.body.appendChild(a);
                a.click();

                // Remove anchor from body
                document.body.removeChild(a);
            }
            function downloadCSR(){
                var a = window.document.createElement('a');
                a.href = window.URL.createObjectURL(new Blob([ ' <%= CSR %> '], {type: 'text/csv'}));
                a.download = 'csr.txt';

                // Append anchor to body.
                document.body.appendChild(a);
                a.click();

                // Remove anchor from body
                document.body.removeChild(a);
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generate CSR & Private Key</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <p> TEST COUNTRY: <%= country %></p>
        <p> TEST STATE: <%= state %></p>
        <p> TEST LOCALITY: <%= locality %></p>
        <p> TEST ORGANIZATION: <%= organization %></p>
        <p> TEST ORGANIZATIONUNIT: <%= organizationUnit %></p>
        <p> TEST COMMONNAME: <%= commonName %></p>
        
        <p>Private Key:</p>
        <textarea rows='10' cols='80' disabled="true">
            <%= privateKey %>
        </textarea><br>
        <button onclick="downloadPK();">Download Private Key</button><br>
        
        <p>Certificate Signing Request:</p>
        <textarea rows='10' cols='80' disabled="true">
            <%= CSR %>
        </textarea><br>
        <button onclick="downloadCSR();">Download Certificate Signing Request</button>
    </body>
</html>
