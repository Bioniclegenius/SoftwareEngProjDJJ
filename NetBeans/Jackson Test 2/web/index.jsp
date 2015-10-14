<%-- 
    Document   : index
    Created on : Oct 12, 2015, 3:51:57 PM
    Author     : Jackson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %> <!-- Sets code to be java -->
<!DOCTYPE html>
<html>
    <jsp:useBean id="code" scope="session" class="com.commercebank.studentProject.Main"/>
    <%
        //Set up variable's
        String output = "";
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function showForm1(){
                document.getElementById('Form1').style.display = 'block';
                document.getElementById('Form2').style.display = 'none';
                document.getElementById('Form3').style.display = 'none';
                document.getElementById('Result1').style.display = 'none';
                document.getElementById('Result2').style.display = 'none';
            }
            function showForm2(){
                document.getElementById('Form1').style.display = 'none';
                document.getElementById('Form2').style.display = 'block';
                document.getElementById('Form3').style.display = 'none';
                document.getElementById('Result1').style.display = 'none';
                document.getElementById('Result2').style.display = 'none';
            }
            function showForm3(){
                document.getElementById('Form1').style.display = 'none';
                document.getElementById('Form2').style.display = 'none';
                document.getElementById('Form3').style.display = 'block';
                document.getElementById('Result1').style.display = 'none';
                document.getElementById('Result2').style.display = 'none';
            }
            function submit1(var x, var y){
            <% output = code.convert(x, y);%>
                    document.getElementById("lName").valueOf(););%>
                document.getElementById('Form1').style.display = 'none';
                document.getElementById('Form2').style.display = 'none';
                document.getElementById('Form3').style.display = 'none';
                document.getElementById('Result1').style.display = 'block';
                document.getElementById('Result2').style.display = 'none';
            }
            function submit2(){
                document.getElementById('Form1').style.display = 'none';
                document.getElementById('Form2').style.display = 'none';
                document.getElementById('Form3').style.display = 'none';
                document.getElementById('Result1').style.display = 'none';
                document.getElementById('Result2').style.display = 'block';
            }
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="Form1">
            <h1>FORM 1</h1>
            <form action="index.jsp">
                <input type="button" value="Form2" onClick="showForm2();">
                <input type="button" value="Form3" onClick="showForm3();">
            </form>
        </div>
        <div id="Form2" style="display:none;">
            <h1>FORM 2</h1>
            <form action="index.jsp">
                First Name: <input type="text" id="fName">
                Last Name: <input type="text" id="lName">
                <input type="button" value="Submit" onClick="submit1();">
                <input type="button" value="Return to Home" onClick="showForm1();">
            </form>
        </div>
        <div id="Form3" style="display:none;">
            <h1>FORM 3</h1>
            <form action="index.jsp">
                <input type="button" value="Submit" onClick="submit2();">
                <input type="button" value="Return to Home" onClick="showForm1();">
            </form>
        </div>
        <div id="Result1" style="display:none;">
            <h1>Result 1</h1>
            <form action="index.jsp">
                <input type="button" value="Return to Home" onClick="showForm1();">
            </form>
        </div>
        <div id="Result2" style="display:none;">
            <h1>Result 2</h1>
            <form action="index.jsp">
                <input type="button" value="Return to Home" onClick="showForm1();">
            </form>
        </div>
    </body>
</html>
