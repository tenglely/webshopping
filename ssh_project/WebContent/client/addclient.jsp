<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>注册新用户</title>
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
	<div class="container" style="margin-top: 7%;width: 550px;">
		<form action="/ssh_project/user/addclient" method="post" class="form-signin" role="form">
			<div class="alert alert-info" role="alert"><h3 align="center">新用户注册</h3></div>
			<input type="text" class="form-control" placeholder="用户名" required autofocus name="cname">
			<input type="password" class="form-control"  placeholder="用户密码" required name="cpassword">
			<select class="form-control" name="csex">
				<option value="男">男
				<option value="女">女
			</select>
			<input type="text" class="form-control" placeholder="年龄" required autofocus name="cage">
			<input type="text" class="form-control" placeholder="电话" required autofocus name="cphone">
			<input type="text" class="form-control" placeholder="收货地址" required autofocus name="caddress">
			<input type="submit" value="注册" class="btn btn-primary container" >
			<button type="button" class="btn btn-danger container" onclick="window.history.back()">返回上一级</button>
		</form>
	 </div>

	
	
	
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>