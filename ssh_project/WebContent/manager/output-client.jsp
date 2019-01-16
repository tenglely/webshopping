<%@page import="com.shopping.model.Client"%>
<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="UTF-8"%>
<%@ page contentType="application/msexcel" %>
<%
   //response.setHeader("Content-disposition","inline; filename=videos.xls");
   response.setHeader("Content-disposition","attachment; filename=test.xls");
   //以上这行设定传送到前端浏览器时的档名为test.xls
   //就是靠这一行，让前端浏览器以为接收到一个excel档 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>导出用户信息</title>
</head>
<body>
	<% List<Client> clientlist=(List<Client>)session.getAttribute("outclient"); %>
	<table align="left" border="2">
		<thead>
		  <tr>
			<th>用户编号</th><th>用户名</th><th>用户密码</th>
			<th>用户类型</th><th>性别</th><th>年龄</th>
			<th>用户电话</th><th>收货地址</th>
		 </tr>
		</thead>
		<tbody>
			<% for(Client client:clientlist){ %>
			<tr>
				<td align="center"><%=client.getCno() %></td>
				<td align="center"><%=client.getCname() %></td>
				<td align="center"><%=client.getCpassword() %></td>
				<td align="center"><%=client.getCclass()%></td>
				<td align="center"><%=client.getCsex() %></td>
				<td align="center"><%=client.getCage() %></td>
				<td align="center"><%=client.getCphone() %></td>
				<td align="center"><%=client.getCaddress() %></td>
			<% } %>
		</tbody>
	
	</table>
</body>
</html>