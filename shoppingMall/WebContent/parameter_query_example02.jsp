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
    <td>name</td>
    <td>price</td>
    <td>stock</td>
    <td>description</td>
    <td>origin</td>
</tr>
<%
String product_price = request.getParameter("product_price");
String product_price2 = request.getParameter("product_price2");
String product_stock = request.getParameter("product_stock");
String product_stock2 = request.getParameter("product_stock2");
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
    Statement stmt=con.createStatement();
    String query = " SELECT " +
    	    	   " product.name AS name, product.price AS price, product.stock AS stock, product.description AS description, product.origin AS origin " +
    			   " FROM " +
    	    	   " product ";
    
 	if (product_price != null) {
		query += " WHERE price >= " + product_price;
	}
	
	if (product_price2 != null) {
		query += " AND price <= " + product_price2;
	}
	
	if (product_stock != null) {
		query += " OR stock >= " + product_stock;
	}
	
	if (product_stock2 != null) {
		query += " AND stock <= " + product_stock2;
	}
	
	%> <%=query%> <%
    
    ResultSet rs=stmt.executeQuery(query);
    while(rs.next()) {
        %><tr><%
            %><td><%=rs.getString("name")%></td><%
            %><td><%=rs.getInt("price")%></td><%
            %><td><%=rs.getInt("stock")%></td><%
            %><td><%=rs.getString("description")%></td><%
            %><td><%=rs.getString("origin")%></td><%
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

<p>가격을 입력해주세요</p>
<input type="text" id="product_price" placeholder="얼마 이상">
~
<input type="text" id="product_price2" placeholder="얼마 이하">
<p>재고를 입력해주세요</p>
<input type="text" id="product_stock" placeholder="몇개 이상">
~
<input type="text" id="product_stock2" placeholder="몇개 이하">
<input type="button" onclick="click_search()" value="SEARCH">

<script>
    function click_search() {
    	const product_price = document.getElementById("product_price").value;
        const product_price2 = document.getElementById("product_price2").value;
        const product_stock = document.getElementById("product_stock").value;
        const product_stock2 = document.getElementById("product_stock2").value;
		
        redirect_with_get_params(product_price, product_price2, product_stock, product_stock2);
    }

    function redirect_with_get_params(product_price, product_price2, product_stock, product_stock2) {
        window.location.href = 'parameter_query_example02.jsp?product_price=' + product_price + '&product_price2=' + product_price2 + '&product_stock=' + product_stock + '&product_stock2=' + product_stock2;
    }
</script>
</body>
</html>