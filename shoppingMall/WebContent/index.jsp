<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
</head>
<body>
	<% String a = "스트링"; %>
	<a> A의 글자는?:  <%=a %> </a>
	<br>
	<%
	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 3-i; j++) {
			 %><a>&nbsp</a><% 
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
		%><a>&nbsp</a><% 
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
</body>
</html>