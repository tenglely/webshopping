<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<style type="text/css">
	.form-signin{
		max-width: 330px;
		padding: 15px;
		margin: 0 auto;
	}
	input{
		margin-bottom: 3px;
	}
</style>

<title>用户登陆界面</title>
</head>
<body style="background-color: #F5FFFA">
	<div class="container" style="margin-top: 10%;width: 450px; ">	
		<form action="/ssh_project/user/clientlogin" method="post" class="form-signin" role="form">
			<h3 align="center">欢迎登陆商城</h3>
			<% if(request.getAttribute("key")!=null) out.print("<h4 class='text-danger'>"+request.getAttribute("key")+"</h4>");%>
			<input type="text" class="form-control" placeholder="用户名" required autofocus name="cname">
			<input type="password" class="form-control"  placeholder="密码" required name="cpassword">
			<input type="submit" value="提交" class="btn btn-primary container" >
			<a href="/ssh_project/client/addclient.jsp">新用户注册</a>&nbsp;&nbsp;<a  href="/ssh_project/index.jsp">商城首页</a>
		</form>
	</div>
	
	
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>