<!-- #4. 
MEMBER 테이블과 PAYMENT_HISTORY 테이블을 이용하여 인원별 구매 금액을 테이블 형태로 출력하여라
필요한 정보 : 구매자명 구매금액

#5.
PURCHASE_LOG 테이블을 새로 만들어라
CREATE TABLE PURCHASE_LOG (
    ID NUMBER NOT NULL,
    LOG VARCHAR2(300),
    CONSTRAINT PURCHASE_LOG_PK PRIMARY KEY (id)
)

#6.
PAYMENT_HISTORY, USER, PRODUCT 테이블을 이용하여 PURCHASE_LOG 테이블의 값을 추가하여라
ID 는 순차적으로 증가하는 ID,
LOG 에는 "XXX님이 YYY상품 NNN개를 ZZZ원에 구매하셨습니다" 와 같이 
누가, 어떤 상품을, 몇개를, 얼마에 구매하였는지에 대한 데이터이다
PAYMENT_HISTORY 의 모든 로우를 참조하여 작성하여라

예) 
PAYMENT_HISTORY
ID  ORDER_DATE  ORDER_STATUS    ORDER_COUNT ORDER_PRICE PRODUCT_ID  MEMBER_ID   ADDRESS
0    20/01/24    PAYMENT_WAITING    2           20000000000    8            12          경기도

MEMBER
ID  PASSWORD    NAME    EMAIL           PHONE           ADDRESS       AGE
12    1212        이건주    rjswn@gmail.com 010-8888-8888    경기도 고양시    17

PRODUCT
ID  CATEGORY_ID NAME           PRICE   STOCK   DESCRIPTION           ORIGIN
8    1           아이패드 프로    1000000    55      역대급 성능 미니 콤퓨타    캘리포니아

PURCHASE_LOG 
ID LOG 
0  이건주님이 아이패드 프로 상품 55개를 20000000000원에 구매하셨습니다 -->
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
	try {
    	Class.forName("oracle.jdbc.driver.OracleDriver");

    	Connection con=DriverManager.getConnection(
    	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");

    	Statement stmt=con.createStatement();
    	Statement insert_stmt=con.createStatement();

    	String query = "SELECT " +
    		    	   "member.name AS member_name, product.name AS product_name, product.stock AS product_stock, payment_history.order_price AS payment_history_order_price " +
    				   "FROM " +
    		    	   "member, payment_history, product " +    		    	  
    				   "WHERE " +
    		    	   "payment_history.member_id = member.id AND " +
    				   "payment_history.product_id = product.id ";
    	
    	ResultSet rs=stmt.executeQuery(query);
    	for (int i = 0; rs.next(); i++) {
    		query = "INSERT INTO purchase_log VALUES(%d, '%s님이  %s상품  %d개를  %d원에 구매하셨습니다')";
    		
    		insert_stmt.executeQuery(String.format(query, i, rs.getString("member_name"), rs.getString("product_name"), rs.getInt("product_stock"), rs.getInt("payment_history_order_price")));
    	}

	    con.commit();
    	con.close();
 
    }catch(Exception e){ System.out.println(e);}
	%>
</body>
</html>