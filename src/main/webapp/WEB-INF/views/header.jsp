<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<div class="container m-3 p-0">
    <header class="d-flex flex-wrap align-items-center justify-content-center  py-3 mb-4 border-bottom justify-content-lg-start">
		<a href="${pageContext.request.contextPath}/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
			<span style="font-size: 30px;">MY BOARD</span>
		</a>
      
		<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 mb-md-0" style="width:50%;">
			<li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link">자유게시판</a></li>
			<c:if test="${loginMember.status == 9}">
				<li class="nav-item"><a href="${pageContext.request.contextPath}/admin_member" class="nav-link">관리자</a></li>			
			</c:if>
		</ul>

		<ul class="nav col-md-3">
			<c:choose>
				<c:when test="${loginMember == null}">
					<li class="nav-item"><a href="${pageContext.request.contextPath}/login" class="nav-link"><button type="button" class="btn btn-outline-secondary">로그인</button></a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/join" class="nav-link"><button type="button" class="btn btn-secondary">회원가입</button></a></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a href="#" class="nav-link"><span>${loginMember.name}</span> 님</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/logout" class="nav-link">로그아웃</a></li>
				</c:otherwise>
			</c:choose>
      		
		</ul>
      
    </header>
</div>