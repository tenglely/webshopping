<%@page import="com.shopping.model.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>设置首页侧列表</title>
<style type="text/css">
	.form-signin{
		max-width: 330px;
		padding: 15px;
		margin: 0 auto;
	}
</style>
</head>
<body>
	<div class="container" style="width: 950px; ">
	<%
		Message one=(Message)session.getAttribute("one");
		Message two=(Message)session.getAttribute("two");
		Message three=(Message)session.getAttribute("three");
		Message four=(Message)session.getAttribute("four");
		Message five=(Message)session.getAttribute("five");
	%>
	<form action="/ssh_project/user/updatelist" method="post">
		<table class="table">
				<tr><th class="alert alert-primary" role="alert" colspan="3"><h4>编辑首页列表栏</h4></th></tr>
				<tr>
					<td align="center"><h4>一级列表</h4></td>
					<td align="center"><h4>二级列表</h4></td>
					<td><input type="submit" value="编辑完成" class="btn btn-primary container"></td>
				</tr>
				<tr>
					<td align="right">
						<input type="text" value="热门商品" class="form-control form-signin" readonly="true"> 
					</td>
					<td>
						<textarea rows="4" cols="40" name="one"><%=one.getMessage() %></textarea>
					</td>
					<td>
						<h5 class="text-danger">(请务必填写正确,不然在首页不会显示错误项)</h5>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="text" value="名牌" class="form-control form-signin" readonly="true">
					</td>
					<td>
						<textarea rows="4" cols="40" name="two"><%=two.getMessage() %></textarea>
					</td>
				<tr>
					<td align="right">
						<input type="text" value="鞋类" class="form-control form-signin" readonly="true">
					</td>
					<td>
						<textarea rows="4" cols="40" name="three"><%=three.getMessage() %></textarea>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="text" value="男鞋" class="form-control form-signin" readonly="true">
					</td>
					<td>
						<textarea rows="4" cols="40" name="four"><%=four.getMessage() %></textarea>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="text" value="女鞋" class="form-control form-signin" readonly="true">
					</td>
					<td>
						<textarea rows="4" cols="40" name="five"><%=five.getMessage() %></textarea>
					</td>
				</tr>
				
		</table>
	
	</form>
	</div>
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>