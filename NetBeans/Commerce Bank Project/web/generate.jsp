<%-- 
    Document   : generate
    Created on : Dec 4, 2015, 9:34:26 AM
    Author     : Jackson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Commerce Bank Certificate Creator</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>

  <body>
    <div id = "title">
      <h1>CSR/Private Key Generator</h1>
      <hr>
    </div>
    <form action="index.jsp">
      <table>
        <tr>
          <td>Country:</td><td><input type="text" name="countryName" value="United States" style="width: 200px;" required /></td>
        </tr>
        <tr>
          <td>State/Province:</td><td><input type="text" name="stateName" value="Missouri" style="width: 200px;" required /></td>
        </tr>
        <tr>
          <td>Locality:</td><td><input type="text" name="localityName" value="Kansas City" style="width: 200px;" required /></td>
        </tr>
        <tr>
          <td>Organization:</td><td><input type="text" name="organizationName" value="Commerce Bankshares Inc" style="width: 200px;" required /></td>
        </tr>
        <tr>
          <td>Organizational Unit:</td><td><input type="text" name="organizationUnitName" value="Information Technology" style="width: 200px;" required /></td>
        </tr>
        <tr>
          <td>Common:</td><td><input type="text" name="commonName" style="width: 200px;" required /></td>
        </tr>
        <tr>
          <td>Alternate:</td><td><input type="text" name="altName" style="width: 200px;" /></td>
        </tr>
      </table>
      <button type="Submit">SUBMIT TO ME MORTAL</button>
    </form>
  </body>
</html>