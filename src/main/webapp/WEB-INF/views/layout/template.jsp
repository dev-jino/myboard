<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyBoard</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css?after2" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css?after4" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css?after2" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css?after7" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member.css?after8" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css?after2" type="text/css">
<style type="text/css">
.container {
  width: 1120px;
  max-width: none !important;
}
</style>

</head>
<body>
	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	
	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>

	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/member.js?after1"/></script>
</body>
</html>