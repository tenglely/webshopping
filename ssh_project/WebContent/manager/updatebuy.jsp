<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>修改订单</title>
</head>
<body>
		<form action="user/updatebuy" method="post">
		<input type="hidden" name="buy.id" value="${buy.id}">
		<table class="table">
			<tr>
				<th colspan="2">
					<div class="alert alert-primary" role="alert">
 						修改订单信息
					</div>
				</th>
			</tr>
			<tr>
				<td align="right">订单编号：</td>
				<td><input type="text" name="buy.bno" value="${buy.bno }"></td>
			</tr>
			<tr>
				<td align="right">用户编号：</td>
				<td><input type="text" name="buy.cno" value="${buy.cno }"></td>
			</tr>
			<tr>
				<td align="right">商品编号：</td>
				<td><input type="text" name="buy.sno" value="${buy.sno }"></td>
			</tr>
			<tr>
				<td align="right">购买数量：</td>
				<td><input type="text" name="buy.num" value="${buy.num }"></td>
			</tr>
			<tr>
				<td align="right">总价：</td>
				<td><input type="text" name="buy.price" value="${buy.price }"></td>
			</tr>
			<tr>
				<td align="right">地址：</td>
				<td><input type="text" name="buy.address" value="${buy.address }"></td>
			</tr>
			<tr>
				<td align="right">日期：</td>
				<td><input type="text" name="buy.date" value="${buy.date }"></td>
			</tr>
			<tr>
				<td align="right">购买状态：</td>
				<td><input type="text" name="buy.buystate" value="${buy.buystate }"></td>
			</tr>
			<tr>
				<td align="right">出货状态：</td>
				<td><input type="text" name="buy.shipment" value="${buy.shipment }"></td>
			</tr>
			<tr>
				<td align="right">快递编号：</td>
				<td><input type="text" name="buy.couriernumber" value="${buy.couriernumber }"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="修改" class="btn btn-primary"></td>
			</tr>
		</table>
		</form>
		
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>