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

<table border = "1">
<tr>
    <td>phone</td>
    <td>email</td>
    <td>name</td>
    <td>price</td>
    <td>id</td>
    <td>count</td>
</tr>
<%
String phone_number = request.getParameter("phone_number");
String email = request.getParameter("email");
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
    Statement stmt=con.createStatement();
    String query = " SELECT " +
    	    	   " member.phone AS phone, member.email AS email, member.name AS name, payment_history.order_price AS price, payment_history.product_id AS id, payment_history.order_count AS count " +
    	           " FROM " +
    	           " payment_history, member " +
    	           " WHERE " +
    	           " payment_history.member_id = member.id ";
    
	if (phone_number != null) {
		query += " AND phone like '%" + phone_number + "'";
	}
	
	if (email != null) {
		query += " AND email like '%" + email + "%'";
	}
	
	%> <%=query%> <%
    
    ResultSet rs=stmt.executeQuery(query);
    while(rs.next()) {
        %><tr><%
            %><td><%=rs.getString("phone")%></td><%
            %><td><%=rs.getString("email")%></td><%
            %><td><%=rs.getString("name")%></td><%
            %><td><%=rs.getInt("price")%></td><%
            %><td><%=rs.getInt("id")%></td><%
            %><td><%=rs.getInt("count")%></td><%
        %><tr><%
    }
	
    con.commit();
    con.close();

}
catch(Exception e)
{ 
    System.out.println(e);
}
%>
</table>

<p>전화번호 뒷 4자리를 입력하여 주세요</p>
<input type="text" id="phone_number">
<p>찾으실 이메일을 입력하여 주세요</p>
<input type="text" id="email">
<input type="button" onclick="click_search()" value="SEARCH">

<script>
    function click_search() {
    	const email = document.getElementById("email").value;
        const phone_number = document.getElementById("phone_number").value;

        redirect_with_get_params(phone_number, email);
    }

    function redirect_with_get_params(phone_number, email) {
        window.location.href = 'parameter_query_example01.jsp?phone_number=' + phone_number + '&email=' + email;
    }
</script>
</body>
</html>