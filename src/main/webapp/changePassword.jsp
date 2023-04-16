<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<%
    String result = request.getParameter("result");
    if("notMatch".equals(result)){
%>
<h3 class="alert">New password and Confirm password does not match!</h3>
<%
    }
    if("wrong".equals(result)){
%>
<h3 class="alert">Your old Password is wrong!</h3>
<%
    }
    if("done".equals(result)){
%>
<h3 class="alert">Password change successfully!</h3>
<%
    }
    if("invalid".equals(result)){
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%
    }
%>
<form action="changePasswordAction.jsp" method="post">
<h3>Enter Old Password</h3>
    <input type="password" class="input-style" name="oldPassword" placeholder="Enter old Password" required>
  <hr>
 <h3>Enter New Password</h3>
    <input type="password" class="input-style" name="newPassword" placeholder="Enter new Password" required>
    <hr>
<h3>Enter Confirm Password</h3>
    <input type="password" class="input-style" name="confirmPassword" placeholder="Enter confirm Password" required>
<hr>
    <button class="button"> Save
        <i class='far fa-arrow-alt-circle-right'></i>
    </button>
</form>
</body>
<br><br><br>
</html>