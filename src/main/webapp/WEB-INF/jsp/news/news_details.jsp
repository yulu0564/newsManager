<%@page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="../newshead.jsp">
		<jsp:param value="新闻-详情" name="title"/>
	</jsp:include>
</head>
<body>
<jsp:include page="news_content.jsp"></jsp:include>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>