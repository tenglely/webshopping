<%@page import="com.shopping.model.Shop"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="s" uri="/struts-tags"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>管理商品</title>
</head>
<body>
	<nav class="navbar navbar-light bg-light">
  		<a class="navbar-brand">查询栏</a>
  	  <form class="form-inline" action="/ssh_project/user/searchshop" method="post">
  	  	<select name="key" class="form-control">
  	  		<option value="所有商品">所有商品</option>
  	  		<option value="品牌名">品牌名</option>
  	  		<option value="商品名">商品名</option>
  	  		<option value="商品种类">商品种类</option>
  	  		<option value="用户类型">用户类型</option>
  	  		<option value="尺码">尺码</option>
  	  		<option value="商品编号">商品编号</option>
  	  	</select>
    	<input  class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="value">
    	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
  	  </form>
	</nav>
	<table class="table">
		<thead>
			<th>商品编号</th><th>品牌名</th><th>商品名</th><th>商品类型</th><th>用户类型</th>
			<th>尺码</th><th>单价</th><th>库存</th><th>备注</th>
			<th>替换图片</th><th>重新编辑图文</th><th>操作</th><th>浏览</th>
		</thead>
		<tbody>
			<% List<Shop> list=(List<Shop>)session.getAttribute("list"); 
				int n=list.size()/10;
				int m=list.size()%10;
				if(m>0)
					n+=1;
				String sum=(String)request.getParameter("sum");
				System.out.print(sum);
				int k=0;
				if(sum==null)
					k=0;
				else
					k=(Integer.parseInt(sum)-1)*10;
				for(int i=k;i<k+10&&i<list.size();i++){
			%>
			
				<tr>
				<td><%=list.get(i).getSno() %></td>
				<td><%=list.get(i).getSfname() %></td>
				<td><%=list.get(i).getShopname() %></td>
				<td><%=list.get(i).getShopclass()%></td>
				<td><%=list.get(i).getSclass()%></td>
				<td><%=list.get(i).getSize() %></td>
				<td><%=list.get(i).getPrice() %></td>
				<td><%=list.get(i).getCount() %></td>
				<td><%=list.get(i).getRemark() %></td>
				<td>
					<a href="/ssh_project/manager/updatePhoto.jsp?shopname=<%=list.get(i).getShopname() %>">替换图片</a>
				</td>
				<td>
					<a href="/ssh_project/addmessage.jsp?shopname=<%=list.get(i).getShopname() %>">重新编辑图文</a>
				</td>
				<td>
					<a href="/ssh_project/user/deletebuysno?sno=<%=list.get(i).getSno() %>&shopname=<%=list.get(i).getShopname() %>" data-toggle="tooltip" title="将删除该商品信息及该商品订单，请做好备份！！">删除</a>&nbsp;
					<a href="/ssh_project/user/getoneshop?sno=<%=list.get(i).getSno() %>">修改</a>
				</td>
				<td>
					<a href="/ssh_project/user/seeoneshop?shopname=<%=list.get(i).getShopname() %>">浏览</a>
				</td>
				</tr>	
			<% } %>
				
		</tbody>
	</table>
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
       页数：
    </li>
    <% for(int j=1;j<=n;j++){ %>
    <li class="page-item"><a class="page-link" href="/ssh_project/manager/see-shop.jsp?sum=<%=j %>"><%=j %></a></li>
    <% } %>
    <li class="page-item">
    	&nbsp;&nbsp;共有<%=n %>页
    </li>
  </ul>
</nav>
	
	
	
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>