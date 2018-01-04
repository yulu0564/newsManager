<%@page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-md-12">
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">个人中心</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a
						href="${pageContext.request.contextPath}/news/news_list">首页</a></li>
					<li
						class="<%="inf".equals(request.getParameter("fun")) ? "active" : ""%>"><a
						href="${pageContext.request.contextPath}/user/user_inf">个人中心</a></li>
					<li
						class="<%="collect".equals(request.getParameter("fun"))
					? "active"
					: ""%>"><a
						href="${pageContext.request.contextPath}/user/user_collect?userid=${userid}">我的收藏</a></li>
					<li
						class="<%="comment".equals(request.getParameter("fun"))
					? "active"
					: ""%>"><a
						href="${pageContext.request.contextPath}/user/user_comment?userid=${userid}">我的评论</a></li>
				</ul>
				<c:if test="${username==null}">
					<ul class="nav navbar-nav navbar-right">
						<li><a id="modal-181250" href="#modal-container-181250"
							role="button" class="btn" data-toggle="modal">登录</a></li>
						<li style="margin-right: 50px"><a id="modal-181251"
							href="#modal-container-181251" role="button" class="btn"
							data-toggle="modal">注册</a></li>
					</ul>
				</c:if>
				<c:if test="${username!=null}">
					<ul class="nav navbar-nav navbar-right" style="margin-right: 15px">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">${nickname}<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a
									href="${pageContext.request.contextPath}/news/news_list">首页</a></li>
								<li
									class="<%="inf".equals(request.getParameter("fun"))
						? "active"
						: ""%>"><a
									href="${pageContext.request.contextPath}/news/user_inf">个人中心</a></li>
								<li
									class="<%="collect".equals(request.getParameter("fun"))
						? "active"
						: ""%>"><a
									href="${pageContext.request.contextPath}/user/user_collect?userid=${userid}">我的收藏</a></li>
								<li
									class="<%="comment".equals(request.getParameter("fun"))
						? "active"
						: ""%>"><a
									href="${pageContext.request.contextPath}/user/user_comment?userid=${userid}">我的评论</a></li>
								<li class="divider"></li>
								<li><a
									href="${pageContext.request.contextPath}/user/userSignout.action">退出登录</a>
								</li>
							</ul></li>
					</ul>
				</c:if>
			</div>

		</nav>
	</div>

	<jsp:include page="../user/login_dialg.jsp"></jsp:include>

	<jsp:include page="../user/register_dialg.jsp"></jsp:include>
</div>
<script>
	$(function() {
		$("[data-toggle='tooltip']").tooltip();
	});
</script>