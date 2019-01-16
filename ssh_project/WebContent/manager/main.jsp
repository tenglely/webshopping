<%@page import="com.shopping.model.Buy"%>
<%@page import="com.shopping.model.Client"%>
<%@page import="com.shopping.model.Shop"%>
<%@page import="java.util.List"%>
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
<body style="background-color:hsla(185,65%,75%,0.1);">
	<br><br>
	<% List<Shop> shoplist=(List<Shop>)session.getAttribute("outshop"); %>
	<% List<Client> clientlist=(List<Client>)session.getAttribute("outclient"); %>
	<% List<Buy> buylist=(List<Buy>)session.getAttribute("outbuy"); 
	   int sum=0;
	   for(Buy buy:buylist){
		   if(buy.getBuystate().equals("已支付"))
		   		sum+=buy.getPrice();
	   }
	%>
	<div style="margin:auto;width: 900px;height: 200px;" class="row">
		<div class="card" style="width: 18rem;background-color:hsla(120,65%,75%,0.3);">
			<br>
			<h3 class="text-info">&nbsp;&nbsp;已注册用户：<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=clientlist.size() %>位</h3>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="card text-primary" style="width: 18rem;background-color:hsla(0,65%,75%,0.3);">
			<br>
			<h3>&nbsp;&nbsp;商城总入账：<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=sum %>元</h3>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="card text-danger" style="width: 18rem;background-color:hsla(240,65%,75%,0.3);">
			<br>
			<h3>&nbsp;&nbsp;共有商品类型：<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=shoplist.size() %>种</h3>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	<div style="margin:auto;width: 900px;height: 130px;">
		<div class="card text-danger w-100" style="background-color:hsla(280,65%,75%,0.3);">
			<div class="dropdown ">
  				<button class="btn btn-primary dropdown-toggle container" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    				导出数据报表
 				 </button>
 		    <div class="dropdown-menu container" aria-labelledby="dropdownMenuButton">
   				 <a class="dropdown-item" href="/ssh_project/manager/output-client.jsp" ><h4 align="center">导出所有用户信息</h4></a>
  				 <a class="dropdown-item" href="/ssh_project/manager/output-shop.jsp"><h4 align="center">导出所有商品信息</h4></a>
    			 <a class="dropdown-item" href="/ssh_project/manager/output-buy.jsp"><h4 align="center">导出所有订单信息</h4></a>
  			</div>
			</div>
		</div>
	</div>
	
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>