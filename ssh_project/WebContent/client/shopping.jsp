<%@page import="com.shopping.model.Shop"%>
<%@page import="com.shopping.model.Client"%>
<%@page import="com.shopping.model.Photo"%>
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
<style type="text/css">
        .dropdown-submenu {
            position: relative;
        }
        .dropdown-submenu > .dropdown-menu {
            top: 0;
            left: 100%;
            margin-top: -6px;
            margin-left: -1px;
            -webkit-border-radius: 0 6px 6px 6px;
            -moz-border-radius: 0 6px 6px;
            border-radius: 0 6px 6px 6px;
        }
        .dropdown-submenu:hover > .dropdown-menu {
            display: block;
        }
        .dropdown-submenu > a:after {
            display: block;
            content: " ";
            float: right;
            width: 0;
            height: 0;
            border-color: transparent;
            border-style: solid;
            border-width: 5px 0 5px 5px;
            border-left-color: #ccc;
            margin-top: 5px;
            margin-right: -10px;
        }
        .dropdown-submenu:hover > a:after {
            border-left-color: #fff;
        }
        .dropdown-submenu.pull-left {
            float: none;
        }
        .dropdown-submenu.pull-left > .dropdown-menu {
            left: -100%;
            margin-left: 10px;
            -webkit-border-radius: 6px 0 6px 6px;
            -moz-border-radius: 6px 0 6px 6px;
            border-radius: 6px 0 6px 6px;
        }
        .img-responsive {
  			display: block;
  			height: 450px;
  			max-width: 100%;
		}
         .img-responseven {
  			display: block;
  			height: 250px;
  			max-width: 100%;
		}
    </style>

<title>商城首页</title>
</head>
<body  style="overflow-x:hidden;background-color: #F5FFFA">
   <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
   <% 	 int cno=0;
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
	<% List<String> ml1=(List<String>)session.getAttribute("ml1");%>
	<% List<String> ml2=(List<String>)session.getAttribute("ml2");%>
	<% List<String> ml3=(List<String>)session.getAttribute("ml3");%>
	<% List<String> ml4=(List<String>)session.getAttribute("ml4");%>
	<% List<String> ml5=(List<String>)session.getAttribute("ml5");%>
  	<!-- 商品列表及图片栏 -->
	
	<div style="margin-left: 70px;width: 1500px;height: 450px;" class="row">
		<div class="card" style="width: 18rem;">
  			<ul class="list-group">
  				<li class="dropdown-submenu list-group-item">
  					<a href="#">热门商品</a>
             		<ul class="dropdown-menu pull-right">
             			<% for(String s:ml1){ %>
                  		<li class="list-group-item"><a href="/ssh_project/user/seeoneshop?shopname=<%=s %>"><%=s %></a></li>
                 		<% } %>
                    </ul>
  				</li>
  				<li class="dropdown-submenu list-group-item">
  					<a href="#">名牌</a>
             		<ul class="dropdown-menu pull-right">
                  		<% for(String s:ml2){ %>
                  		<li class="list-group-item"><a href="/ssh_project/user/findlistbysfname?sfname=<%=s %>"><%=s %></a></li>
                 		<% } %>
                    </ul>
  				</li>
  				<li class="dropdown-submenu list-group-item">
  					<a href="#">鞋类</a>
             		<ul class="dropdown-menu pull-right">
                  		<% for(String s:ml3){ %>
                  		<li class="list-group-item"><a href="/ssh_project/user/findlistbyshopclass?shopclass=<%=s %>"><%=s %></a></li>
                 		<% } %>
                    </ul>
  				</li>
  				<li class="dropdown-submenu list-group-item">
  					<a href="#">男鞋</a>
             		<ul class="dropdown-menu pull-right">
                  		<% for(String s:ml4){ %>
                  		<li class="list-group-item"><a href="/ssh_project/user/seeoneshop?shopname=<%=s %>"><%=s %></a></li>
                 		<% } %>
                    </ul>
  				</li>
  				<li class="dropdown-submenu list-group-item">
  					<a href="#">女鞋</a>
             		<ul class="dropdown-menu pull-right">
                  		<% for(String s:ml5){ %>
                  		<li class="list-group-item"><a href="/ssh_project/user/seeoneshop?shopname=<%=s %>"><%=s %></a></li>
                 		<% } %>
                    </ul>
  				</li>
  				<img style="height: 200px;" src="/ssh_project/image/TB1MaLKRXXXXXaWXFXXXXXXXXXX-480-260.png" alt="商标">
			</ul>
		</div>
		<div class="card w-75">
 			 <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  				<div class="carousel-inner">
  					<%
  						int k=0;
  						List<Photo> list=(List<Photo>)session.getAttribute("list");
  						List<Shop> slist=(List<Shop>)session.getAttribute("slist");
  						for(Photo photo:list){
  						  if(photo.getShopname().equals("首页")){
  							if(k==0){
  					%>
    				<div class="carousel-item active">
      					<img class="img-responsive d-block w-100"  src="/ssh_project/image/<%=photo.getPname() %>" alt="First slide">
    				</div>
    				<%  }else{  %>
    				<div class="carousel-item">
      					<img class="img-responsive d-block w-100" src="/ssh_project/image/<%=photo.getPname() %>" alt="<%=k%> slide">
   				    </div>
    				<% } k++; } } %>
				</div>
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
	</div>
   	
   	<!-- 商品卡片 -->
   	<br>
	
 	<table style="margin-left: 70px;width: 1500px;">
 		<% List<Photo> plist=(List<Photo>)session.getAttribute("plist");
 			System.out.print(plist.size());
 		   for(int i=0;i<plist.size()/3;i++){ 
 		 %>
 		 <tr>
 		 	<td>
 		 	<div class="card" style="width: 400px;border: 0">
				<div class="card" style="width: 400px;">
					<a href="user/seeoneshop?shopname=<%=plist.get(i*3).getShopname() %>">
  					<img class="img-responseven w-100" src="/ssh_project/image/<%=plist.get(i*3).getPname() %>" alt="i*3">
  					</a>
  					<div class="card-body">
    				<h3 align="center"><a href="user/seeoneshop?shopname=<%=plist.get(i*3).getShopname() %>"><%=plist.get(i*3).getShopname() %></a></h3>
  					<h5 class="text-danger" align="center">￥<%=slist.get(i*3).getPrice()%></h5>
  					</div>
				</div>
			</div>
 		 	</td>
 		 	<td>
 		 	<div class="card" style="width: 400px;border: 0">
				<div class="card" style="width: 400px;">
					<a href="user/seeoneshop?shopname=<%=plist.get(i*3+1).getShopname() %>">
  					<img class="img-responseven w-100" src="/ssh_project/image/<%=plist.get(i*3+1).getPname() %>" alt="i*3+1">
  					</a>
  					<div class="card-body">
    				<h3 align="center"><a href="user/seeoneshop?shopname=<%=plist.get(i*3+1).getShopname() %>"><%=plist.get(i*3+1).getShopname() %></a></h3>
  					<h5 class="text-danger" align="center">￥<%=slist.get(i*3+1).getPrice()%></h5>
  					</div>
				</div>
			</div>
 		 	</td>
 		 	<td>
 		 	<div class="card" style="width: 400px;border: 0">
				<div class="card" style="width: 400px;">
					<a href="user/seeoneshop?shopname=<%=plist.get(i*3+2).getShopname() %>">
  					<img class="img-responseven w-100" src="/ssh_project/image/<%=plist.get(i*3+2).getPname() %>" alt="i*3+2">
  					</a>
  					<div class="card-body">
    				<h3 align="center"><a href="user/seeoneshop?shopname=<%=plist.get(i*3+2).getShopname() %>"><%=plist.get(i*3+2).getShopname() %></a></h3>
  					<h5 class="text-danger" align="center">￥<%=slist.get(i*3+2).getPrice()%></h5>
  					</div>
				</div>
			</div>
 		 	</td>
 		 </tr>
 		 <tr><td colspan="3">·</td></tr>
 		<% } %>
 	</table>
 
 
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>