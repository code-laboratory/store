<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String email = session.getAttribute("email").toString();
    String subject = request.getParameter("subject");
    String body = request.getParameter("body");
    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("INSERT INTO message(email,subject,body) VALUES(?,?,?)");
        ps.setString(1,email);
        ps.setString(2,subject);
        ps.setString(3,body);
        ps.executeUpdate();
        response.sendRedirect("messageUs.jsp?result=valid");
    }catch (Exception e){
        System.out.println(e);
        response.sendRedirect("messageUs.jsp?result=invalid");
    }
%>