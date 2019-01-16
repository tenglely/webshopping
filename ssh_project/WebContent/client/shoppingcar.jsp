<%@page import="com.shopping.model.Photo"%>
<%@page import="com.shopping.model.Shop"%>
<%@page import="com.shopping.model.Buy"%>
<%@page import="java.util.List"%>
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
<title>购物车</title>
<style type="text/css">
	.img-responseven {
  			display: block;
  			height: 100px;
  			width: 200px;
		}
</style>
</head>
<body style="background-color: #F5FFFA;overflow-x:hidden;"> 
 <!-- 导航栏 -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
   <% 	int cno=0;
   		if(session.getAttribute("client")!=null){ 
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

	<% List<Buy> blist=(List<Buy>)session.getAttribute("blist");%>
	<% List<Shop> shopl=(List<Shop>)session.getAttribute("shopl");%>
	<% List<Photo> carphoto=(List<Photo>)session.getAttribute("carphoto");%>
	<br>
	<%  for(int i=0;i<blist.size();i++){ %>
	<div style="margin-left: 10%;width: 1500px;height: 100px;" class="row">
		<div class="card">
			<img class="img-responseven" alt="sa" src="/ssh_project/image/<%=carphoto.get(i).getPname()%>">
		</div>
		<div class="card w-50">

			<h3 class="text-secondary">&nbsp;&nbsp;<%=shopl.get(i).getShopname() %></h3>
			<h5 class="text-secondary">
				&nbsp;&nbsp;品牌:<%=shopl.get(i).getSfname() %>&nbsp;&nbsp;商品类型:<%=shopl.get(i).getShopclass()%>&nbsp;&nbsp;用户类型:<%=shopl.get(i).getSclass()%>&nbsp;&nbsp;<%=shopl.get(i).getSize() %>码&nbsp;&nbsp;&nbsp;
				数量:<%=blist.get(i).getNum() %>&nbsp;x&nbsp;<%=shopl.get(i).getPrice() %>元
			</h5>
			<h6 class="text-secondary">
			  &nbsp;&nbsp;送货地址:<%=blist.get(i).getAddress() %> &nbsp;&nbsp; &nbsp;&nbsp; 订单生成时间：<%=blist.get(i).getDate() %>
			  <p align="right"><br><a class="text-danger" data-toggle="modal" data-target="#example<%=i %>" href="#">修改地址</a>|<a class="text-danger" href="/ssh_project/user/deletecarbuy?bno=<%=blist.get(i).getBno()%>">删除订单</a></p>
			</h6>
		</div>
		<div class="card" style="width: 10rem;">
			<br>
			<h4 class="text-danger">&nbsp;&nbsp;待付:￥<%=blist.get(i).getPrice() %></h4>
			<a class="btn btn-primary text-light" href="/ssh_project/user/getonebuy?bno=<%=blist.get(i).getBno()%>&pay=yes">去支付</a>
			</div>
	</div><br><br>
<div class="modal fade" id="example<%=i %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">修改地址</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="/ssh_project/user/updatecarbuy" method="post">
      		<input type="hidden" name="bno" value="<%=blist.get(i).getBno()%>">
      <div class="modal-body">
       		收货地址: (如：xx省xx市xx县xx小区)
       		<input type="text" name="address" value="<%=blist.get(i).getAddress()%>" class="form-control">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
        <input type="submit" class="btn btn-primary" value="确定">
      </div>
      </form>
    </div>
  </div>
</div>
	<% } %>
	

	
	
	
	
	
	
	
	
	
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>