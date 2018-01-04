<%@page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="../../newshead.jsp">
	<jsp:param value="新闻信息管理" name="title" />
</jsp:include>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="../../admin/adminnav.jsp">
			<jsp:param value="newslist" name="fun" />
		</jsp:include>
		<div class="row" style="margin-top: 120px">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">新闻列表</h3>
					</div>
					<div class="panel-body">

						<div class="row">
							<div class="col-lg-2">
								<a
									href="${pageContext.request.contextPath}/admin/news/add.action">
									<button class="btn btn-block btn-success" type="button">增加新闻</button>
								</a>
							</div>
							<div class="col-lg-4"></div>
							<div class="col-lg-6">
								<form role="form" method="post" action="newslist.action">
									<div class="input-group">
										<input type="text" class="form-control"
											placeholder="请输入标题进行搜索" name="serach"><span
											class="input-group-btn"> <select class="form-control"
											name="sort" style="width: 80px">
												<c:if test="${sortlist ne null}">
													<c:forEach items="${sortlist}" var="sort" varStatus="vs">
														<c:if test="${sort.id==1 }">
															<option value="${sort.id}">${sort.sortname}</option>
														</c:if>
														<c:if test="${sort.id!=1 }">
															<option value="${sort.id}">${sort.sortname}</option>
														</c:if>
													</c:forEach>
												</c:if>
										</select>
										</span> <span class="input-group-btn"><button
												class="btn btn-success" type="submit">搜索</button> </span>
									</div>
								</form>
							</div>

						</div>

						<table class="table table-hover table-bordered"
							style="margin-top: 20px">
							<thead>
								<tr align="center" style="font-weight: bold">
									<td>序号</td>
									<td>标题</td>
									<td>分类</td>
									<td>来源</td>
									<td>发布人</td>
									<td>发布日期</td>
									<td>操作</td>
								</tr>
							</thead>
							<tbody>
								<c:if test="${newslist ne null}">
									<c:forEach items="${newslist}" var="news" varStatus="vs">
										<tr align="center">
											<td>${vs.count }</td>
											<td>${news.title }</td>
											<td><c:forEach items="${sortlist}" var="sort"
													varStatus="vs">
													<c:if test="${news.sort==sort.id }">${sort.sortname }</c:if>
												</c:forEach></td>
											<td>${news.fromto }</td>
											<td>${news.fromuser }</td>
											<td>${news.time }</td>
											<td><a
												href="${pageContext.request.contextPath}/admin/news/edit?id=${news.id}">
													<button class="btn btn-primary btn-sm" type="button">
														<span class="glyphicon glyphicon-edit"></span>
													</button>
											</a> <a
												href="${pageContext.request.contextPath}/admin/news/delete?id=${news.id}">
													<button class="btn btn-danger btn-sm" type="button">
														<span class="glyphicon glyphicon-trash"></span>
													</button>
											</a></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>

				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
		<div class="row" align="center">
			<div class="col-md-12">
				<ul class="pagination pagination-lg">
					<li><a href="#">Prev</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">Next</a></li>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>
