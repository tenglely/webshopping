<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>设置商城首页</title>
</head>
<body>
	<form enctype="multipart/form-data" method="post" action="/ssh_project/user/multiUpload">
	    <input type="hidden" name="shopname" value="首页">
	    <table class="table">
	    <thead>
			<tr><th class="alert alert-primary" role="alert" colspan="3">上传/修改首页商城图片</th></tr>
		</thead>
		<tr><td colspan="2" align="center">
	    <h4 class="text-danger">最多上传4张图片</h4>
	    </td></tr>
	    <tr>
	    	<td align="right" colspan="1">选择图片:</td>
	    	<td>
	     	<input type="file" name="upload"/><br><br>
	     	<input type="file" name="upload"/><br><br>
	     	<input type="file" name="upload"/><br><br>
	     	<input type="file" name="upload"/><br><br>
	     	</td>
	     </tr>
	     <tr><td align="center" colspan="2">
	     <input type="submit" value="提交" class="btn btn-primary">
	     </td></tr>
	     </table>
	</form>
	
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>