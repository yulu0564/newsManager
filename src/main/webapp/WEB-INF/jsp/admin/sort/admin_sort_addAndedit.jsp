<%@page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../../newshead.jsp">
        <jsp:param value="分类信息" name="title"/>
    </jsp:include>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="../adminnav.jsp">
        <jsp:param value="sortlist" name="fun"/>
    </jsp:include>
</div>
<div class="container-fluid" style="margin-top: 120px">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <h3 class="panel-title">分类信息</h3>
                </div>
                <div class="panel-body">
                    <c:if test="${sortinf.id==null }">
                    <form method="post" action="add_do.action">
                        </c:if>
                        <c:if test="${sortinf.id!=null }">
                        <form method="post" action="edit_do.action">
                            </c:if>
                            <input name="id" type="hidden" value="${sortinf.id}">
                            <div style="width: 400px; margin-left: 230px">
                                <div class="input-group">
                                    <span class="input-group-addon">分类名称</span> <input type="text"
                                                                                       name="sortname"
                                                                                       value="${sortinf.sortname}"
                                                                                       class="form-control"
                                                                                       placeholder="请输入分类名">
                                </div>
                            </div>
                            <div style="width: 400px; margin-left: 230px">
                                <div class="input-group" style="margin-top: 30px">
                                    <span class="input-group-addon">分类描述</span> <input type="text"
                                                                                       name="description"
                                                                                       value="${sortinf.description}"
                                                                                       class="form-control"
                                                                                       placeholder="请输入分类描述">
                                </div>
                            </div>
                            <button class="btn btn-success" type="submit"
                                    style="width: 400px; margin-top: 30px; margin-left: 230px">提交
                            </button>
                        </form>
                        <button class="btn btn-default" type="button"
                                style="width: 400px; margin-top: 20px; margin-left: 230px"
                                onClick="javascript :history.back(-1);">返回
                        </button>
                </div>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>
</body>
</html>