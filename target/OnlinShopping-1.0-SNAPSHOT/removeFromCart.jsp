<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String email = session.getAttribute("email").toString();
    String id = request.getParameter("id");
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        st.executeUpdate("DELETE FROM cart WHERE email = '"+email+"' AND product_id ='"+id+"' AND address IS NULL");
        response.sendRedirect("myCart.jsp?result=removed");
    }catch (Exception e){
        System.out.println(e);
    }
%>