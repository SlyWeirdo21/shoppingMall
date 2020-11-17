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
	<% String a = "스트링"; %>
	<a> A의 글자는?:  <%=a %> </a>
	<br>
	<%
	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 3-i; j++) {
			 %><a>&nbsp;</a><% 
		}
		for (int j = 0; j < 2*i+1; j++) {
			 %><a>*</a><% 
		}
		%><br><%
	}
	%>
	<%
	int s = 1;
	int b = 0;
	int temp = 0;
	
	while (b < 100) {
		temp = s + b;
		s = b;
		b = temp;

		%><a><%=s %></a><%
		%><a>&nbsp;</a><% 
	}
	%>
	<table border="1">
	<%
		for (int i = 1; i <= 9; i++) {
			%><tr><%
			for (int j = 1; j <= 9; j++) {
				%><td><%=j %> * <%=i %> = <%=i*j %></td><%
			}
			%></tr><%
		}
	%>
	</table>
	<table border="1">
	<%
	for (int i = 1; i <= 5; i++) {
		%><tr><%
		for (int j = 1; j <= 5; j++) {
			%><td><%if (j <= i)%>*</td><%
	
		}
		%></tr><%
	}
	%>
	</table>
	<table border="1">
	<%
	for (int i = 1; i <= 5; i++) {
		%><tr><%
		for (int j = 5; j >= 1; j--) {
			%><td><%if (j <= i)%>*</td><%
	
		}
		%></tr><%
	}
	%>
	</table>
	<%
	try{
    	//step1 load the driver class
    	Class.forName("oracle.jdbc.driver.OracleDriver");

    	//step2 create  the connection object
    	Connection con=DriverManager.getConnection(
    	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");

	    //step3 create the statement object
    	Statement stmt=con.createStatement();

    	//step4 execute query
    	String query = "SELECT " +
    		    	   "product.id, category.name, product.name, product.price, product.stock, product.description, product.origin " +
    			       "FROM " +
    		           "product, category " +
    		           "WHERE " +
    		           "product.category_id = category.id ";
    	%>
    	<table border="1">
    		<tr>
    			<td>product_id</td>
    			<td>category_name</td>
    			<td>product_name</td>
    			<td>product_price</td>
    			<td>product_stock</td>
    			<td>product_description</td>
    			<td>product_origin</td>
    		</tr><%
    	ResultSet rs=stmt.executeQuery(query);
    	while(rs.next()) {
   		/* System.out.println(rs.getInt("id") + ", " + rs.getInt("category_id") + ", " + rs.getString("name") + ", " + 
    					   rs.getInt("price") + ", " + rs.getInt("stock") + ", " + 
    	                   rs.getString("description") + ", " + rs.getString("origin"));  */
    	    %><tr><%
    	    	%><td><%=rs.getInt(1) %></td><%
    	    	%><td><%=rs.getString(2) %></td><%
    	    	%><td><%=rs.getString(3) %></td><%
    	    	%><td><%=rs.getInt(4) %></td><%
    	    	%><td><%=rs.getInt(5) %></td><%
    	    	%><td><%=rs.getString(6) %></td><%
    	    	%><td><%=rs.getString(7) %></td><%
    	    %></tr><% }             
		%></table><%	
    	//step5 close the connection object
    	con.close();
 
    }catch(Exception e){ System.out.println(e);}
	%>
	
	<%
	int z = 1;
	int x = 0;
	int c = 0;
	%>
	<table border="1">
		<% for (int i = 1; i <= 11; i++) {
			%><tr><%
			for( int j = 1; j <= 3; j++) {
				c = z + x;
				z = x;
				x = c;
				%><td><%=c %></td><%
			}
		}
	%></table><%
	%>
</body>
</html>