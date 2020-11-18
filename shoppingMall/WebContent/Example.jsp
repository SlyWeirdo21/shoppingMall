<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>query update</title>
</head>
<body>

<%
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
    Statement stmt=con.createStatement();
    Statement update_stmt=con.createStatement();
    
    String select_query = "SELECT ID, COL1, COL2, COL3, COL4 FROM MORUGATSUYO";
    
    ResultSet rs=stmt.executeQuery(select_query);
    /* for (int i = 0; i < 100; i++) */
    while(rs.next()) {
    	int COL1 = rs.getInt("COL1");
    	int COL2 = rs.getInt("COL2");
    	int COL3 = rs.getInt("COL3");
    	int COL4 = rs.getInt("COL4");
    	int ID = rs.getInt("ID");
    	
    	/* String query = "INSERT INTO MORUGATSUYO(id, COL1, COL2, COL3, COL4) VALUES(" + i + (int)(Math.random() * 100) + "," + (int)(Math.random() * 100) + "," +(int)(Math.random() * 100) + "," + (int)(Math.random() * 100) + ")"; */
    	String update_query = "UPDATE MORUGATSUYO SET AVG_COL = %d WHERE ID = %d";
		System.out.println(String.format(update_query, (COL1 + COL2 + COL3 + COL4) / 4, ID));
		
		/* update_stmt.execute(String.format()); */
    	
    	
		/* System.out.println(query); */
		
		update_stmt.executeQuery(String.format(update_query, (COL1 + COL2 + COL3 + COL4) / 4, ID));
    }	
    
    con.commit();
    con.close();
}
catch(Exception e)
{ 
    System.out.println(e);
}
%>

</body>
</html>