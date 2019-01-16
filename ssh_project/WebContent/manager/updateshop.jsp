<%@page import="com.shopping.model.Shop"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>修改商品</title>
</head>
<body>
		<form action="user/updateshop" method="post">
			<input type="hidden" name="shopname" value="${shop.shopname }">
			<div class="alert alert-primary" role="alert" align="center">
 						<h4>修改商品信息</h4>
			</div>
			<table class="table" style="margin-left: 100px;">
				
				<tr>
					<td align="right">商品编号：</td>
					<td><input type="text" name="shop.sno" value="${shop.sno }" readonly="true"></td>
				</tr>
				<tr>
					<td align="right">品牌名：</td>
					<td><input type="text" name="shop.sfname" value="${shop.sfname }"></td>
				</tr>
				<tr>
					<td align="right">商品名：</td>
					<td><input type="text" name="shop.shopname" value="${shop.shopname }"></td>
				</tr>
				<tr>
					<td align="right">商品种类：</td>
					<td><select name="shop.shopclass">
						<% Shop s=(Shop)request.getAttribute("shop");%>
						<option value="休闲鞋" <% if(s.getShopclass().equals("休闲鞋")) out.print("selected='true'");%>>休闲鞋</option>
						<option value="篮球鞋" <% if(s.getShopclass().equals("篮球鞋")) out.print("selected='true'");%>>篮球鞋</option>
						<option value="跑步鞋" <% if(s.getShopclass().equals("跑步鞋")) out.print("selected='true'");%>>跑步鞋</option>
						<option value="运动时尚鞋" <% if(s.getShopclass().equals("运动时尚鞋")) out.print("selected='true'");%>>运动时尚鞋</option>
						<option value="凉鞋拖鞋" <% if(s.getShopclass().equals("凉鞋拖鞋")) out.print("selected='true'");%>>凉鞋拖鞋</option>
						<option value="户外鞋" <% if(s.getShopclass().equals("户外鞋")) out.print("selected='true'");%>>户外鞋</option>
						<option value="皮鞋" <% if(s.getShopclass().equals("皮鞋")) out.print("selected='true'");%>>皮鞋</option>
						<option value="高跟鞋" <% if(s.getShopclass().equals("高跟鞋")) out.print("selected='true'");%>>高跟鞋</option>
					</select>
					</td>
				</tr>
				<tr>
					<td align="right">用户类型：</td>
					<td>
						<select name="shop.sclass">
							<option value="男用" <% if(s.getShopclass().equals("男用")) out.print("selected='true'");%>>男用</option>
							<option value="女用" <% if(s.getShopclass().equals("女用")) out.print("selected='true'");%>>女用</option>
							<option value="男女混用" <% if(s.getShopclass().equals("男女混用")) out.print("selected='true'");%>>男女混用</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">尺码：</td>
					<td><input type="text" name="shop.size" value="${shop.size }" readonly="true"></td>
				</tr>
				<tr>
					<td align="right">单价：</td>
					<td><input type="text" name="shop.price" value="${shop.price }"></td>
				</tr>
				<input type="hidden" name="shop.count" value="${shop.count }">
				<tr>
					<td align="right">备注：</td>
					<td><input type="text" name="shop.remark" value="${shop.remark }"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="修改" class="btn btn-primary"></td>
				</tr>
			</table>
		</form>
		<form action="user/updateshopcount" method="post">
			<table class="table" style="margin-left: 100px;">
				<% Shop shop=(Shop)request.getAttribute("shop"); %>
				<input type="hidden" name="sno" value="<%=shop.getSno()%>">
				<tr>
					<td align="right">修改库存：</td>
					<td><input type="text" name="count" value="<%=shop.getCount()%>"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="修改库存" class="btn btn-primary"></td>
				</tr>
			</table>
		</form>
		
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>