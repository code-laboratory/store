<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
<%
 String result = request.getParameter("result");
 if("done".equals(result)){
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<%
}
if("wrong".equals(result)){
%>
<h3 class="alert">Your Password is wrong!</h3>
<%
 }
%>
<form action="changeSecurityQuestionAction.jsp" method="post">
 <h3>Select Your New Security Question</h3>
 <select class="input-style" name="securityQuestion">
     <option value="Waht was your first Car?">Waht was your first Car?</option>
     <option value="Waht is the name of your first pet?">Waht is the name of your first pet?</option>
     <option value="Waht elementary school did you attend?">Waht elementary school did you attend?</option>
     <option value="Waht is the name of the town where you were born?">Waht is the name of the town where you were born?</option>
 </select>
 <hr>
 <h3>Enter Your New Answer</h3>
 <input type="text" class="input-style" name="newAnswer" placeholder="Enter Your New Answer" required>
 <hr>
 <h3>Enter Password (For Security)</h3>
 <input type="password" class="input-style" name="password" placeholder="Enter Your Password for Security" required>
 <hr>
 <button class="button" type="submit"> Save
  <i class='far fa-arrow-alt-circle-right'></i>
  </button>
</form>
</body>
<br><br><br>
</html>