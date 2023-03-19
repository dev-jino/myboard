<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container m-3 main-container">
    <div class="row hedaer justify-content-between">
    	<div class="col-xs-12">
    		<h1>비밀번호 변경</h1>
    	</div>
    </div>
    <div class="row mt-3">
        <div class="col-md-12">
        	<div class="row member-row">
				<div class="panel panel-default">
					<div class="panel-body" id="change_password">
						<form id="findPasswordChangeForm" action="${pageContext.request.contextPath}/find_password_change" method="post">
							<input type="text" name="id" value="${id}" hidden="hidden">
							<table class="table text-center table-bordered member-table">
			        			<tr>
			        				<td class="align-middle">새 비밀번호</td>
			        				<td>
			        					<input type="text" class="form-control" name="pwd" id="pwd" placeholder="password" oninput="checkPwd()">
			        					<div class="join-fail-message" id="pwd_must" style="display: none;">필수입력 정보입니다.</div>
			        					<div class="join-fail-message" id="pwd_validation" style="display: none;">8~16자 이내 영문, 숫자, 특수문자를 1회 이상 사용해야 합니다.<br>사용가능 특수문자 : ~!@#$%^&amp;*_-</div>
			        					<div class="join-success-message" id="pwd_ok" style="display: none;">사용할 수 있는 비밀번호입니다.</div>
			        				</td>
			        			</tr>
			        			<tr>
			        				<td class="align-middle">비밀번호 확인</td>
			        				<td>
			        					<input type="text" class="form-control" id="pwd_confirm" placeholder="confirm password" oninput="checkPwdConfirm()">
			        					<div class="join-fail-message" id="pwd_confirm_must" style="display: none;">필수입력 정보입니다.</div>
			        					<div class="join-fail-message" id="pwd_confirm_fail" style="display: none;">비밀번호가 일치하지 않습니다.</div>
			        					<div class="join-success-message" id="pwd_confirm_ok" style="display: none;">비밀번호가 일치합니다.</div>
			        				</td>
			        			</tr>
							</table>
						</form>
					</div>
					<div class="panel-footer member-row">
						<button class="btn btn-secondary member-table" id="change_password_button" type="button">비밀번호 변경</button>
					</div>
		    	</div>
		    </div>
		</div>
    </div>
</div>