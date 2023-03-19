<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- content -->
<div class="container m-3 main-container">
    <div class="row hedaer justify-content-between">
    	<div class="col-xs-12">
    		<h1>자유게시판</h1>
    	</div>
        <div class="col-md-9 board-list-header">
        	<div>"${searchName}"에 대한 검색 결과</div>
        	<div>검색 게시글 ${totalBoard}개</div>
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row">
        <div class="col-md-9">
        	<div class="row">
	        	<table class="table text-center table-hover table-bordered">
	        		<thead class="table-dark">
	        			<tr>
			        		<th class="free-board-no">번호</th>
			        		<th class="free-board-title">제목</th>
			        		<th class="free-board-writer">글쓴이</th>
			        		<th class="free-board-date">날짜</th>
			        		<th class="free-board-like">추천</th>
			        		<th class="free-board-view">조회</th>
		        		</tr>
	        		</thead>
	        		<tbody>
		        		<c:choose>
		        			<c:when test="${empty(boardList)}">
	        					<tr>
	        						<td colspan="6" class="align-middle">검색된 게시글이 없습니다.</td>
	        					</tr>
		        			</c:when>
		        			<c:otherwise>
		        				<c:forEach var="board" items="${boardList}">		        				
				        			<tr>
				        				<c:choose>
				        					<c:when test="${board.status == 0}">
				        						<td class="free-board-remove-td align-middle">${board.idx}</td>
				        						<td class="free-board-remove-td align-middle" colspan="5">삭제된 게시글 입니다.</td>
				        					</c:when>
				        					<c:otherwise>
				        						<td class="align-middle">${board.idx}</td>
							        			<td class="align-middle" onclick="location.href='${pageContext.request.contextPath}/board_detail?idx=${board.idx}'" style="cursor:pointer;">${board.title} <span style="color:orange;">[${board.reply}]</span></td>
							        			<td class="align-middle">${board.memberId}</td>
							        			<td class="align-middle">${board.regDate}</td>
							        			<td class="align-middle">${board.recommend}</td>
							        			<td class="align-middle">${board.hit}</td>
				        					</c:otherwise>
				        				</c:choose>
				        			</tr>
		        				</c:forEach>
		        			</c:otherwise>
		        		</c:choose>
	        		</tbody>
	        	</table>
        	</div>
        	
	        <!-- 글쓰기 버튼 -->
		    <div class="row">
		        <div class="col-xs-12 board-button">
		        	<a href="${pageContext.request.contextPath}/board_write"><button class="btn btn-secondary" type="button">글쓰기</button></a>
		        </div>
		    </div>
	        
	        <!-- 페이징 처리 -->
		    <div class="row">
	        	<div class="col-xs-12 paging-div">
	        		<ul class="pagination justify-content-center">
        				<c:choose>
        					<c:when test="${not empty searchType}">
			        			<c:if test="${pagination.startPage > pagination.blockSize}">
			        				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/board_search?reqPage=${pagination.prevPage}&searchType=${searchType}&searchName=${searchName}"><span aria-hidden="true">&laquo;</span></a></li>
			        			</c:if>
			        			<c:if test="${pagination.startPage <= pagination.blockSize}">
			        				<li class="page-item disabled">
			        					<a class="page-link" href="" tabindex="-1" aria-disabled="true"><span aria-hidden="true">&laquo;</span></a>
			        				</li>
			        			</c:if>
		       			
			        			<c:forEach var="index" begin="${pagination.startPage}" end="${pagination.endPage}">
			        				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/board_search?reqPage=${index}&searchType=${searchType}&searchName=${searchName}">${index}</a></li>
			        			</c:forEach>
			        			
			        			<c:if test="${pagination.endPage != pagination.totalPage}">
				        			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/board_search?reqPage=${pagination.nextPage}&searchType=${searchType}&searchName=${searchName}"><span aria-hidden="true">&raquo;</span></a></li>
			        			</c:if>
			        			<c:if test="${pagination.endPage == pagination.totalPage}">
				        			<li class="page-item disabled"><a class="page-link" href="" tabindex="-1" aria-disabled="true"><span aria-hidden="true">&raquo;</span></a></li>
			        			</c:if>
        					</c:when>
        					<c:otherwise>
	        					<c:if test="${pagination.startPage > pagination.blockSize}">
			        				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/?reqPage=${pagination.prevPage}"><span aria-hidden="true">&laquo;</span></a></li>
			        			</c:if>
			        			<c:if test="${pagination.startPage <= pagination.blockSize}">
			        				<li class="page-item disabled">
			        					<a class="page-link" href="" tabindex="-1" aria-disabled="true"><span aria-hidden="true">&laquo;</span></a>
			        				</li>
			        			</c:if>
		       			
			        			<c:forEach var="index" begin="${pagination.startPage}" end="${pagination.endPage}">
			        				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/?reqPage=${index}">${index}</a></li>
			        			</c:forEach>
			        			
			        			<c:if test="${pagination.endPage != pagination.totalPage}">
				        			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/?reqPage=${pagination.nextPage}"><span aria-hidden="true">&raquo;</span></a></li>
			        			</c:if>
			        			<c:if test="${pagination.endPage == pagination.totalPage}">
				        			<li class="page-item disabled"><a class="page-link" href="" tabindex="-1" aria-disabled="true"><span aria-hidden="true">&raquo;</span></a></li>
			        			</c:if>
        					</c:otherwise>
        				</c:choose>
	        		</ul>
	        	</div>
	    	</div>
	    	
	    	<!-- 검색창 -->
	    	<div class="row">
	    		<form class="navbar-form row find-form" method="get" action="${pageContext.request.contextPath}/board_search">
	    			<div class="form-group m-1">
	    				<select class="form-control" name="searchType">
	    					<option value="title" <c:if test="${searchType == 'title'}">selected</c:if>>제목</option>
	    					<option value="writer" <c:if test="${searchType == 'writer'}">selected</c:if>>글쓴이</option>
	    					<option value="titleContent" <c:if test="${searchType == 'titleContent'}">selected</c:if>>제목+내용</option>	    					
	    				</select>
	    			</div>
				    <div class="form-group m-1">
				        <input class="form-control" name="searchName" type="text" placeholder="Search" value="${searchName}">
				    </div>
				    <button type="submit" class="btn btn-secondary btn-sm m-1">검색</button>
				</form>
	    	</div>
	    	
		</div>
        <div class="col-md-3">
        	<div class="text-white bg-secondary border border-primary text-center advertisement">광 고</div>
        </div>
    </div>
</div>