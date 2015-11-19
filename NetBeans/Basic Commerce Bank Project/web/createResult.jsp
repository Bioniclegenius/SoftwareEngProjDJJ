<%-- 
    Document   : createResult
    Created on : Nov 6, 2015, 11:55:37 AM
    Author     : Jackson
--%>

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.security.KeyStore"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<jsp:useBean id="create" scope="session" class="com.commerceBank.studentProject.CreateKeystore"/>
<%
    KeyStore key = null;
    String certificate = request.getParameter("certInput");
    String pk = request.getParameter("pkInput");
    String password = request.getParameter("password");
    String alias = request.getParameter("alias");
    create.makeKeystore(certificate, pk, password, alias);
    key = create.getKey();
            // Save the new keystore contents
            File file = new File ("test.keystore");
            FileOutputStream out2 = new FileOutputStream(file);
            key.store(out2, password.toCharArray());
            out2.close();
    //response.setContentType("application/vnd.ms-excel");
    //response.setHeader("Content-Disposition", "attachment;filename=" + key);*
%>