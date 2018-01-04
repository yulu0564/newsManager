<%@page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../newshead.jsp">
        <jsp:param value="个人中心" name="title"/>
    </jsp:include>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="usernav.jsp">
        <jsp:param value="inf" name="fun"/>
    </jsp:include>

</div>
<div class="container-fluid" style="margin-top: 60px">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-7">
            <form method="post" action="${pageContext.request.contextPath}/user/user_inf_edit_do">
                <input name="id" type="hidden" value="${userinf.id}">
                <div style="width: 400px; margin-left: 230px">
                    <div class="input-group">
                        <span class="input-group-addon">昵称</span> <input type="text"
                                                                         name="nickname" value="${userinf.nickname}"
                                                                         class="form-control"
                                                                         placeholder="请输入用户名">
                    </div>
                </div>
                <div style="width: 400px; margin-left: 230px">
                    <div class="input-group" style="margin-top: 30px">
                        <span class="input-group-addon">密码</span> <input type="text"
                                                                         name="password" value="${userinf.password}"
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
                                                                         name="telephone" class="form-control"
                                                                         placeholder="请输入手机号">
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
    <div class="col-md-4"></div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>