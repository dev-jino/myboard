<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container m-3 main-container">
    <div class="row hedaer justify-content-between">
    	<div class="col-xs-12">
    		<h1>아이디 찾기</h1>
    	</div>
    </div>
    <div class="row mt-3">
        <div class="col-md-12">
        	<!-- 아이디 찾기 양식 -->
        	<div class="row member-row">
				<div class="panel panel-default">
					<div class="panel-body">
						<form id="findIdForm" action="${pageContext.request.contextPath}/find_id" method="post">
							<table class="table text-center table-bordered member-table">
			        			<tr>
				        			<td class="align-middle">이름</td>
									<td>
										<input type="text" class="form-control" name="name" id="name" placeholder="name">
									</td>
			        			</tr>
			        			<tr>
			        				<td class="align-middle">이메일</td>
			        				<td>
			        					<input type="text" class="form-control" name="email" id="email" placeholder="e-mail" oninput="checkEmailFind()" style="display: inline-block; width: 255px; vertical-align: middle;">
										<button class="btn btn-secondary member-button" type="button" id="email_auth_find">이메일 인증</button>
			        					<div class="join-fail-message" id="email_must" style="display: none;">필수입력 정보입니다.</div>
			        					<div class="join-fail-message" id="email_validation" style="display: none;">이메일 주소를 확인해주세요.</div>
										<div class="join-success-message" id="email_transfer" style="display: none;">인증번호가 전송되었습니다.<br>인증번호가 오지 않으면 입력하신 정보를 확인해주세요.</div>
			        				</td>
			        			</tr>
			        			<tr>
			        				<td class="align-middle">인증확인</td>
			        				<td>
			        					<input type="text" class="form-control" id="email_auth_input" placeholder="인증번호를 입력하세요." disabled style="display: inline-block; width: 255px; vertical-align: middle;">
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
						<button class="btn btn-secondary member-table" id="find_id_button" type="button">아이디 찾기</button>
					</div>
				</div>
			</div>
		</div>
    </div>
</div>