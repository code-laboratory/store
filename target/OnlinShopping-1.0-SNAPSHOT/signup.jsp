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
        <form action="singnupAction.jsp" method="post">
            <label>Sign up</label>
            <input type="text" name="name" placeholder="User name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="tel" name="mobileNumber" placeholder="Mobile Number" required>
            <select name="SecurityQuestion" class="minimal" required>
                <option value="Waht was your first Car?">Waht was your first Car?</option>
                <option value="Name of your first school?">Name of your first school?</option>
                <option value="Name of your last teacher?">Name of your last teacher?</option>
                <option value="Your favorite drink?">Your favorite drink?</option>
            </select>
            <input type="text" name="answer" placeholder="Answer" required/>
            <input type="password" name="password" placeholder="Password" required/>
            <input type="submit" class="buttonSignup" value="Sign up"/>
        </form>
        <button class="buttonSignup"><a href="login.jsp">Login</a></button>
    </div>
</div>
<div>
    <%
        String result_singupAction=request.getParameter("result");
        if("valid".equals(result_singupAction)){
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
            <p class="para">Your account has been created successfully</p>
            <button type="submit" class="buttonPopup" id="s_button">
                <a href="login.jsp" >Continue</a>
            </button>
            <p class="para">We are glad that you opened an account in our store :))</p>
        </div>
    </div>
    <%
        }
        if("invalid".equals(result_singupAction)){
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
            <p class="para">Already registered with this email.Try with another email !</p>
            <button type="submit" class="buttonPopup" id="e_button">
                <a href="signup.jsp" >TRY AGAIN</a>
            </button>
            <p class="para">Please try again!</p>
        </div>
    </div>
    <%
        }
    %>
</div>
</body>
</html>

