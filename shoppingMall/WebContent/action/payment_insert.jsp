<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String order_date = request.getParameter("order_date");
String order_status = request.getParameter("order_status");
int order_count = Integer.parseInt(request.getParameter("order_count"));
int product_id = Integer.parseInt(request.getParameter("product_id"));
int member_id = Integer.parseInt(request.getParameter("member_id"));
String address = request.getParameter("address");


String query = "INSERT INTO PAYMENT_HISTORY(ID, ORDER_DATE, ORDER_STATUS, ORDER_COUNT, ORDER_PRICE, PRODUCT_ID, MEMBER_ID, ADDRESS) " +
			   "VALUES(SEQ_PAYMENT_HISTORY.NEXTVAL, '%s', '%s', %d, (select product.price * " + order_count + " from product where id = " + product_id + "), %d, %d, '%s')";

try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  

	stmt.executeQuery(String.format(query, order_date, order_status, order_count, product_id, member_id, address));

	con.commit();
	con.close();
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>