<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container m-3 main-container">
    <div class="row hedaer justify-content-between">
    	<div class="col-xs-12">
    		<h1>로그인</h1>
    	</div>
    </div>
    <div class="row mt-3">
        <div class="col-md-12">
        	<!-- 로그인 양식 -->
        	<div class="row member-row">
				<div class="panel panel-default">
					<div class="panel-body">
						<form id="loginForm" action="${pageContext.request.contextPath}/login" method="post" autocomplete="off">
							<table class="table text-center table-bordered member-login-table">
			        			<tr>
				        			<td class="align-middle">아이디</td>
									<td>
										<input type="text" class="form-control" name="id" id="id" placeholder="id" value="${id}">
									</td>
			        			</tr>
			        			<tr>
			        				<td class="align-middle">비밀번호</td>
			        				<td>
			        					<input type="password" class="form-control" name="pwd" id="pwd" placeholder="password">
			        				</td>
			        			</tr>
		        				<tr id="error_auth" style="display: none;">
			        				<td class="align-middle login-error-msg" colspan="2">${message}</td>
		        				</tr>
			        			<tr id="error_empty_id" style="display: none;">
			        				<td class="align-middle login-error-msg" colspan="2">아이디를 입력해주세요</td>
		        				</tr>
			        			<tr id="error_empty_pwd" style="display: none;">
			        				<td class="align-middle login-error-msg" colspan="2">비밀번호를 입력해주세요</td>
		        				</tr>
			        			
							</table>
						</form>
					</div>
					<div class="panel-footer member-row">
						<button class="btn btn-secondary member-login-table" type="submit" form="loginForm">로그인</button>
					</div>
				</div>
        	</div>

			<div class="row">
		        <div class="col-xs-12 login-button-collection">
					<a href="${pageContext.request.contextPath}/find_id"><button type="button" class="btn btn-outline-secondary">아이디 찾기</button></a>
					<a href="${pageContext.request.contextPath}/find_password"><button type="button" class="btn btn-outline-secondary">비밀번호 찾기</button></a>
					<a href="${pageContext.request.contextPath}/join"><button type="button" class="btn btn-outline-secondary">회원가입</button></a>
		        </div>
		    </div>
	    	
		</div>
    </div>
</div>

<script type="text/javascript">
	window.onload = function() {
		var errorAuthMsg = '<c:out value="${message}"/>';
		if (errorAuthMsg != "") {
			document.getElementById("error_auth").style.display = "";
			document.getElementById("pwd").focus();
		}
	}
	
	function loginCheck() {
		document.getElementById("error_empty_id").style.display = "none";
		document.getElementById("error_empty_pwd").style.display = "none";
		document.getElementById("error_auth").style.display = "none";
	
		if (document.getElementById("id").value == "") {
			document.getElementById("error_empty_id").style.display = "";
			document.getElementById("id").focus();
			event.preventDefault();
			return ;
		}
		
		if (document.getElementById("pwd").value == "") {
			document.getElementById("error_empty_pwd").style.display = "";
			document.getElementById("pwd").focus();
			event.preventDefault();
			return ;
		}
	}
	
	loginForm.addEventListener("submit", loginCheck);

</script>
