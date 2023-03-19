<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container m-3 main-container">
    <div class="row hedaer justify-content-between">
    	<div class="col-xs-12">
    		<h1>아이디 찾기</h1>
    	</div>
    </div>
    <div class="row mt-3">
        <div class="col-md-12">
        	<div class="row member-row">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row mt-3 member-row">
					        <div class="col-xs-12 find-id-msg">
					        	<p class="my-3">${name}님의 아이디는 <span id="find-id-result">${id}</span> 입니다.</p>
					        </div>
				    	</div>
					</div>
				</div>
			</div>
			<div class="row">
		        <div class="col-xs-12 login-button-collection">
					<a href="${pageContext.request.contextPath}/find_password"><button type="button" class="btn btn-outline-secondary">비밀번호 찾기</button></a>
					<a href="${pageContext.request.contextPath}/"><button type="button" class="btn btn-secondary">홈으로</button></a>
		        </div>
	    	</div>
		</div>
    </div>
</div>