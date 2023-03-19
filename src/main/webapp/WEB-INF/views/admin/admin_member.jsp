<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- content -->
<div class="container m-3 main-container">
    <div class="row hedaer justify-content-between">
    	<div class="col-xs-12">
    		<h1>관리자 페이지</h1>
    	</div>
        <div class="col-md-9 total-member">
        	<span>전체 회원수 0명</span>
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row">
        <div class="col-md-9">
        	<div class="row">
	        	<table class="table text-center table-hover table-bordered" id="member">
	        		<thead class="table-dark">
	        			<tr>
			        		<th>아이디</th>
			        		<th>이름</th>
			        		<th>이메일</th>
			        		<th>상태</th>
		        		</tr>
	        		</thead>
	        		<tbody>
	        			<c:choose>
	        				<c:when test="${empty(memberList)}">
	        					<tr>
	        						<td colspan="4" class="align-middle">검색된 회원이 없습니다.</td>
	        					</tr>
	        				</c:when>
	        				<c:otherwise>
	        					<c:forEach var="member" items="${memberList}">
		        					<tr>
					        			<td class="align-middle">${member.id}</td>
					        			<td class="align-middle">${member.name}</td>
					        			<td class="align-middle">${member.email}</td>
					        			<td class="admin-member-status-td">
											<form method="post" id="member_status_form" action="${pageContext.request.contextPath}/admin_member">
											<input type="text" name="id" value="${member.id}" hidden="hidden">
											<select class="form-control m-0" name="status" onchange="this.form.submit()">
												<option value="0" 
													<c:if test="${member.status == 0}">selected = "selected"</c:if>>삭제회원</option>			
												<option value="1" 
													<c:if test="${member.status == 1}">selected = "selected"</c:if>>일반회원</option>			
												<option value="9" 
													<c:if test="${member.status == 9}">selected = "selected"</c:if>>관리자</option>			
											</select>
											</form>
										</td>
				        			</tr>
			        			</c:forEach>
	        				</c:otherwise>
	        			</c:choose>
	        			
	        		</tbody>
	        	</table>
        	</div>
	        
	        <!-- 페이징 처리 -->
		    <div class="row">
	        	<div class="col-xs-12">
	        		<ul class="pagination justify-content-center">		        			
	        			<li class="page-item disabled"><a class="page-link" href="" tabindex="-1" aria-disabled="true"><span aria-hidden="true">&laquo;</span></a></li>
	        			<li class="page-item"><a class="page-link" href="">1</a></li>
	        			<li class="page-item"><a class="page-link" href="">2</a></li>
	        			<li class="page-item"><a class="page-link" href="">3</a></li>
	        			<li class="page-item"><a class="page-link" href="">4</a></li>
	        			<li class="page-item"><a class="page-link" href="">5</a></li>
	        			<li class="page-item"><a class="page-link" href=""><span aria-hidden="true">&raquo;</span></a></li>
	        		</ul>
	        	</div>
	    	</div>
	    	
	    	<!-- 검색창 -->
	    	<div class="row">
	    		<form class="navbar-form row find-form" role="search">
	    			<div class="form-group m-1">
	    				<select class="form-control">
	    					<option>이름</option>
	    					<option>아이디</option>
	    					<option>이메일</option>
	    					<option>상태</option>
	    				</select>
	    			</div>
				    <div class="form-group m-1">
				        <input type="text" class="form-control" placeholder="Search">
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