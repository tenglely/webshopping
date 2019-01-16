<%@page import="com.shopping.model.Client"%>
<%@page import="com.shopping.model.Shop"%>
<%@page import="com.shopping.model.Photo"%>
<%@page import="com.shopping.model.Message"%>
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
<title>浏览商品界面</title>
<style type="text/css">
		 .img-responsive {
  			display: block;
  			height: 450px;
  			max-width: 100%;
		}
</style>
<script type="text/javascript">
	function doAction(value) {
		document.clientfrom.action=value;
		clientfrom.submit();
	}
</script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
   <%   int cno=0;
   		if(session.getAttribute("client")!=null&&session.getAttribute("client")!=""){ 
   			Client client=(Client)session.getAttribute("client");
   			cno=client.getCno();
   %>
   <a class="navbar-brand text-info" href="/ssh_project/user/findoneclient?cno=<%=client.getCno()%>"><%=client.getCname() %></a>
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
	<center>
	<% 
		List<Shop> shoplist=(List<Shop>)session.getAttribute("shoplist");
		List<Photo> photolist=(List<Photo>)session.getAttribute("photolist");
		Message message=(Message)session.getAttribute("message");
	%>
	<table class="table" style="margin: auto;">
	<tr>
	<td colspan="2">
	
  <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner card w-100">
  	<% 
  		int i=0;
  		for(Photo photo:photolist){ 
  			if(i==0){
  		
  	%>
    <div class="carousel-item active" align="right">
      <img class="img-responsive" src="<%=request.getContextPath() %>/image/<%=photo.getPname() %>" alt="First slide">
    </div>
    <%  }else{ %>
    <div class="carousel-item" align="right">
      <img class="img-responsive" src="<%=request.getContextPath() %>/image/<%=photo.getPname() %>" alt="<%=i+1 %> slide">
    </div>
    <% } 
  		i++;	
  		}%>
  		
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
  </div>
</div>
	</td>
	<td style="width: 750px;">
		<% 
			Shop s=shoplist.get(0);
				
		%>
		<div>
		<form action="" name="clientfrom" method="post">
		<% Client c=(Client)session.getAttribute("client");
			if(c!=null){
		%>
		<input type="hidden" name="cno" value="<%=c.getCno()%>">
		<input type="hidden" name="price" value="<%=s.getPrice()%>">
		<input type="hidden" name="address" value="<%=c.getCaddress()%>">
		<% } %>
		<table>
		<tr><th>
		<h3><%=s.getShopname() %></h3>
		</th></tr><tr><th>
		<h5 class="text-secondary">品牌：<%=s.getSfname() %></h5>
		</th></tr><tr><td>
		<h5 class="text-danger">价格: <%=s.getPrice()%>&nbsp;元</h5>
		</td></tr><tr><td>
		<h5 class="text-secondary">商品类型: <%=s.getShopclass()%>  <%=s.getSclass() %></h5>
		</td></tr><tr><td>
		<h5>尺码:</h5>
			 <select name="size" class="form-control">
				<% for(Shop shop:shoplist) {%>
				<option value="<%=shop.getSize()%>"><%=shop.getSize()%>
				<% } %>
			 </select>
		</td></tr><tr><td>
		购买数量: <input type="text" name="num" value="1" style="border:none;" >
		</td></tr><tr><td>
		<% if(cno==0){
		%>
		<h3 class="text-danger">购买请登录</h3><% }else{ %>
		<button class="btn btn-danger" onclick="doAction('/ssh_project/user/addshoppingcar')">添加到购物车</button>&nbsp;
		<button class="btn btn-primary" onclick="doAction('/ssh_project/user/paybuy')">支付</button>
		<% } %>
		</td></tr>
		</table>
		</form>
		</div>
	</td>
	</tr>
	<tr>
		<td align="center" colspan="3"><h5>--------------------------------------------------------商品介绍--------------------------------------------------------</h5></td>
	</tr>
	<tr>
		<td align="center" colspan="3">
			<% out.print(message.getMessage()); %>
		</td>
	</tr>
	</table>

	</center>
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>