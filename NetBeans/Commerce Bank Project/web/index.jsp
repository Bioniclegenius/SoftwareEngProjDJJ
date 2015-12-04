<%-- 
    Document   : index
    Created on : Dec 2, 2015, 3:58:46 PM
    Author     : Jackson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<jsp:useBean id="make" scope="session" class="com.commerceBank.studentProject.Generate"/>
<!DOCTYPE html>
<html>
  <head>
    <title>Commerce Bank Certificate Creator</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script language="JavaScript">
      ClipBoard=function(watcopy){
        document.getElementById(watcopy).select();
      }
      enableUpload=function(){
        var textCert=document.getElementById("certificate").value;
        var textPass=document.getElementById("password").value;
        var textAlias=document.getElementById("alias").value;
        var textPKIn=document.getElementById("pkInput").value;
        if(textCert!=""&&textPass!=""&&textAlias!=""&&textPKIn!="")
          document.getElementById('upload').disabled=false;
        else
          document.getElementById('upload').disabled=true;
      }
    </script>
    <%
        String privateKey = "", CSR = "";
        if(request.getParameter("commonName") != null){
            String country = request.getParameter("countryName");
            String state = request.getParameter("stateName");
            String locality = request.getParameter("localityName");
            String organization = request.getParameter("organizationName");
            String organizationUnit = request.getParameter("organizationUnitName");
            String commonName = request.getParameter("commonName");
            String altName = request.getParameter("altName");

            make.generate(country, state, locality, organization, organizationUnit, commonName, altName);

            privateKey = make.getPrivateKey();
            CSR = make.getCSR();
        }
    %>
  </head>

  <body>
    <div id = "title">
      <h1>Commerce Bank Certificate Creator</h1>
      <hr>
      <img src="icon.png" id = "icon">
    </div>
    <table style="width: 100%;">
      <tr>
        <td id = "leftHalf">
            <form action="generate.jsp" method="post">
                <button style="width: 125px;" type="submit">Generate CSR and Private Key</button>
            </form><br /><br />
          <b>CSR</b>
          <br /><br />
          <textarea id="holdtext" style="display: none;"></textarea>
          <textarea id="CSROutput" rows = "6" style="width: 50%;" readonly = "true"><%= CSR %></textarea>
          <button onclick="ClipBoard('CSROutput');">Select</button><br /><br />
          <b>Private key</b>
          <br /><br />
          <textarea id="PKOutput" rows = "6" style="width: 50%;" readonly = "true"><%= privateKey %></textarea>
          <button onclick="ClipBoard('PKOutput');">Select</button>
          <br />
        </td>
        <td id = "rightHalf">
          <form action="createResult.jsp" method="post">
            <table>
              <tr>
                <td><b>Certificate</b></td>
                <td><textarea id="certificate" rows = "6" style="width: 100%;" oninput="enableUpload();" onpropertychange="enableUpload();"></textarea></td>
              </tr>
              <tr>
                <td><b>Password</b></td>
                <td><input type="text" id="password" value="" style="width: 200px;" oninput="enableUpload();" onpropertychange="enableUpload();"/></td>
              </tr>
              <tr>
                <td><b>Alias</b></td>
                <td><input type="text" id="alias" value="" style="width: 200px;" oninput="enableUpload();" onpropertychange="enableUpload();"/></td>
              </tr>
              <tr>
                <td><button id="upload" type="submit" disabled>Upload</button></td>
                <td><input id="pkInput" type="text" value="<%= privateKey %>" style="visibility: hidden"></td>
              </tr>
            </table>
          </form>
        </td>
      </tr>
    </table>
  </body>
</html>
