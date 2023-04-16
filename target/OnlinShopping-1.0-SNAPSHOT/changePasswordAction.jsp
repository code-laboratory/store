<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String email = session.getAttribute("email").toString();
    String oldPassword = request.getParameter("oldPassword");
    String newPassword = request.getParameter("newPassword");
    String confirmPassword = request.getParameter("confirmPassword");
    if(!confirmPassword.equals(newPassword))
        response.sendRedirect("changePassword.jsp?result=notMatch");
    else {
        boolean check = false;
        try{
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT *FROM users WHERE email='"+email+"' AND password='"+oldPassword+"'");
            while (rs.next()){
                check = true;
                st.executeUpdate("UPDATE users SET password ='"+newPassword+"' WHERE email ='"+email+"'");
                response.sendRedirect("changePassword.jsp?result=done");
            }
            if(check = false)
                response.sendRedirect("changePassword.jsp?result=wrong");
        }catch (Exception e){
            System.out.println(e);
        }
    }
%>