<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- content -->
<div class="container m-3 main-container">
    <div class="row hedaer justify-content-between">
    	<div class="col-xs-12">
    		<h1>자유게시판</h1>
    	</div>
	        <div class="col-md-9 board-header">
        	<span>글수정</span>
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row">
        <div class="col-md-9">
        	<!-- 글수정 양식 -->
        	<div class="row">
				<div class="panel panel-default detail-panel">
					<div class="panel-body">
						<form id="boardModifyForm" action="${pageContext.request.contextPath}/board_modify" method="post">
							<input type="text" name="idx" value="${boardIdx.idx}" hidden="hidden">
							<table class="table text-center table-bordered">
			        			<tr>
				        			<td class="align-middle">제목</td>
									<td>
										<input type="text" class="form-control" placeholder="제목을 입력해주세요." name="title" value="${boardIdx.title}" required>
									</td>
			        			</tr>
			        			<tr>
			        				<td class="align-middle">내용</td>
			        				<td>
			        					<textarea class="form-control" rows="10" placeholder="내용을 입력해주세요" name="content" required>${boardIdx.content}</textarea>
			        				</td>
			        			</tr>
							</table>
						</form>
					</div>
				</div>
        	</div>
        	
	        <!-- 글수정 버튼 -->
		    <div class="row">
		        <div class="col-xs-12 board-button">
		        	<button class="btn btn-secondary" type="submit" form="boardModifyForm">수정완료</button>
		        </div>
		    </div>
	    	
		</div>
        <div class="col-md-3">
        	<div class="text-white bg-secondary border border-primary text-center advertisement">광 고</div>
        </div>
    </div>
</div>
