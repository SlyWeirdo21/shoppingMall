<%@page import="java.security.interfaces.RSAKey"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<h3>판매 등록</h3>
<form action="action/payment_insert.jsp">
	<table border="1">
		<tr>
			<td>
				<p>주문일</p>
			</td>
			<td>
				<select name="order_date">
				<%
				try
				{  
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con=DriverManager.getConnection(  
					"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
					Statement stmt=con.createStatement();  
			
					String query = "SELECT TO_CHAR(ORDER_DATE, 'YYYY/MM/DD'), TO_CHAR(ORDER_DATE, 'YYYY/MM/DD') FROM PAYMENT_HISTORY";
				
					ResultSet rs=stmt.executeQuery(query);  
					while(rs.next()) {
						%><option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option><%
					}
					con.close();  
				}
				catch(Exception e)
				{ 
					System.out.println(e);
				}  
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td><p>주문상태</p></td>
			<td>
				<select name="order_status">
					<option value="PAYMENT_WAITING">PAYMENT_WAITING</option>
					<option value="PAYMENT_SUCCESS">PAYMENT_SUCCESS</option>
					<option value="SHIPPING">SHIPPING</option>
					<option value="SHIPPPED">SHIPPPED</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><p>주문개수</p></td>
			<td><input type="number" name="order_count"></td>
		</tr>
		<tr>
			<td><p>상품명</p></td>
			<td>
				<select name="product_id">
				<%
				try
				{  
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con=DriverManager.getConnection(  
					"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
					Statement stmt=con.createStatement();  
			
					String query = "SELECT id, product.name FROM product";
				
					ResultSet rs=stmt.executeQuery(query);  
					while(rs.next()) {
						%><option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option><%
					}
					con.close();  
				}
				catch(Exception e)
				{ 
					System.out.println(e);
				}  
				%>
				</select>
			</td>
		</tr>
		<tr>	
			<td><p>유저명</p></td>
			<td>
				<select name="member_id">
				<%
				try
				{  
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con=DriverManager.getConnection(  
					"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
					Statement stmt=con.createStatement();  
			
					String query = "SELECT id, member.name FROM member";
				
					ResultSet rs=stmt.executeQuery(query);  
					while(rs.next()) {
						%><option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option><%
					}
					con.close();  
				}
				catch(Exception e)
				{ 
					System.out.println(e);
				}  
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td><p>주소명</p></td>
			<td><input type="text" name="address"></td>
		</tr>	
		<tr>
			<td colspan="2">
				<input type="submit" value="제출">
				<input type="button" value="다시쓰기">
			</td>
		</tr>
	</table>
</form>