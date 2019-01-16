<%@page import="com.shopping.model.*"%>
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
<title>导出订单信息</title>
</head>
<body>
	<% List<Shop> shoplist=(List<Shop>)session.getAttribute("outshop"); %>
	<% List<Client> clientlist=(List<Client>)session.getAttribute("outclient"); %>
	<% List<Buy> buylist=(List<Buy>)session.getAttribute("outbuy"); %>
	<table align="left" border="2">
		<thead>
			<tr>
			<th>订单编号</th><th>用户姓名</th><th>用户联系电话</th><th>品牌</th><th>商品名</th>
			<th>商品类型</th><th>用户类型</th><th>尺码</th><th>购买数量</th>
			<th>总价</th><th>收货地址</th><th>日期</th><th>购买状态</th>
			</tr>
		</thead>
		<tbody>
			<% for(Buy buy:buylist){ 
					for(Shop shop:shoplist){
						if(shop.getSno()==buy.getSno()){
							for(Client client:clientlist){
								if(client.getCno()==buy.getCno()){
								
			%>
				 <tr>
				 	<td align="center"><%=buy.getBno() %></td>
				 	<td align="center"><%=client.getCname() %></td>
				 	<td align="center"><%=client.getCphone() %></td>
				 	<td align="center"><%=shop.getSfname() %></td>
				 	<td align="center"><%=shop.getShopname() %></td>
				 	<td align="center"><%=shop.getShopclass() %></td>
				 	<td align="center"><%=shop.getSclass() %></td>
				 	<td align="center"><%=shop.getSize() %></td>
				 	<td align="center"><%=buy.getNum() %></td>
				 	<td align="center"><%=buy.getPrice() %></td>
				 	<td align="center"><%=buy.getAddress() %></td>
				 	<td align="center"><%=buy.getDate() %></td>
				 	<td align="center"><%=buy.getBuystate() %></td>
				 </tr>
			<% 				}
						}
					}
		
				}
			} %>
		</tbody>
	</table>
</body>
</html>