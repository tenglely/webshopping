<%@page import="com.shopping.model.Shop"%>
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
<title>导出商品信息</title>
</head>
<body>
	<% List<Shop> shoplist=(List<Shop>)session.getAttribute("outshop"); %>
	<table align="left" border="2">
		<thead>
			<tr>
			<th>商品编号</th><th>品牌名</th><th>商品名</th><th>商品类型</th><th>用户类型</th>
			<th>尺码</th><th>单价</th><th>库存</th><th>备注</th>
			<th>替换图片</th><th>重新编辑图文</th><th>操作</th><th>浏览</th>
			</tr>
		</thead>
		<tbody>
			<% for(Shop shop:shoplist){ %>
			<tr>
				<td align="center"><%=shop.getSno() %></td>
				<td align="center"><%=shop.getSfname() %></td>
				<td align="center"><%=shop.getShopname() %></td>
				<td align="center"><%=shop.getShopclass()%></td>
				<td align="center"><%=shop.getSclass()%></td>
				<td align="center"><%=shop.getSize() %></td>
				<td align="center"><%=shop.getPrice() %></td>
				<td align="center"><%=shop.getCount() %></td>
				<td align="center"><%=shop.getRemark() %></td>
			</tr>
			<% } %>
		</tbody>
	</table>
</body>
</html>