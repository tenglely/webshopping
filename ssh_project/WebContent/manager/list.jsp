<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
		
		<div class="list-group">
		
			<nav class="navbar navbar-light bg-light">
  				<a class="navbar-brand text-primary" href="#">操作列表</a>
			</nav>
  			<a href="/ssh_project/manager/addshop.jsp" class="list-group-item list-group-item-action" target="show">添加商品</a>
  			<a href="/ssh_project/user/seeallclient" class="list-group-item list-group-item-action" target="show">管理用户</a>
  			<a href="/ssh_project/user/seeallshop" class="list-group-item list-group-item-action" target="show">管理商品</a>
  			<a href="/ssh_project/user/getallBuy" class="list-group-item list-group-item-action" target="show">管理订单</a>
  			<a href="/ssh_project/user/outputshop" class="list-group-item list-group-item-action" target="_top">数据报表</a>
    		<button id="btnGroupDrop1" type="button" class="list-group-item list-group-item-action" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
     			商城首页设置
    		</button>
    		<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
      			<a href="/ssh_project/manager/setindex.jsp" class="dropdown-item" target="show">设置首页滚动图片</a>
      			<a class="dropdown-item" href="/ssh_project/user/seelist" target="show">设置首页侧列表</a>
    		</div>
  			
		</div>
		
		
		
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
		
</body>
</html>