<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String email = session.getAttribute("email").toString();
    String id = request.getParameter("id");
    String incOrDec = request.getParameter("quantity");
    int price = 0;
    int total = 0;
    int quantity = 0;
    int final_total = 0;
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT *FROM cart where email = '"+email+"' AND product_id ='"+id+"' AND address IS NULL");
        while (rs.next()){
            price = rs.getInt(4);
            total = rs.getInt(5);
            quantity = rs.getInt(3);
        }
        if(quantity == 1 && incOrDec.equals("decrement"))
            response.sendRedirect("myCart.jsp?result=notPossible");
        else if(quantity != 1 && incOrDec.equals("decrement")){
            total = total- price;
            quantity = quantity - 1;
            st.executeUpdate("UPDATE cart SET total = '"+total+"', quantity='"+quantity+"' WHERE  email = '" +email+"' AND product_id='"+id+"' AND address IS NULL ");
            response.sendRedirect("myCart.jsp?result=decrement");
        }else {
            total +=price;
            quantity += 1;
            st.executeUpdate("UPDATE cart SET total = '"+total+"', quantity='"+quantity+"' WHERE  email = '" +email+"' AND product_id='"+id+"' AND address IS NULL ");
            response.sendRedirect("myCart.jsp?result=increment");
        }
    }catch (Exception e){
        System.out.println(e);
    }
%>