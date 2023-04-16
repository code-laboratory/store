<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/style-signup.css">
</head>
<body>
<div class="main">
    <div id="background-wrap">
        <div class="bubble x1"></div>
        <div class="bubble x2"></div>
        <div class="bubble x3"></div>
        <div class="bubble x4"></div>
        <div class="bubble x5"></div>
        <div class="bubble x6"></div>
        <div class="bubble x7"></div>
        <div class="bubble x8"></div>
        <div class="bubble x9"></div>
        <div class="bubble x10"></div>
    </div>
    <div class="signup login">
        <label>Login</label>
        <form action="loginAction.jsp" method="post">
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" class="buttonSignup" value="Login">
        </form>
        <button class="buttonSignup"><a href="signup.jsp">Sign up</a></button>
        <button class="buttonSignup"><a href="forgotPassword.jsp">Forgot Password?</a></button>
    </div>
</div>
<div>
    <%
        String result_loginActon = request.getParameter("result");
        if("notexist".equals(result_loginActon)){
    %>
    <div class="popup" id="warning">
        <div class="popup-content">
            <div class="imgbox">
                <img src="img/warning.png" alt="" class="img">
            </div>
            <div class="title">
                <h3>Warning!</h3>
            </div>
            <p class="para">Incorrect Username or Password !</p>
            <button type="submit" class="buttonPopup" id="w_button">
                <a href="login.jsp" >Continue</a>
            </button>
            <p class="para">Please enter the username and password correctly</p>
        </div>
    </div>
    <%
        }
    %>
    <%
        if("invalid".equals(result_loginActon)){
    %>
    <%--<h1>Some thing Went Wrong! Try Again !</h1>--%>
    <div class="popup" id="error">
        <div class="popup-content">
            <div class="imgbox">
                <img src="img/cross.png" alt="" class="img">
            </div>
            <div class="title">
                <h3>Sorry :(</h3>
            </div>
            <p class="para"> Try Again !</p>
            <button type="submit" class="buttonPopup" id="e_button">
                <a href="login.jsp" >TRY AGAIN</a>
            </button>
            <p class="para"> There is a problem,try again!</p>
        </div>
    </div>
    <%
        }
    %>
</div>
</body>
</html>

