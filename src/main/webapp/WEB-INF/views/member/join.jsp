<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container m-3 main-container">
    <div class="row hedaer justify-content-between">
    	<div class="col-xs-12">
    		<h1>회원가입</h1>
    	</div>
    </div>
    <div class="row mt-3">
        <div class="col-md-12">
        	<!-- 회원가입 양식 -->
        	<div class="row member-row">
				<div class="panel panel-default">
					<div class="panel-body">
						<form id="joinForm" action="${pageContext.request.contextPath}/join" method="post">
							<table class="table text-center table-bordered member-table">
			        			<tr>
				        			<td class="align-middle">아이디</td>
									<td>
										<input type="text" class="form-control" name="id" id="id" placeholder="id" oninput="checkId()">
										<div class="join-fail-message" id="id_must" style="display: none;">필수입력 정보입니다.</div>
										<div class="join-fail-message" id="id_validation" style="display: none;">5~20자의 영문 소문자, 숫자, 특수문자(_),(-)만 사용 가능합니다.</div>
										<div class="join-fail-message" id="id_already" style="display: none;">이미 사용중이거나 탈퇴한 아이디입니다.</div>
										<div class="join-success-message" id="id_ok" style="display: none;">사용할 수 있는 아이디입니다.</div>
									</td>
			        			</tr>
			        			<tr>
			        				<td class="align-middle">비밀번호</td>
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
			        			<tr>
				        			<td class="align-middle">이름</td>
									<td>
										<input type="text" class="form-control" name="name" id="name" placeholder="name" oninput="checkName()">
			        					<div class="join-fail-message" id="name_validation" style="display: none;">한글과 영문 대 소문자만 사용 가능합니다.</div>
			        					<div class="join-fail-message" id="name_must" style="display: none;">필수입력 정보입니다.</div>
									</td>
			        			</tr>
			        			<tr>
			        				<td class="align-middle">이메일</td>
			        				<td colspan="2" class="align-middle">
			        					<input type="text" class="form-control" name="email" id="email" placeholder="e-mail" oninput="checkEmail()">
										<button class="btn btn-secondary member-button" type="button" id="email_auth">이메일 인증</button>
			        					<div class="join-fail-message" id="email_must" style="display: none;">필수입력 정보입니다.</div>
			        					<div class="join-fail-message" id="email_validation" style="display: none;">이메일 주소를 확인해주세요.</div>
										<div class="join-success-message" id="email_transfer" style="display: none;">인증번호가 전송되었습니다.<br>인증번호가 오지 않으면 입력하신 정보를 확인해주세요.</div>
			        				</td>
			        			</tr>
			        			<tr>
			        				<td class="align-middle">인증확인</td>
			        				<td>
			        					<input type="text" class="form-control" id="email_auth_input" placeholder="인증번호를 입력하세요." disabled>
										<button class="btn btn-secondary member-button" type="button" id="email_auth_button">인증확인</button>
										<div class="join-success-message" id="email_confirm_ok" style="display: none;">인증번호가 확인되었습니다.</div>
										<div class="join-fail-message" id="email_confirm_fail" style="display: none;">인증번호가 일치하지 않습니다. 다시 확인해주세요.</div>
			        					<div class="join-fail-message" id="email_confirm_must" style="display: none;">인증이 필요합니다.</div>
			        				</td>
			        			</tr>
							</table>
						</form>
					</div>
					<div class="panel-footer member-row">
						<button class="btn btn-secondary member-table" id="join_submit_button" type="button">회원가입</button>
					</div>
				</div>
        	</div>
		</div>
    </div>
</div>