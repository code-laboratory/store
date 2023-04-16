<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Mobile Number</title>
</head>
<body>
<%
 String result = request.getParameter("result");
 if("done".equals(result)){
%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<%
 }
 if("wrong".equals(result)){
%>
<h3 class="alert">Your Password is wrong!</h3>
<%
 }
%>
<form action="changeMobileNumberAction.jsp" method="post">
 <h3>Enter Your New Mobile Number</h3>
 <input type="number" class="input-style" name="mobileNumber" placeholder="Enter Your New Mobile" required>
 <hr>
<h3>Enter Password (For Security)</h3>
 <input type="password" class="input-style" name="password" placeholder="Enter Your Password for Security" required>
<hr>
 <button type="submit" class="button">Save
  <i class='far fa-arrow-alt-circle-right'></i>
 </button>
</form>
</body>
<br><br><br>
</html>