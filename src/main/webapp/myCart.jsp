<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
    String result = request.getParameter("result");
    if("notPossible".equals(result)){
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%}%>
<%
    if("increment".equals(result)){
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%}%>
<%
    if("decrement".equals(result)){
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%}%>
<%
    if("removed".equals(result)){
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%}%>
<table>
    <thead>
    <%
        float total = 0;
        float seriNumber = 0;
    try{
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT SUM(total) FROM cart WHERE email = '"+email+"' AND address IS NULL");
        while (rs.next()){
            total = rs.getInt(1);
        }
    %>
        <tr>
            <th scope="col" style="background-color: yellow;">Total:<i class="fa fa-inr"></i><%out.println(total);%></th>
            <%
                if(total > 0){
            %>
                <th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th>
            <%}%>
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
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
    </thead>
    <tbody>
    <%
            ResultSet rs1 = st.executeQuery("SELECT *FROM product INNER JOIN cart  ON product.id = cart.product_id AND cart.email ='"+email+"'AND cart.address IS NULL ");
            while (rs1.next()){
    %>
        <tr>
            <%seriNumber +=1;%>
           <td><%out.println(seriNumber);%></td>
            <td><%=rs1.getString(2)%></td>
            <td><%=rs1.getString(3)%></td>
            <td><i class="fa fa-inr"></i><%=rs1.getString(4)%></td>
            <td><a href="incDecQuantityAction.jsp?id=<%=rs1.getString(1)%>&quantity=increment">
                    <i class='fas fa-plus-circle'></i></a><%=rs1.getString(8)%>
                <a href="incDecQuantityAction.jsp?id=<%=rs1.getString(1)%>&quantity=decrement">
                    <i class='fas fa-minus-circle'></i></a>
            </td>
            <td><i class="fa fa-inr"></i><%=rs1.getString(10)%></td>
            <td><a href="removeFromCart.jsp?id=<%=rs1.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
    <%
        }
    }catch (Exception e){
        System.out.println(e);
    }
    %>
    </tbody>
</table>
      <br>
      <br>
      <br>

</body>
</html>