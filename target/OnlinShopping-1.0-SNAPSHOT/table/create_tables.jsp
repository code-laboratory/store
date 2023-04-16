<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    try{
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        String queryRegister="CREATE TABLE USERS(name VARCHAR(100),email VARCHAR(100)PRIMARY KEY," +
                "mobileNumber BIGINT,securityQuestion varchar(300),answer varchar(200),password VARCHAR(300)," +
                "address VARCHAR(500),city VARCHAR(150),state VARCHAR(150),country VARCHAR(150));";

        String queryProduct = "CREATE TABLE product(id INT,name VARCHAR(600),category VARCHAR(200)," +
                " price FLOAT, active VARCHAR(10))";
        String queryCart = "CREATE TABLE cart(email VARCHAR(100),product_id INT,quantity INT, price FLOAT," +
                " total INT,address VARCHAR(500),city VARCHAR(150),state VARCHAR(150),country VARCHAR(150)," +
                "mobileNumber BIGINT, orderDate VARCHAR(150),deliveryDate VARCHAR(100)," +
                "paymentMethod VARCHAR(120),transactionId VARCHAR(90),status VARCHAR(120))";

        String queryMessage = "CREATE TABLE message(id Int AUTO_INCREMENT,email varchar(100)," +
                "subject varchar(200),body varchar(1000),PRIMARY KEY(id))";
        System.out.println(queryRegister);
        System.out.println(queryProduct);
        System.out.println(queryCart);
        System.out.println(queryMessage);
        st.execute(queryRegister);
//        st.execute(queryProduct);
//        st.execute(queryCart);
//        st.execute(queryMessage);
        System.out.println("table created...ok");
        con.close();
    }
    catch(Exception e){
        System.out.print(e);
    }

%>
<h1>HI</h1>