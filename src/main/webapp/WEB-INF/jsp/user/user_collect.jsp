<%@page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="../newshead.jsp">
	<jsp:param value="我的收藏" name="title" />
</jsp:include>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="usernav.jsp">
			<jsp:param value="collect" name="fun" />
		</jsp:include>
	</div>
	<div class="container-fluid" style="margin-top: 60px">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<c:if test="${collectslist ne null}">
					<c:forEach items="${collectslist}" var="collectslist"
						varStatus="vs">
						<div style="margin-top: 30px">
							<h2 class="title">
								<a
									href="${pageContext.request.contextPath}/news/news_inf/${collectslist.newsid}">${collectslist.title
									}</a>
							</h2>
							<p class="text">${collectslist.contect}</p>
							<p style="position: absolute; right: 10px">
								<a
									href="${pageContext.request.contextPath}/news/delete_do?id=${collectslist.id}&&userid=${userid}"><button
										class="btn btn-default">取消收藏</button></a>
							</p>
							<hr>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>