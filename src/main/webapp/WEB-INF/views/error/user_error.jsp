<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container m-3 main-container">
    <div class="row hedaer justify-content-between">
    	<div class="col-xs-12">
    		<h1>에러</h1>
    	</div>
    </div>
    <div class="row mt-3">
        <div class="col-md-12">
        	<!-- 로그인 양식 -->
        	<div class="row member-row">
				<div class="panel panel-default">
					<div class="panel-body">
						<div><p style="color: red;">작성자가 아니므로 수정/삭제가 불가능합니다.</p></div>
					</div>
					<div class="panel-footer member-row">
						<a href="${pageContext.request.contextPath}/"><button class="btn btn-secondary member-login-table">메인으로</button></a>
					</div>
				</div>
        	</div>
		</div>
    </div>
</div>