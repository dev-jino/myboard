<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- content -->
<div class="container m-3 board-detail-container">
    <div class="row hedaer justify-content-between">
    	<div class="col-xs-12">
    		<h1>자유게시판</h1>
    	</div>
    	<div class="col-md-9 board-header">
         	<span>글내용</span>
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row">
        <div class="col-md-9">
        	<!-- 글 내용 -->
        	<div class="row">
				<div class="panel panel-default detail-panel">
					<div class="panel-body">
						<form id="boardForm">
							<input type="text" name="idx" value="${boardIdx.idx}" hidden="hidden">
							<table class="table text-center detail-table">
								<tr>
				        			<td class="align-middle detail-table-first-td">${boardIdx.memberId}</td>
				        			<td class="detail-table-td">${boardIdx.regDate}</td>
									<td class="detail-table-td detail-table-td-rightside">조회 : ${boardIdx.hit}</td>
									<td class="detail-table-td detail-table-td-rightside">추천 : <span id="recommend_count">${boardIdx.recommend}</span></td>
			        			</tr>
			        			<tr>
				        			<td class="align-middle detail-table-first-td">제목</td>
									<td class="detail-table-td" colspan="3">
										${boardIdx.title}
									</td>
			        			</tr>
			        			<tr>
			        				<td class="align-middle detail-table-first-td">내용</td>
			        				<td class="text-left detail-table-content-td" colspan="3">
			        					<div>
				        					${boardIdx.content}
			        					</div>
			        				</td>
			        			</tr>
			        			<tr>
			        				<td class="text-left">
			        					<button class="btn btn-secondary" id="board_recommend_button" type="button">추천</button>
			        				</td>
			        			 	<td class="text-right" colspan="3">
			        			 		<c:if test="${loginMember.id == boardIdx.memberId}">
	 		        						<button class="btn btn-secondary" id="board_modify" type="button">수정</button>
			        						<button class="btn btn-secondary" id="board_remove" type="button">삭제</button>
			        			 		</c:if>
			        					<a href="${pageContext.request.contextPath}/"><button class="btn btn-secondary" type="button">목록</button></a>
			        				</td>
			        				
			        			</tr>
							</table>
						</form>
					</div>
					<!-- 댓글 -->
					<div class="panel-footer">
						<div id="comment-container">
							<div class="comment-form">
								<form action="" method="post" id="replyForm">
									<input type="text" name="boardIdx" id="boardIdx" value="${boardIdx.idx}" hidden="hidden">
									<input type="text" name="memberId" value="${loginMember.id}" hidden="hidden">
									<table class="table text-center">
										<tr>
											<td class="comment-input">
												<textarea class="form-control" id="reply_input_text" name="content" rows="3" placeholder="댓글을 입력해주세요"></textarea>
											</td>
											<td class="align-middle">
												<button class="btn btn-secondary" id="reply_regist_button" type="button">등록</button>
											</td>
										</tr>
									</table>
								</form>
							</div>
							<div id="comment-box">
								<ul class="comment-ul" id="reply_list_area">

								</ul>
							</div>
							<div id="comment-more">
								<a href= "javascript:void(0);" id="reply_more_button" style="">댓글 더 보기</a>
							</div>
						</div>
					</div>
				</div>
        	</div>
		</div>
        <div class="col-md-3">
        	<div class="text-white bg-secondary border border-primary text-center advertisement">광 고</div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	var startIndex = 1;
	var stepIndex = 5;
	var replyCount = 0;

	function getReplyList(startIndex) {
		var endIndex = startIndex + stepIndex - 1;
		$.ajax({
			url: 'reply_list',
			type: 'post',
			dataType: 'json',
			data: {
				boardIdx: ${boardIdx.idx},
				start: startIndex,
				end: endIndex
			},
			success: function(data) {
				var totalReplyCount = data.replyCount;
				var replyList = data.replyList;
				
 				for(var i = 0 ; i < replyList.length ; i++) {
					var str = "";
					if (replyList[i].status == 0) {
						str = str + '<li class="row comment-li">' +
										'<div id="comment-list">' +
											'<div class="comment-title">' +
												'<div class="comment-title-info">' +
													'<span>-</span>' +
												'</div>' +
											'</div>' +
										'</div>' +
										'<div class="comment-content">' +
											'<span>삭제된 댓글입니다.</span>' +
										'</div>' +
									'</li>';
					} else {
						str = str + '<li class="row comment-li">' +
										'<div id="comment-list">' +
											'<div class="comment-title">' +
												'<div class="comment-title-info">' +
													'<input type="text" name="commentIdx" value=' + replyList[i].idx + ' hidden="hidden">'+
													'<span>' + replyList[i].memberId + '</span>' +
													'<span> (' + replyList[i].regDate + ') </span>' +
												'</div>';
												
						if (replyList[i].memberId == "${loginMember.id}") {
							str = str + '<div class="comment-title-button">' +
											'<button class="comment-button" name="reply_modify_button">수정</button>' +
											'<button class="comment-button" name="reply_remove_button">삭제</button>' +
										'</div>';
						}
											
						str = str + '</div>' +
											'<div class="comment-content">' +
												'<span>' + replyList[i].content + '</span>' +
											'</div>' +
											'<div class="comment-modify" name="comment-modify-div" style="display:none">' +
												'<form action="" method="post" name="replyModifyForm" id="replyModifyForm">' +
													'<input type="text" name="idx" id="idx" value="'+ replyList[i].idx +'" hidden="hidden">' +
													'<table class="table text-center">' +
														'<tr>' +
															'<td class="comment-modify-input">' +
																'<textarea class="form-control" name="content" rows="3"></textarea>' +
															'</td>' +
															'<td class="align-middle">' +
																'<button class="btn btn-secondary reply_modify_complet_button" name="reply_modify_complet_button" type="button">수정</button>' +
																'<button class="btn btn-outline-secondary" name="reply_modify_cancel_button" type="button">취소</button>' +
															'</td>' +
														'</tr>' +
													'</table>' +
												'</form>' +
											'</div>' +
										'</div>' +
									'</li>';
					}
					$('#reply_list_area').append(str);
					replyCount++;
				}
 				
				if (replyCount >= totalReplyCount) {
					$('#comment-more').remove();
				}
			},
			error: function(error) {
				alert("error : " + error);
			}
		});
	}

	$(document).ready(function() {
		getReplyList(startIndex);
	});
	
	// 더보기
	$('#reply_more_button').on("click", function() {
		startIndex += stepIndex;
		getReplyList(startIndex);
	});
	
	// 댓글 로그인 확인
	$('#reply_input_text').on("click", function() {
		if("<c:out value='${loginMember.id}'/>" == '') {
			alert('로그인이 필요합니다.');
			$(location).attr('href', '${pageContext.request.contextPath}/login');
		} 
	});
	
	
	// 댓글 등록
	$('#reply_regist_button').on("click", function() {
		if($('#reply_input_text').val() == '') {
			alert('댓글을 입력해주세요.');
			$('#reply_input_text').focus();
			return ;
		}
		
		$.ajax({
			url: 'reply_write',
			type: 'post',
			dataType: 'text',
			data: $("#replyForm").serialize(),
			success: function(data) {
				$('#reply_list_area').empty();
				getReplyList(startIndex);
				$('#reply_input_text').val('');
			},
			error: function(request, error) {
				if (request.status == '999') {
					location.replace('/board/login');
				}
			}
		});
	});
	
	// 댓글 수정
	$('#reply_list_area').on("click", 'button[name="reply_modify_button"]', function() {
		var commentModifyArea = $(this).closest("li").find('div[name="comment-modify-div"]');
		var commentContent = $(this).closest("li").find('.comment-content').children('span:eq(0)').text();
		
		$(this).closest("li").find('textarea').val(commentContent);			
		commentModifyArea.show();
		$(this).closest("li").find('.comment-content').hide();
	});
	
	// 댓글 수정 완료
 	$('#reply_list_area').on("click", 'button[name="reply_modify_complet_button"]', function() {
		var commentModifyForm = $(this).closest("li").find('form[name="replyModifyForm"]');
		
		$.ajax({
			url: 'reply_modify',
			type: 'post',
			dataType: 'text',
			data: commentModifyForm.serialize(),
			success: function(data) {
				$('#reply_list_area').empty();
				getReplyList(startIndex);
			},
			error: function(error) {
				alert("error : " + error);
			}
		});
	});
	
	// 댓글 수정 취소
	$('#reply_list_area').on("click", 'button[name="reply_modify_cancel_button"]', function() {
		var commentContent = $(this).closest("li").find('.comment-content').children('span:eq(0)').text();
		
		$(this).closest("li").find('textarea').val(commentContent);
		$(this).closest("li").find('div[name="comment-modify-div"]').hide();
		$(this).closest("li").find('.comment-content').show();
	});
	
	// 댓글 삭제
	$('#reply_list_area').on("click", 'button[name="reply_remove_button"]', function() {
		var returnValue = confirm('삭제하시겠습니까?');
		
		if (returnValue == false) {
			return ;
		}
		var replyIdx = $(this).closest("li").find('input[name="commentIdx"]').val();

		$.ajax({
			url: 'reply_remove',
			type: 'post',
			dataType: 'text',
			data: {idx: replyIdx},
			success: function(data) {
				$('#reply_list_area').empty();
				getReplyList(startIndex);
			},
			error: function(error) {
				alert("error : " + error);
			}
		});
	});
	
	// 게시글 수정
 	$('#board_modify').on("click", function() {
 		var returnValue = confirm('수정하시겠습니까?');
 		
 		if (returnValue) {
			$(location).attr('href', '${pageContext.request.contextPath}/board_modify?idx=${boardIdx.idx}');
		} else {
			return ;
		}
 	});
	
	// 게시글 삭제
  	$('#board_remove').on("click", function() {
		var returnValue = confirm('삭제하시겠습니까?');
			
		if (returnValue) {
			$(location).attr('href', '${pageContext.request.contextPath}/board_remove?idx=${boardIdx.idx}');
		} else {
			return ;
		}
	});
	
	// 추천
  	$('#board_recommend_button').on("click", function() {
   		$.ajax({
			url: 'board_recommend',
			type: 'get',
			dataType: 'json',
			data: {boardIdx: ${boardIdx.idx}},
			success: function(data) {
 				var returnBoardRecommendCount = data.boardRecommendCount;
				var alertMsg = data.alertMsg;
			
				alert(alertMsg);
				
 				$('#recommend_count').html(returnBoardRecommendCount);
 			},
			error: function(request, error) {
				if (request.status == '999') {
					location.replace('/board/login');
				}
			}
   		});
  	});
</script>
