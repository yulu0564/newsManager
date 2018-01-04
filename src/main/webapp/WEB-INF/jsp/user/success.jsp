<%@page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
</head>
<body>
	注册成功！
	<a
		href="${pageContext.request.contextPath}/user/userLogin?username=${username}&&password=${password}">立即登录！</a>
</body>
</html>