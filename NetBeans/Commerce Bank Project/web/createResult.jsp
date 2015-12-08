<%-- 
    Document   : createResult
    Created on : Nov 6, 2015, 11:55:37 AM
    Author     : Jackson
--%>

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.security.KeyStore"%>
<%@page contentType="applicaton/octet-stream"%><!--"text/html" pageEncoding="UTF-8"%> -->
<%@ page language="java" import="java.util.*" %>
<jsp:useBean id="create" scope="session" class="com.commerceBank.studentProject.CreateKeystore"/>
<%
    String certificate = request.getParameter("certInput");
    String pk = request.getParameter("pkInput");
    String password = request.getParameter("password");
    String alias = request.getParameter("alias");
  
    create.makeKeystore(certificate, pk, password, alias);
    byte[] ks = create.getKeyStore();
    
    response.setHeader("Content-length", Integer.toString(ks.length));
    response.setHeader("Content-Disposition", "attachment; filename=file.keystore");
    response.getOutputStream().write(ks, 0, ks.length);
    response.getOutputStream().flush();
%>