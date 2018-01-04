<%@page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../../newshead.jsp">
        <jsp:param value="新闻分类管理" name="title"/>
    </jsp:include>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="../adminnav.jsp">
        <jsp:param value="sortlist" name="fun"/>
    </jsp:include>
    <div class="row" style="margin-top: 120px">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">分类列表</h3>
                </div>
                <div class="panel-body">

                    <div class="row">

                        <div class="col-lg-2">
                            <a href="${pageContext.request.contextPath}/admin/sort/add.action">
                                <button class="btn btn-block btn-success" type="button">增加分类</button>
                            </a>
                        </div>
                        <div class="col-lg-6"></div>
                        <div class="col-lg-4">
                            <form role="form" method="post" action="sortlist.action">
                                <div class="input-group">
                                    <input type="text" class="form-control"
                                           placeholder="请输入分类名进行搜索" name="serach"> <span
                                        class="input-group-btn">
												<button class="btn btn-success" type="submit">搜索</button>
										</span>
                                </div>
                            </form>
                        </div>
                    </div>

                    <table class="table table-hover table-bordered"
                           style="margin-top: 20px">
                        <thead>
                        <tr align="center" style="font-weight: bold">
                            <td>序号</td>
                            <td>分类名称</td>
                            <td>分类描述</td>
                            <td>状态</td>
                            <td>操作</td>
                        </tr>

                        </thead>
                        <tbody>
                        <c:if test="${sortlist ne null}">
                            <c:forEach items="${sortlist}" var="sort" varStatus="vs">
                                <tr align="center">
                                    <td>${vs.count}</td>
                                    <td>${sort.sortname}</td>
                                    <td>${sort.description}</td>
                                    <td><c:if test="${sort.isdelete==1}">
                                        冻结
                                    </c:if> <c:if test="${sort.isdelete==0}">
                                        正常
                                    </c:if></td>
                                    <td><c:if test="${sort.isdelete==0}">
                                        <a
                                                href="${pageContext.request.contextPath}/admin/sort/ban.action?id=${sort.id}">
                                            <button class="btn btn-warning btn-sm" type="button">
                                                <span class="glyphicon glyphicon-ban-circle"></span>
                                            </button>
                                        </a>
                                    </c:if> <c:if test="${sort.isdelete==1}">
                                        <a
                                                href="${pageContext.request.contextPath}/admin/sort/ok.action?id=${sort.id}">
                                            <button class="btn btn-success btn-sm" type="button">
                                                <span class="glyphicon glyphicon-ok-circle"></span>
                                            </button>
                                        </a>
                                    </c:if> <a
                                            href="${pageContext.request.contextPath}/admin/sort/edit.action?id=${sort.id}">
                                        <button class="btn btn-primary btn-sm" type="button">
                                            <span class="glyphicon glyphicon-edit"></span>
                                        </button>
                                    </a> <a
                                            href="${pageContext.request.contextPath}/admin/sort/delete.action?id=${sort.id}">
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
