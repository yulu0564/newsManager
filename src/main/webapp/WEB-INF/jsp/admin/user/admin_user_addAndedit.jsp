<%@page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../../newshead.jsp">
        <jsp:param value="用户信息" name="title"/>
    </jsp:include>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="../adminnav.jsp">
        <jsp:param value="userlist" name="fun"/>
    </jsp:include>
</div>
<div class="container-fluid" style="margin-top: 120px">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <h3 class="panel-title">用户信息</h3>
                </div>
                <div class="panel-body">
                    <c:if test="${userinf.id==null }">
                    <form method="post" action="${pageContext.request.contextPath}/admin/user/add_do">
                        </c:if>
                        <c:if test="${userinf.id!=null }">
                        <form method="post" action="${pageContext.request.contextPath}/admin/user/edit_do">
                            </c:if>
                            <input name="id" type="hidden" value="${userinf.id}">
                            <div style="width: 400px; margin-left: 230px">
                                <div class="input-group">
                                    <span class="input-group-addon">用户名</span> <input type="text"
                                                                                     name="username"
                                                                                     value="${userinf.username}"
                                                                                     class="form-control"
                                                                                     placeholder="请输入用户名">
                                </div>
                            </div>
                            <div style="width: 400px; margin-left: 230px">
                                <div class="input-group" style="margin-top: 30px">
                                    <span class="input-group-addon">密码</span> <input type="password"
                                                                                     name="password"
                                                                                     value="${userinf.password}"
                                                                                     class="form-control"
                                                                                     placeholder="请输入密码">
                                </div>
                            </div>
                            <div style="width: 400px; margin-left: 230px">
                                <div class="input-group" style="margin-top: 30px">
                                    <span class="input-group-addon">性别</span> <select
                                        class="form-control" name="sex">
                                    <c:if test="${userinf.sex==0}">
                                        <option value="0" selected="selected">男</option>
                                        <option value="1">女</option>
                                    </c:if>
                                    <c:if test="${userinf.sex==1}">
                                        <option value="0">男</option>
                                        <option value="1" selected="selected">女</option>
                                    </c:if>
                                    <c:if test="${userinf.sex==null}">
                                        <option value="0" selected="selected">男</option>
                                        <option value="1">女</option>
                                    </c:if>
                                </select>
                                </div>
                            </div>
                            <div style="width: 400px; margin-left: 230px">
                                <div class="input-group" style="margin-top: 30px">
                                    <span class="input-group-addon">邮箱</span> <input type="text"
                                                                                     name="email" class="form-control"
                                                                                     placeholder="请输入邮箱">
                                </div>
                            </div>

                            <div style="width: 400px; margin-left: 230px">
                                <div class="input-group" style="margin-top: 30px">
                                    <span class="input-group-addon">电话</span> <input type="text"
                                                                                     name="telephone"
                                                                                     class="form-control"
                                                                                     placeholder="请输入手机号">
                                </div>
                            </div>

                            <div style="width: 400px; margin-left: 230px">
                                <div class="input-group" style="margin-top: 30px">
                                    <span class="input-group-addon">昵称</span> <input type="text"
                                                                                     name="nickname"
                                                                                     class="form-control"
                                                                                     placeholder="请输入昵称">
                                </div>
                            </div>

                            <div style="width: 400px; margin-left: 230px">
                                <div class="input-group" style="margin-top: 30px">
                                    <span class="input-group-addon">头像</span> <input type="text"
                                                                                     name="head_image"
                                                                                     class="form-control"
                                                                                     placeholder="请输入头像">
                                </div>
                            </div>

                            <button class="btn btn-success"
                                    style="width: 400px; margin-top: 30px; margin-left: 230px">提交
                            </button>
                            <button class="btn btn-default"
                                    style="width: 400px; margin-top: 20px; margin-left: 230px"
                                    onClick="javascript :history.back(-1);">返回
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