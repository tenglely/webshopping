<%@page import="com.shopping.model.Client"%>
<%@page import="com.shopping.model.Shop"%>
<%@page import="com.shopping.model.Buy"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>支付宝电脑网站支付</title>
</head>
<body style="background-color: #F5FFFA;overflow-x:hidden;">
<!-- 导航栏 -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
   <% 	int cno=0;
   		if(session.getAttribute("client")!=null){ 
   			Client client=(Client)session.getAttribute("client");
   			cno=client.getCno();
   %>
   <a class="navbar-brand text-info" href="#"><%=client.getCname() %></a>
   <a class="navbar-brand" href="/ssh_project/client/login.jsp" style="font-size: 18px;">注销</a>
   <% }else{ %>
  <a class="navbar-brand" href="/ssh_project/client/login.jsp">注册/登录</a>
  <% } %>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/ssh_project/index.jsp">商城首页<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/ssh_project/user/seeshoppingcar?cno=<%=cno%>&value=buycar">购物车</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="/ssh_project/user/seeshoppingcar?cno=<%=cno%>&value=history">历史记录</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="搜索商品" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">查找商品</button>
    </form>
  </div>
</nav>

	<% Buy buy=(Buy)session.getAttribute("paybuy");%>
	<% Shop shop=(Shop)request.getAttribute("shop");%>
	<div class="container" style="margin-top: 4%;width: 550px;">
		<div class="card">
		  <form name=alipayment action="/ssh_project/pay/alipay.trade.page.pay.jsp" method=post>
		  	<table class="table">
		  		<thead>
		  			<tr><th class="alert alert-primary" role="alert" colspan="2">支付</th></tr>
		  		</thead>
		  		<tr>
		  			<td align="right">商品订单号 ：</td>
		  			<td><input id="WIDout_trade_no" name="WIDout_trade_no"/></td>
		  		</tr>
		  		<tr>
		  			<td align="right">商品名称 ：</td>
		  			<td><input name="WIDsubject" type="text" value="<%=shop.getShopname()%>"/></td>
		  		</tr>
		  		<tr>
		  			<td align="right">付款金额 ：</td>
		  			<td><input name="WIDtotal_amount" type="text" value="<%=buy.getPrice()%>"/></td>
		  		</tr>
		  		<tr>
		  			<td align="right">商品描述：</td>
		  			<% String body="品牌："+shop.getSfname()+"<br>商品类型："+shop.getShopclass()+"<br>尺码："+shop.getSize() ;%>
		  			<td>
		  					品牌：<%=shop.getSfname() %><br>
		  					商品类型：<%=shop.getShopclass()%><br>
		  					尺码：<%=shop.getSize()%><br>
		  				<% Client c=(Client)session.getAttribute("client");
							if(c!=null){
								out.print("用户："+c.getCname()+"<br>");
								out.print("联系电话："+c.getCphone()+"<br>");
							}
						%>	
						收货地址:<%=buy.getAddress()%>
		  			</td>
		  		</tr>
		  		<tr>
		  			<td colspan="2" align="center">
		  				<input type="submit" value="支付" class="btn btn-primary"> 
		  			</td>
		  		</tr>
		  	</table>
		  	<input id="WIDbody" name="WIDbody" type="hidden"/>
		  </form>
		</div>	
	</div>
	
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
<script language="javascript">
	
	
	function GetDateNow() {
		var vNow = new Date();
		var sNow = "";
		sNow += String(vNow.getFullYear());
		sNow += String(vNow.getMonth() + 1);
		sNow += String(vNow.getDate());
		sNow += String(vNow.getHours());
		sNow += String(vNow.getMinutes());
		sNow += String(vNow.getSeconds());
		sNow += String(vNow.getMilliseconds());
		document.getElementById("WIDout_trade_no").value =  sNow;
		//document.getElementById("WIDsubject").value = "腾";
		document.getElementById("WIDtotal_amount").value = "12999";
	}
	GetDateNow();
</script>
</html>