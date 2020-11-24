<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<h3>판매 목록</h3>
<table border="1">
<tr>
	<td>주문ID</td>
	<td>주문일</td>
	<td>주문상태</td>
	<td>주문개수</td>
	<td>주문가격</td>
	<td>상품명</td>
	<td>유저명</td>
</tr>
<%
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection(
        "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
        Statement stmt=con.createStatement();

        String query = " SELECT " +
                       		" PAYMENT_HISTORY.ID AS 주문ID, ORDER_DATE AS 주문일, ORDER_STATUS AS 주문상태, " +
                       		" ORDER_COUNT AS 주문개수, ORDER_PRICE AS 주문가격, PRODUCT.NAME AS 상품명, MEMBER.NAME AS 유저명 " +
                       " FROM " +
                       		" PAYMENT_HISTORY, PRODUCT, MEMBER " +
                       " WHERE " +
                       		" PAYMENT_HISTORY.PRODUCT_ID = PRODUCT.ID AND " +
                       		" PAYMENT_HISTORY.MEMBER_ID = MEMBER.ID ";

        ResultSet rs=stmt.executeQuery(query);
        while(rs.next()) {
            %>
            	<tr>
            		<td><%=rs.getInt("주문ID") %></td>
            		<td><%=rs.getString("주문일") %></td>
            		<td><%=rs.getString("주문상태") %></td>
            		<td><%=rs.getInt("주문개수") %></td>
            		<td><%=rs.getInt("주문가격") %></td>
            		<td><%=rs.getString("상품명") %></td>
            		<td><%=rs.getString("유저명") %></td>
            	</tr>
            <%
        }
        con.close();
    }
    catch(Exception e)
    { 
        System.out.println(e);
    }
%>
</table>