<%-- 
    Document   : index
    Created on : Oct 5, 2015, 9:13:28 AM
    Author     : Jackson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .hidden{
                display: none;
            }
            
            .none{
                
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="counter" scope="session" class="com.commercebank.studentProject.Main"/> <!-- is Main counter = new Counter(); -->

        <%
          String w1 = "", l2 = "", show1 = "none", show2 = "none";
          if(request.getParameter("fName") != null && !request.getParameter("fName").equals("")){
            w1= request.getParameter("fName"); 
            int l1 = 0;
            counter.setWord(w1);
            l1 = counter.getLength();
            l2 = l1 + "";
            show1 = "hidden";
          }
          else {
              show2 = "hidden";
          }
        %>
        <div class=' <%= show1 %>'>
            <h1>Hello World!</h1>
            <form>
                First Name: <input type='text' name='fName' /><br />
                <button type='submit'>Click Me!</button>
            </form>
        </div>
        <div class ='<%= show2 %>'>
            <h3> The word <%= w1 %> has <%= l2 %> characters.</h3>
            <form>
                <button type='submit'>Return Home</button>
            </form>
        </div>
    </body>
</html>
