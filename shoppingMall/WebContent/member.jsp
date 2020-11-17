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

    	//step4 execute query
    	String query = "SELECT " +
    		    	   "id,password, name, email, phone, address, age " +
    			       "FROM " +
    		           "member ";
    	%>
    	<table border="1">
    		<tr>
    			<td>id</td>
    			<td>password</td>
    			<td>name</td>
    			<td>email</td>
    			<td>phone</td>
    			<td>address</td>
    			<td>age</td>
    		</tr><%
    	ResultSet rs=stmt.executeQuery(query);
    	while(rs.next()) {
   		/* System.out.println(rs.getInt("id") + ", " + rs.getInt("category_id") + ", " + rs.getString("name") + ", " + 
    					   rs.getInt("price") + ", " + rs.getInt("stock") + ", " + 
    	                   rs.getString("description") + ", " + rs.getString("origin"));  */
    	    %><tr><%
    	    	%><td><%=rs.getString(1) %></td><%
    	    	%><td><%=rs.getString(2) %></td><%
    	    	%><td><%=rs.getString(3) %></td><%
    	    	%><td><%=rs.getString(4) %></td><%
    	    	%><td><%=rs.getString(5) %></td><%
    	    	%><td><%=rs.getString(6) %></td><%
    	    	%><td><%=rs.getString(7) %></td><%
    	    %></tr><% }             
		%></table><%	
    	//step5 close the connection object
    	con.close();
 
    }catch(Exception e){ System.out.println(e);}
	%>
</body>
</html>