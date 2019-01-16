<%@page import="com.shopping.model.Client"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>修改用户信息</title>
<style type="text/css">
	.form-signin{
		max-width: 500px;
		padding: 15px;
		margin: 0 auto;
	}
	input{
		margin-bottom: 5px;
	}
	select {
		margin-bottom: 5px;
	}
</style>
</head>
<body style="background-color: #F5FFFA">
	<div class="container" style="margin-top:2%;width: 550px;">
		<form action="/ssh_project/user/updateclient" method="post" class="form-signin" role="form">
			<% Client client=(Client)request.getAttribute("client"); %>
			<input type="hidden" name="client.cno" value="<%=client.getCno()%>">
			<input type="hidden" name="client.cclass" value="<%=client.getCclass()%>">
			<div class="alert alert-info" role="alert"><h3 align="center">修改用户信息</h3></div>
			用户名：<input type="text" class="form-control" placeholder="用户名" required autofocus name="client.cname" value="<%=client.getCname()%>">
			用户密码：<input type="password" class="form-control"  placeholder="用户密码" required name="client.cpassword" value="<%=client.getCpassword()%>">
			性别：<select class="form-control" name="client.csex">
				<option value="男" <%if(client.getCsex().equals("男")) out.print("selected='true'"); %>>男
				<option value="女" <%if(client.getCsex().equals("女")) out.print("selected='true'"); %>>女
			</select>
			年龄：<input type="text" class="form-control" placeholder="年龄" required autofocus name="client.cage" value="<%=client.getCage()%>">
			电话：<input type="text" class="form-control" placeholder="电话" required autofocus name="client.cphone" value="<%=client.getCphone()%>">
			收货地址：<input type="text" class="form-control" placeholder="收货地址" required autofocus name="client.caddress" value="<%=client.getCaddress()%>">
			<input type="submit" value="修改" class="btn btn-primary container" >
			<button type="button" class="btn btn-danger container" onclick="window.history.back()">返回上一级</button>
		</form>
	 </div>

	
	
	
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>