<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
    <script>
        // if(window.history.forward(1) != null){
        //     window.history.forward(1);
        // }
    </script>
</head>
<body>
<br>
<table>
<thead>
<%
    String email = session.getAttribute("email").toString();
    int total = 0;
    int sno = 0;
    try{
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT SUM(total) FROM cart WHERE email = '"+email+"' AND address IS NULL");
        while (rs.next()){
            total = rs.getInt(1);
        }
%>
          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total);%></th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
        <%
            ResultSet rs1 = st.executeQuery("SELECT *FROM product INNER JOIN cart  ON product.id = cart.product_id AND cart.email ='"+email+"'AND cart.address IS NULL ");
            while (rs1.next()){
        %>
          <tr>
          <%sno = sno+1;%>
           <td><%out.println(sno);%></td>
            <td><%=rs1.getString(2)%></td>
            <td><%=rs1.getString(3)%></td>
            <td><i class="fa fa-inr"></i><%=rs1.getString(4)%></td>
            <td><%=rs1.getString(8)%></td>
            <td><i class="fa fa-inr"></i><%=rs1.getString(10)%></td>
            </tr>
        <%
            }
            ResultSet rs2 = st.executeQuery("SELECT *FROM users WHERE email = '"+email+"'");
            while (rs2.next()){
        %>
        </tbody>
      </table>

<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post">
 <div class="left-div">
     <h3>Enter Address</h3>
     <input type="text" class="input-style" name="address" value="<%=rs2.getString(7)%>" placeholder="enter address" required>
 </div>

<div class="right-div">
<h3>Enter city</h3>
    <input type="text" class="input-style" name="city" value="<%=rs2.getString(8)%>" placeholder="enter city" required>

</div> 

<div class="left-div">
<h3>Enter State</h3>
    <input type="text" class="input-style" name="state" value="<%=rs2.getString(9)%>" placeholder="enter state" required>

</div>

<div class="right-div">
<h3>Enter country</h3>
    <input type="text" class="input-style" name="country" value="<%=rs2.getString(10)%>" placeholder="enter country" required>

</div>
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
    <h3>Select way of Payment</h3>
    <select name="paymentMethod" class="input-style">
        <option value="Cash On Delivery">Cash on delivery(COD)</option>
        <option value="Online Payment">Online Payment</option>
    </select>
</div>

<div class="right-div">
<h3>Pay online on this btechdays@pay.com</h3>
    <input type="text" class="input-style" name="transactionId" placeholder="enter transaction ID">

<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
    <input type="text" class="input-style" name="mobileNumber" value="<%=rs2.getString(3)%>" placeholder="enter Mobile Number" required>

<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
    <button class="button" type="submit"> Save
    <i class='far fa-arrow-alt-circle-right'></i>
    </button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
<%
    }
    }catch (Exception e){
        System.out.println(e);
    }
%>
      <br>
      <br>
      <br>

</body>
</html>