<%@page import="com.shopping.model.Client"%>
<%@page import="com.shopping.model.Shop"%>
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
<title>查看某一牌子的鞋</title>
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
</head>
<body style="overflow-x:hidden;background-color: #F5FFFA">
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
	<% List<Photo> plist=(List<Photo>)session.getAttribute("plist");%>
	<% List<Shop> sflist=(List<Shop>)session.getAttribute("sflist");%>
	<br><br>
	<table style="margin-left: 70px;width: 1500px;">
 		<% 
 			int s=plist.size()/3;
 			int ss=plist.size()%3;
 			if(ss>0)
 				s+=1;
 			for(int i=0;i<s;i++){ 
 		 %>
 		 <tr>
 		 	<td>
 		 	<div class="card" style="width: 400px;border: 0">
				<div class="card" style="width: 400px;">
					<a href="user/seeoneshop?shopname=<%=plist.get(i*3).getShopname() %>">
  					<img class="img-responseven w-100" src="/ssh_project/image/<%=plist.get(i*3).getPname() %>" alt="i*3">
  					</a>
  					<div class="card-body">
    				<h3 align="center"> <a href="user/seeoneshop?shopname=<%=plist.get(i*3).getShopname() %>"><%=plist.get(i*3).getShopname() %></a></h3>
  					<h5 class="text-danger" align="center">￥<%=sflist.get(i*3).getPrice()%></h5>
  					</div>
				</div>
			</div>
 		 	</td>
 		 	<% if(i==s-1&&ss==1){ System.out.print("多出一个");}else{ %>
 		 	<td>
 		 	<div class="card" style="width: 400px;border: 0">
				<div class="card" style="width: 400px;">
					<a href="user/seeoneshop?shopname=<%=plist.get(i*3+1).getShopname() %>">
  					<img class="img-responseven w-100" src="/ssh_project/image/<%=plist.get(i*3+1).getPname() %>" alt="i*3+1">
  					</a>
  					<div class="card-body">
    				<h3 align="center"><a href="user/seeoneshop?shopname=<%=plist.get(i*3+1).getShopname() %>"><%=plist.get(i*3+1).getShopname() %></a></h3>
  					<h5 class="text-danger" align="center">￥<%=sflist.get(i*3+1).getPrice()%></h5>
  					</div>
				</div>
			</div>
 		 	</td>
 		 	<% } %>
 		 	<% if(i==s-1&&ss>0){ System.out.print("多出两个");}else{ %>
 		 	<td>
 		 	<div class="card" style="width: 400px;border: 0">
				<div class="card" style="width: 400px;">
					<a href="user/seeoneshop?shopname=<%=plist.get(i*3+2).getShopname() %>">
  					<img class="img-responseven w-100" src="/ssh_project/image/<%=plist.get(i*3+2).getPname() %>" alt="i*3+2">
  					</a>
  					<div class="card-body">
    				<h3 align="center"><a href="user/seeoneshop?shopname=<%=plist.get(i*3+2).getShopname() %>"><%=plist.get(i*3+2).getShopname() %></a></h3>
  					<h5 class="text-danger" align="center">￥<%=sflist.get(i*3+2).getPrice()%></h5>
  					</div>
				</div>
			</div>
 		 	</td>
 		 </tr>
 		 <tr><td colspan="3">·</td></tr>
 		<% } }%>
 	</table>
 	
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>