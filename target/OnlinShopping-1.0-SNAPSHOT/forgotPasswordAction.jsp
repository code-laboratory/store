<%@page import="java.sql.*"%>
<%@page import="project.ConnectionProvider"%>
<%
    String email = request.getParameter("email");
    String mobileNumber = request.getParameter("mobileNumber");
    String SecurityQuestion = request.getParameter("SecurityQuestion");
    String answer = request.getParameter("answer");
    String newPassword = request.getParameter("newPassword");

    int cheked = 0;
    try{
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT *FROM USERS WHERE email = '"+email+"' and mobileNumber = '"+mobileNumber+"'" + " and SecurityQuestion = '"+SecurityQuestion+"' and answer = '"+answer+"'");
        while (rs.next()){
            cheked = 1;
            st.executeUpdate("UPDATE USERS SET password = '"+newPassword+"' WHERE email = '"+email+"'");
            response.sendRedirect("forgotPassword.jsp?result=done...OK");
        }
        if(cheked == 0){
            response.sendRedirect("forgotPassword.jsp?result=invalid");
        }
    }catch (Exception e){
        System.out.println(e);
    }
%>