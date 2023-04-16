<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign up</title>
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
    <div class="signup">
        <form action="forgotPasswordAction.jsp" method="post">
            <label>Forgot Password</label>
            <input type="email" name="email" placeholder="Email" required>
            <input type="tel" name="mobileNumber" placeholder="Mobile Number" required>
            <select name="SecurityQuestion" class="minimal" required>
                <option value="Waht was your first Car?">Waht was your first Car?</option>
                <option value="Name of your first school?">Name of your first school?</option>
                <option value="Name of your last teacher?">Name of your last teacher?</option>
                <option value="Your favorite drink?">Your favorite drink?</option>
            </select>
            <input type="text" name="answer" placeholder="Answer" required/>
            <input type="password" name="newPassword" placeholder="New Password to set" required/>
            <input type="submit" class="buttonSignup" value="Save"/>
        </form>
        <button class="buttonSignup"><a href="login.jsp">Login</a></button>
    </div>
</div>
<div>
    <%
        String result_forgotPasswordAction = request.getParameter("result");
        if("done...OK".equals(result_forgotPasswordAction)){
    %>
    <%-- <h1>Successfully Registered !</h1>--%>
    <div class="popup" id="success">
        <div class="popup-content">
            <div class="imgbox">
                <img src="img/checked.png" alt="" class="img">
            </div>
            <div class="title">
                <h3>Success!</h3>
            </div>
            <p class="para">Password Changed Successfully!</p>
            <button type="submit" class="buttonPopup" id="s_button">
                <a href="login.jsp" >Continue</a>
            </button>
            <p class="para">Your password has been successfully changed</p>
        </div>
    </div>
    <%
        }
    %>
    <%
        if("invalid".equals(result_forgotPasswordAction)){
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
            <p class="para">One of the fields is wrong</p>
            <button type="submit" class="buttonPopup" id="e_button">
                <a href="signup.jsp" >TRY AGAIN</a>
            </button>
            <p class="para">Please fill in the fields carefully</p>
        </div>
    </div>
    <%
        }
    %>
</div>
</body>
</html>

