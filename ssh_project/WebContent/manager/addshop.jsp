<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>添加商品信息</title>
</head>
<body>
	<form action="/ssh_project/user/addshop" method="post">
		<table  class="table">
			<thead>
			<tr><th class="alert alert-primary" role="alert" colspan="3">录入商品信息</th></tr>
			</thead>
			<tr>
				<td align="right">输入品牌名:</td>
				<td><input type="text" name="sfname"></td>
			</tr>
			<tr>
				<td align="right">输入商品名:</td>
				<td><input type="text" name="shopname"></td>
			</tr>
			<tr>
				<td align="right">选择商品类型:</td>
				<td>
					<select name="shopclass">
						<option value="休闲鞋">休闲鞋</option>
						<option value="篮球鞋">篮球鞋</option>
						<option value="跑步鞋">跑步鞋</option>
						<option value="运动时尚鞋">运动时尚鞋</option>
						<option value="凉鞋拖鞋">凉鞋拖鞋</option>
						<option value="户外鞋">户外鞋</option>
						<option value="皮鞋">皮鞋</option>
						<option value="高跟鞋">高跟鞋</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right">选择用户类型:</td>
				<td>
					<select name="sclass">
						<option value="男用">男用</option>
						<option value="女用">女用</option>
						<option value="男女混用">男女混用</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right">输入商品单价:</td>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td align="right">勾选尺码并填写库存数量:</td>
				<td>
					尺码: 36<input type="checkbox" name="size" value="36">&nbsp;&nbsp;库存: <input type="text" name="six" value="0"><br>
					尺码: 37<input type="checkbox" name="size" value="37">&nbsp;&nbsp;库存: <input type="text" name="seven" value="0"><br>
					尺码: 38<input type="checkbox" name="size" value="38">&nbsp;&nbsp;库存: <input type="text" name="eight" value="0"><br>
					尺码: 39<input type="checkbox" name="size" value="39">&nbsp;&nbsp;库存: <input type="text" name="night" value="0"><br>
					尺码: 40<input type="checkbox" name="size" value="40">&nbsp;&nbsp;库存: <input type="text" name="zero" value="0"><br>
					尺码: 41<input type="checkbox" name="size" value="41">&nbsp;&nbsp;库存: <input type="text" name="one" value="0"><br>
					尺码: 42<input type="checkbox" name="size" value="42">&nbsp;&nbsp;库存: <input type="text" name="two" value="0"><br>
				</td>
			</tr>
			<tr>
				<td align="right">备注:</td>
				<td>
					 <input type="text" name="remark">
				</td>
			</tr>
			<tr >
				<td colspan="2" align="center">
					<input type="submit" class="btn btn-primary" value="下一步">
				</td>
			</tr>
		</table>
	</form>
	
	
	
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
		
</body>
</html>