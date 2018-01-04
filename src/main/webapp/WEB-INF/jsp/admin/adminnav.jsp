<%@page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-md-12">
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="navbar-header">

                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span><span
                        class="icon-bar"></span><span class="icon-bar"></span><span
                        class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">新闻管理系统</a>
            </div>

            <div class="collapse navbar-collapse"
                 id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li
                            class="<%="newslist".equals(request.getParameter("fun")) ? "active"
					: ""%>"><a
                            href="${pageContext.request.contextPath}/admin/news/newslist">新闻信息管理</a></li>
                    <li
                            class="<%="sortlist".equals(request.getParameter("fun")) ? "active"
					: ""%>"><a
                            href="${pageContext.request.contextPath}/admin/sort/sortlist">新闻分类管理</a></li>
                    <li
                            class="<%="sortlist".equals(request.getParameter("fun")) ? "active"
					: ""%>"><a
                            href="${pageContext.request.contextPath}/admin/user/userlist">用户管理管理</a></li>
                </ul>
            </div>

        </nav>
    </div>
</div>