<%@page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../admin/adminhead.jsp">
	<jsp:param value="管理员登录" name="title" />
</jsp:include>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="panel panel-success" align="center">
					<div class="panel-heading">
						<h3 class="panel-title">管理员登录</h3>
					</div>
					<div class="panel-body">
						<form role="form" method="post" action="login.action">
							<div class="form-group">
								<label for="exampleInputEmail1"> <B> 用户名： </B>
								</label> <input type="text" name="username" class="form-control"
									style="width: 180px" />
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1"> <B> 密码： </B>
								</label> <input type="password" class="form-control" name="password"
									style="width: 180px" />
							</div>

							<button type="submit" class="btn btn-default"
								style="width: 180px">
								<B> 登录 </B>
							</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>