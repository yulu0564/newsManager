<%@page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../newshead.jsp">
        <jsp:param value="新闻-列表" name="title"/>
    </jsp:include>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="newsnav.jsp">
        <jsp:param value="news_index" name="fun"/>
    </jsp:include>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-8">
            <c:if test="${newslist ne null}">
                <c:forEach items="${newslist}" var="news" varStatus="vs">

                    <div style="margin-top: 30px">
                        <a href="${pageContext.request.contextPath}/news/news_inf/${news.id}">
                            <h2 class="title">${news.title }</h2>
                        </a>
                        <p class="text">${news.digest}</p>
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