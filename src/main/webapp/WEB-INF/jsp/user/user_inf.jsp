<%@page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="../newshead.jsp">
	<jsp:param value="个人中心" name="title" />
</jsp:include>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="usernav.jsp">
			<jsp:param value="inf" name="fun" />
		</jsp:include>
	</div>
	<div class="container-fluid" style="margin-top: 60px">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-7">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<dl class="dl-horizontal">
								<dt>用户名</dt>
								<dd>${userinf.username}</dd>
								<dt>性别</dt>
								<dd>
									<c:if test="${userinf.sex ==0}">男</c:if>
									<c:if test="${userinf.sex ==1}">女</c:if>
								</dd>
								<dt>邮箱</dt>
								<dd>${userinf.email }</dd>
								<dt>手机号</dt>
								<dd>${userinf.telephone }</dd>

								<dt>昵称</dt>
								<dd>${userinf.nickname }</dd>

								<hr>
								<dd>
									<a
										href="${pageContext.request.contextPath}/user/user_inf_edit.action?id=${userid}">
										<button type="button" class="btn btn-primary">修改</button>
									</a>
								</dd>
							</dl>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-4"></div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>