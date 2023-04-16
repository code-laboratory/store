<%@page import="java.sql.*"%>
<%@page import="project.ConnectionProvider"%>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    if("admin@gmail.com".equals(email) && "admin".equals(password)){
        session.setAttribute("email",email);
        response.sendRedirect("admin/adminHome.jsp");
    }else {
        int i = 0;
        try{
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM USERS WHERE email = '"+
                    email+"' and password='"+password+"'");
            while (rs.next()){
                session.setAttribute("email",email);
                response.sendRedirect("home.jsp");
            }
            if (i == 0){
                response.sendRedirect("login.jsp?result=notexist");
            }
        }catch (Exception e){
            System.out.println("login.jsp?result=invalid");
        }
    }
%>