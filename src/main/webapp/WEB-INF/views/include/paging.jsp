<%@ page language="java" contentType="text/html; charSet=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="bottom_t">
	<div class="dataTables_paginate paging_full_numbers" id="DataTables_Table_0_paginate">
		<ul class="pagination">
						
				<c:choose>
					<c:when test="${param.pageNo eq param.firstPageNo}">
						<li class="paginate_button first disabled"><a href="#" class="first"><i class="fa fa-angle-double-left"></i></a></li>
						<li class="paginate_button previous disabled"><a href="#" class="prev"><i class="fa fa-angle-left"></i></a></li>
					</c:when>
					<c:otherwise>
						<li class="paginate_button first"><a href="javascript:goPage(${param.firstPageNo})" class="first"><i class="fa fa-angle-double-left"></i></a></li>
						<li class="paginate_button previous"><a href="javascript:goPage(${param.prevPageNo})" class="prev"><i class="fa fa-angle-left"></i></a></li>
					</c:otherwise>
				</c:choose>
				
				<c:forEach var="i" begin="${param.startPageNo}" end="${param.endPageNo}" step="1">
					<c:choose>
						<c:when test="${i eq param.pageNo}">
							<li class="paginate_button active"><a href="javascript:goPage(${i})" class="selected">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="paginate_button "><a href="javascript:goPage(${i})">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
					
				<c:choose>
					<c:when test="${param.pageNo eq param.finalPageNo}">
						<li class="paginate_button next disabled"><a href="#" class="next"><i class="fa fa-angle-right"></i></a></li>
						<li class="paginate_button last disabled"><a href="#" class="last"><i class="fa fa-angle-double-right"></i></a></li>
					</c:when>
					<c:otherwise>
						<li class="paginate_button next"><a href="javascript:goPage(${param.nextPageNo})" class="next"><i class="fa fa-angle-right"></i></a></li>
						<li class="paginate_button last"><a href="javascript:goPage(${param.finalPageNo})" class="last"><i class="fa fa-angle-double-right"></i></a></li>
					</c:otherwise>
				</c:choose>
		
		</ul>
	</div>
	
	<div class="dataTables_length">
		<label>전체 ${param.totalCount}개 / 행 표시 : </label>
		<select id="plant" name="plant" class="form-control input-sm" style="display:inline-block">
			<option value="100">100</option>
			<option value="50">50</option>
			<option value="20">20</option>
			<option value="10">10</option>
		</select>
	</div>
	
</div>