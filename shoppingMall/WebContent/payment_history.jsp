<%@page import="javax.swing.border.Border"%>
<%@page import="oracle.net.jdbc.TNSAddress.Description"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	try{
    	//step1 load the driver class
    	Class.forName("oracle.jdbc.driver.OracleDriver");

    	//step2 create  the connection object
    	Connection con=DriverManager.getConnection(
    	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");

	    //step3 create the statement object
    	Statement stmt=con.createStatement();
    	/* Statement stmt2=con.createStatement(); */

    	//step4 execute query
    	String query = "SELECT " +
    		    	   "payment_history.id, product.price, payment_history.order_count " +
    			       "FROM " +
    		           "payment_history, product " +
    			       "WHERE " +
    		           "payment_history.product_id = product.id " ;
    	%>
    	<%
    	ResultSet rs=stmt.executeQuery(query);    		
    	while(rs.next()) {
    	    String query2 ="UPDATE payment_history " +
 				   " SET order_price = " + (rs.getInt(2) * rs.getInt(3)) +
 				   " WHERE payment_history.product_id =  " + rs.getInt(1);
    	    System.out.println(query2);
			/* stmt2.executeQuery(query2); */
 
    	
    	}             
		%>
		<%	
    	//step5 close the connection object
    	con.commit();
    	con.close();
 
    }catch(Exception e){ System.out.println(e);}
	%>
</body>
</html>