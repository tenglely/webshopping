<%@page import="java.util.List"%>
<%@page import="com.shopping.model.Buy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>管理订单</title>
</head>
<body>
	<nav class="navbar navbar-light bg-light">
  		<a class="navbar-brand">查询栏</a>
  	  <form class="form-inline" action="/ssh_project/user/searchbuy" method="post">
  	  	<select name="key" class="form-control">
    		<option value="所有订单">所有订单</option>
    		<option value="订单编号">订单编号</option>
  	  		<option value="用户编号">用户编号</option>
  	  		<option value="商品编号">商品编号</option>
  	  		<option value="购买状态">购买状态</option>
  	  		<option value="出货状态">出货状态</option>
  	  	</select>
    	<input  class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="value">
    	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
  	  </form>
	</nav>
	<table class="table">
		<thead>
			<th>订单编号</th><th>用户编号</th><th>商品编号</th><th>购买数量</th>
			<th>总价</th><th>收货地址</th><th>日期</th><th>购买状态</th>
			<th>出货状态</th><th>快递编号</th><th>操作</th>
		</thead>
		<tbody>
			<% List<Buy> list=(List<Buy>)session.getAttribute("list"); 
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
				<td><%=list.get(i).getBno() %></td>
				<td><a href="/ssh_project/user/searchclient?key=用户编号&value=<%=list.get(i).getCno() %>"><%=list.get(i).getCno() %></a></td>
				<td><a href="/ssh_project/user/searchshop?key=商品编号&value=<%=list.get(i).getSno() %>"><%=list.get(i).getSno() %></a></td>
				<td><%=list.get(i).getNum() %></td>
				<td><%=list.get(i).getPrice() %></td>
				<td><%=list.get(i).getAddress() %></td>
				<td><%=list.get(i).getDate() %></td>
				<td><%=list.get(i).getBuystate() %></td>
				<td><%=list.get(i).getShipment() %></td>
				<td><%=list.get(i).getCouriernumber() %></td>
				<td>
					<a href="/ssh_project/user/deletebuy?bno=<%=list.get(i).getBno() %>">删除</a>&nbsp;
					<a href="/ssh_project/user/getonebuy?bno=<%=list.get(i).getBno() %>&pay=no">修改</a>
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
    <li class="page-item"><a class="page-link" href="/ssh_project/manager/see-buy.jsp?sum=<%=j %>"><%=j %></a></li>
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