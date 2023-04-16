<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
  String id = request.getParameter("id");
  String name = request.getParameter("name");
  String category = request.getParameter("category");
  String price = request.getParameter("price");
  String active = request.getParameter("active");
  try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps=con.prepareStatement("INSERT INTO product values(?,?,?,?,?)");
    ps.setString(1,id);
    ps.setString(2,name);
    ps.setString(3,category);
    ps.setString(4,price);
    ps.setString(5,active);
    ps.executeUpdate();
    response.sendRedirect("addNewProduct.jsp?result=done...OK");
  }catch (Exception e){
    response.sendRedirect("addNewProduct.jsp?result=wrong");
  }
%>