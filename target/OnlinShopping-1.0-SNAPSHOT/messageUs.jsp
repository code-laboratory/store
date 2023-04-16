<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>
<%
    String result = request.getParameter("result");
    if("valid".equals(result)){
%>
<h3 style="text-align:center; color:yellow;">Message successfully sent. Our team will contact you soon!</h3>
<%
    }
    if("invalid".equals(result)){
%>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%
    }
%>
<form action="messageUsAction.jsp" method="post">
    <input type="text" class="input-style" name="subject" placeholder="subject" required>
    <hr>
    <textarea name="body" class="input-style" cols="35" rows="12" placeholder="Enter Your Message" required></textarea>
    <hr>
    <button type="submit" class="button">Send
        <i class="far fa-arrow-alt-circle-right"></i>
    </button>
</form>
<br><br><br>
</body>
</html>