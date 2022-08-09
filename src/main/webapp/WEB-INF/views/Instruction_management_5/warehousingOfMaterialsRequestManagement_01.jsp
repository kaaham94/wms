<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>
<!-- 종합현황 - 입고요청서관리  -->   
<%@ include file ="/WEB-INF/views/include/include_tap.jsp" %>
    
            <!-- Page Body -->
            <div class="page-body">
                <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					
						<div class="search_box_sub">  
							<form name="search" id="search">
								<input type="hidden" id="MANDT" name="MANDT" value="100">
								<input type="hidden" id="USERID" name="USERID" value="20160000">
								
								
								<div class="col-sm-4">   
									<div class="input-group ">
										<div class="col-sm-1">   
											<label>
												<input name="DATEFLAG"  type="radio" value="E" >
												<span class="text"></span>
											</label>
										</div>
									
										<div class="col-sm-6">   	
											<div class="input-group table-responsive">
											<span class="input-group-btn">
												<span class="form-control" style="width:100px;">입고예정일</span>
											</span>
											<input value="" id="SEINDT" name="SEINDT" type="text" data-date-format="YYYYMMDD" class="form-control datetimepicker">		
											</div>
										</div> 								
										
										<div class="col-sm-1">   
											<span> ~ </span>
										</div>
										
										<div class="col-sm-4">   	
											<input value="" id="EEINDT" name="EEINDT" type="text" data-date-format="YYYYMMDD" class="form-control datetimepicker">
										</div>		
									</div>
									
									<div class="input-group ">
										<div class="col-sm-1">   
											<label>
										
												<input name="DATEFLAG"  type="radio" value="B" >
												<span class="text"></span>
											</label>
										</div>
									
										<div class="col-sm-6">   	
											<div class="input-group table-responsive">
											<span class="input-group-btn">
												<span class="form-control" style="width:100px;">입고요청일</span>
											</span>
											<input value="" id="SBEDAT" name="SBEDAT" type="text" data-date-format="YYYYMMDD" class="form-control datetimepicker">		
											</div>
										</div> 								
										
										<div class="col-sm-1">   
											<span> ~ </span>
										</div>
										
										<div class="col-sm-4">   	
											<input value="" id="EBEDAT" name="EBEDAT" type="text" data-date-format="YYYYMMDD" class="form-control datetimepicker">
										</div>		
									</div>
									
									<div class="col-sm-12"> 
										<div class="input-group table-responsive">
											<span class="input-group-btn">
												<span class="form-control" style="width:100px;">제조사</span>
											</span>
											<select id="LIFNR" name="LIFNR" class="form-control" value="" style=""></select>
										</div>
									</div>
								</div>		
								
								<div class="col-sm-3">   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">법인</span>
										</span>
										<select id="WERKS" name="WERKS" class="form-control" value="" style=""></select>
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">공급처</span>
										</span>
										<select id="CUSTCD" name="CUSTCD" class="form-control" value="" style=""></select>
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">작성자</span>
										</span>
										<select id="MKUSER" name="MKUSER" class="form-control" value="" style=""></select>
									</div>
								</div>
								
								<div class="col-sm-3">   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">저장위치</span>
										</span>
										<select id="LGORT" name="LGORT" class="form-control" style=""></select>
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">품번</span>
										</span>
										<input type="text" id="MAKTX" name="MAKTX" value="" onblur="removeSpace(this);" class="form-control">
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">입고요청번호</span>
										</span>
										<input type="text" id="EBELN" name="EBELN" value="" onblur="removeSpace(this);" class="form-control">
									</div>
								</div>
								
								<div class="col-sm-2">
									<div class=" table-responsive"> 
										<button type="button" id="searchButton" style="margin-bottom: 30px;" class="btn btn-lg btn-block btn-primary search" onclick="javascript:frmScanSubmit();"><i class="fa fa-search"></i> Search</button>
									</div>
									
									<div class=""> 
										<div class="input-group-btn" >
											<label>
												<input type="checkbox" name="VIEWALL" id="VIEWALL" value="Y"><span class="text">미마감 전체 조회</span>
	    									</label>
	   									</div>
  									</div>
								</div>
						
								
						
							</form>
						</div>
						
						<div class="search_box">
							<div class="search_box_sub">  
							<form name="search3" id="search3">
								<input type="hidden" id="MANDT" name="MANDT" value="100">
								<input type="hidden" id="USERID" name="USERID" value="20160000">
								
								<div class="col-sm-5"> 
									<div class="col-sm-5"> 
										<div class="input-group table-responsive">
											<span class="input-group-btn">
												<span class="form-control" style="width:100px;">입고예정일</span>
											</span>
											<input value="" id="DATE" name="DATE" type="text" data-date-format="YYYY-MM-DD" class="form-control datetimepicker">		
										</div>
										<div class="input-group table-responsive">
											<span class="input-group-btn">
												<span class="form-control" style="width:100px;">입고요청구분</span>
											</span>
											<select id="BSART" name="BSART" class="form-control" value="" style=""></select>
										</div>
										<div class="input-group table-responsive">
											<span class="input-group-btn">
												<span class="form-control" style="width:100px;">배송방법</span>
											</span>
											<select id="BSART" name="BSART" class="form-control" value="" style=""></select>
										</div>
									</div>

									<div class="col-sm-7"> 
										<div class="input-group table-responsive">
											<span class="input-group-btn">
												<span class="form-control" style="width:100px;">법인</span>
											</span>
											<select id="BSART" name="BSART" class="form-control" value="" style=""></select>
										</div>
										<div class="input-group table-responsive">
											<span class="input-group-btn">
												<span class="form-control" style="width:100px;">저장위치</span>
											</span>
											<select id="BSART" name="BSART" class="form-control" value="" style=""></select>
										</div>
										<div class="input-group table-responsive">
											<span class="input-group-btn">
												<span class="form-control" style="width:100px;">공급처</span>
											</span>
											<select id="BSART" name="BSART" class="form-control" value="" style=""></select>
										</div>
									</div>
									
									<div class="col-sm-12">
										<div class="input-group table-responsive">
											<span class="input-group-btn">
												<span class="form-control" style="width:100px;">입고요청비고</span>
											</span>
											<input value="" id="DATE" name="DATE" type="text" data-date-format="YYYY-MM-DD" class="form-control datetimepicker">		
										</div>
									</div>
									<div class="col-sm-2"> 
   										 <a class="btn btn-default" id="adder"><i class="fa fa-plus"></i>신규</a>
								    </div>
									<div class="col-sm-3"> 
   										 <a class="btn btn-default" id="adder">데이터 재적용</a>
								    </div>
								</div>
								
								<div class="col-sm-4 "> 
									<div class="input-group">
										<span class="input-group-btn">
											<span class="form-control" style="width:85px;">첨부파일1</span>
										</span>
										<input type="text" id="BELN" name="BELN" value="" onblur="removeSpace(this);" class="form-control">
										<span class="input-group-btn">                          
											<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">파일첨부</button>
											<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">파일다운</button>
											<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">x</button>
										</span>
									</div>
		
									<div class="input-group">
										<span class="input-group-btn">
											<span class="form-control" style="width:85px;">첨부파일2</span>
										</span>
										<input type="text" id="BELN" name="BELN" value="" onblur="removeSpace(this);" class="form-control">
										<span class="input-group-btn">                          
											<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">파일첨부</button>
											<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">파일다운</button>
											<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">x</button>
										</span>
									</div>
		
									<div class="input-group">
										<span class="input-group-btn">
											<span class="form-control" style="width:85px;">첨부파일3</span>
										</span>
										<input type="text" id="BELN" name="BELN" value="" onblur="removeSpace(this);" class="form-control">
										<span class="input-group-btn" style="width:40px;">                          
											<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">파일첨부</button>
											<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">파일다운</button>
											<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">x</button>
										</span>
									</div>
									
									<div class="input-group">
										<span class="input-group-btn">
											<span class="form-control" style="width:85px;">첨부파일4</span>
										</span>
										<input type="text" id="BELN" name="BELN" value="" onblur="removeSpace(this);" class="form-control">
										<span class="input-group-btn" style="width:40px;">                          
											<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">파일첨부</button>
											<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">파일다운</button>
											<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">x</button>
										</span>
									</div>
									
									<div class="input-group">
										<span class="input-group-btn">
											<span class="form-control" style="width:85px;">첨부파일5</span>
										</span>
										<input type="text" id="BELN" name="BELN" value="" onblur="removeSpace(this);" class="form-control">
										<span class="input-group-btn" style="width:40px;">                          
											<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">파일첨부</button>
											<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">파일다운</button>
											<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">x</button>
										</span>
									</div>
									
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:85px;">첨부파일6</span>
										</span>
										<input type="text" id="BELN" name="BELN" value="" onblur="removeSpace(this);" class="form-control">
										<span class="input-group-btn" style="width:40px;">                          
											<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">파일첨부</button>
											<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">파일다운</button>
											<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">x</button>
										</span>
									</div>

									<!-- button type="button" class="btn btn-default shiny pull-right" onclick="javascript:REPRINT();"><i class="fa fa-download"></i> 전체다운</button -->
									<!-- button type="button" class="btn btn-default shiny pull-right" onclick="javascript:REPRINT();" style="right:10px;"><i class="fa fa-floppy-o"></i> 첨부파일 등록</button -->
								</div>	
			
								<div class="col-sm-3 ">
  									<div class="col-sm-12 "> 
   	 									<table class="table table-striped table-bordered" style="margin-top:50px;">
											<tbody>
												<tr>
													<td class=" text-align-center " style="background-color:#d73d32; border-color:#d73d32;   color:#ffffff; font-size:20px">수정중</td>
												</tr>
												<tr>
													<td style="font-size:20px; border:1px #555 solid; background-color: #606578; color:#ffffff;">총수량</td>
												</tr>
												<tr>
													<td style="font-size:25px; font-weight:bold; ">31,40000000</td>
												</tr>
											</tbody>
										</table>
    								</div>
								</div>
								
							</form>
							</div>
						</div>
					
					
<style>
.table.table-bordered th { top: -1px; }
.tableFixHead          { overflow-x: hidden; overflow-y: auto;   overflow:auto; width:100%; }
.tableFixHead thead th { position: sticky; top: 0; }
input[type=checkbox] { width: 5px; height: 1px; position: static;}
input[type=checkbox] + .text { position: static;}

/*datetimepicker 추가시, .tableFixHead를 넣어줘야 디자인이 안깨짐*/ 
.tableFixHead td, .tableFixHead th {
 /*  width: 300px;*/
  border: 1px solid #000;
  width: 100px;
}

.textFixing {
  display: inline-block;
  position: sticky;
  top: 100px;
  /*width: 80px; */
  /*height: 90px; */
  /*background: blue;*/
}

.tableFixHead table {
  table-layout: fixed;
  /*border-collapse:separate;*/
  border-spacing: 0px;
}

.rowspan1, .fixedColum1 {
  position:sticky;
  left:0;
  z-index:1;
  background-color:#f9f9f9;
}
.fixedColum1{z-index:2;}

.rowspan2, .fixedColum2 {
  position:sticky;
  left:100px; 
  z-index:1;
  background-color:#f9f9f9;
}
.fixedColum2{z-index:2;}

.rowspan3, .fixedColum3 {
  position:sticky;
  left:200px; 
  z-index:1;
  background-color:#f9f9f9; 
}
.fixedColum3{z-index:2;}

</style>
					
						<div class="widget ">  
							<div class="widget-header">
								<div class="widget-buttons" style="display: block">
									<div class="pull-left">
									    <a class="btn btn-default" id="adder"><i class="fa fa-plus"></i>신규  </a>
									    <a class="btn btn-default" id="excel"><i class="fa fa-plus"></i>엑셀 붙여넣기  </a>
									    <a class="btn btn-warning" id="res"><i class="fa fa-floppy-o"></i> 신규저장 </a>
									    <a class="btn btn-primary" id="updateButton"><i class="fa fa-pencil " aria-hidden="true"></i> 수정 </a>
									<a href="#" id="execute" data-toggle="modal" data-target=".modal" ><span class="label label-success"> 답변완료</span></a>
									</td>
									</div>            
									<div class="pull-right">	
										<button type="button" class="btn btn-default" onclick="javascript:fn_excel_now_down()"><i class="fa fa-download"></i> Excel-현재</button>
										<button type="button" class="btn btn-default" onclick="javascript:fn_excel_all_down()"><i class="fa fa-download"></i> Excel-전체</button>
									
									</div>
								</div>
							</div>
							
							<div id="scroll_top_table" class="table-responsive tableFixHead " style="height:270px;">
								<table id="top_table" class="table table-bordered table-striped table-condensed ">
									<colgroup>
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 120px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 100px;">  
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 40px;">  
										<col style="width: 50px;">
										<col style="width: 80px;">
										<col style="width: 100px;">  
										<col style="width: 140px;">
										<col style="width: 100px;">
										<col style="width: 70px;">  
										<col style="width: 80px;">
										<col style="width: 50px;">  
										<col style="width: 50px;">
										<col style="width: 100px;">
										<col style="width: 70px;">  
										<col style="width: 70px;">
										<col style="width: 70px;">
										<col style="width: 90px;">  
										<col style="width: 180px;">
										<col style="width: 140px;">  
										<col style="width: 200px;">
										<col style="width: 70px;">
									</colgroup>
									<thead>
										<tr>
											<th class="fixedColum1">입고요청구분</th>
											<th class="fixedColum2">입고예정일</th>
											<th>법인</th>
											<th>저장위치</th>
											<th>공급처</th>
											<th>배송방법</th>
											<th>입고요청번호</th>
											<th>상태</th>
											<th>하차</th>
											<th><label><input type='checkbox' id='chkAll'/><span class='text'></span></label></th>
											<th>순번</th>
											<th>제조사</th>
											<th>품번</th>
											<th>WMS코드</th>
											<th>입고검사</th>
											<th>긴급</th>
											<th>MOQ</th>
											<th>BOX</th>
											<th>입고 요청수량</th>
											<th>라벨수량</th>
											<th>입고수량</th>
											<th>불량수량</th>
											<th>입고요청일</th>
											<th>출하예정처</th>
											<th>출고유형</th>
											<th>비고</th>
											<th>순번비고</th>
										</tr>
									</thead>
									<tbody>
									
									</tbody>
								</table>
							</div>
							
							<div id="scroll_bottom_table" class="table-responsive tableFixHead" style="height:270px;">
								<table id="bottom_table" class="table table-bordered table-striped table-condensed ">
									<colgroup>
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 130px;">   
										<col style="width: 70px;">
										<col style="width: 100px;">
										<col style="width: 70px;">
										<col style="width: 100px;">
										<col style="width: 70px;">
										<col style="width: 100px;">
										<col style="width: 160px;">
										<col style="width: 70px;">
										<col style="width: 70px;">
										<col style="width: 70px;">
										<col style="width: 100px;">  
										<col style="width: 120px;">
										<col style="width: 100px;">
										<col style="width: 100px;">  
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 100px;">  
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 290px;">  
										<col style="width: 200px;">
										<col style="width: 100px;">
										<col style="width: 100px;">  
										<col style="width: 100px;">
										<col style="width: 100px;">
									</colgroup>
									<thead>
									<tr>
										<th class="fixedColum1">입고요청번호</th>
										<th class="fixedColum2">입고요청구분</th>
										<th class="fixedColum3">입고예정일</th>
										<th>법인</th>
										<th>저장위치</th>
										<th>공급처</th>
										<th>첨부파일</th>
										<th>상태</th>
										<th>하차</th>
										<th>배송방법</th>
										<th>순번</th>
										<th>제조사</th>
										<th>품번</th>
										<th>WMS코드</th>
										<th>입고검사</th>
										<th>긴급</th>
										<th>MOQ</th>
										<th>BOX</th>
										<th>입고 요청수량</th>
										<th>라벨수량</th>
										<th>입고수량</th>
										<th>불량수량</th>
										<th>출하예정처</th>
										<th>출고유형</th>
										<th>입고요청일</th>
										<th>비고</th>
										<th>순번비고</th>
										<th>생성일</th>
										<th>생성자</th>
										<th>수정일</th>
										<th>수정자</th>
									</tr>
									</thead>
									<tbody>
									
									</tbody>
								</table>
							</div>				
						</div>				
					
					
					</div><!-- /col-lg-12 col-md-12 col-sm-12 col-xs-12 -->
				 </div><!-- /row -->			
            </div><!-- /Page Body -->
            
                <div class="bottom_t">
					<div class="dataTables_length">
						<label id="TOTAL_COUNT"></label>
					</div>
				</div>
				
            <footer class="text-center mb20">Copyright © WareHouse Management System. All Rights Reserved.</footer>
        </div><!-- /Page Content -->
    </div><!-- /Page Container -->
</div><!-- Main Container -->



<style>

.popupFixHead          { overflow-x: hidden; overflow-y: auto; height: 600px; }

</style>
<!-- 팝업 -->
<div class="modal fade modal_status" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-big "  >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                	<i class="fa fa-picture-o" aria-hidden="true"></i> 파일명 :
                	<span class="word-title" id="popup_FILENAME" value=""></span>
                </h4>
            </div>

            <div class="modal-body common_popup padding-bottom-50 popupFixHead">
			
				<p class="font-120 padding-top-10">
					업체명 : <span class="word-title" id="company_view" value="">(주)크리버코리아 / MES / 무상</span>
				</p>
				<div class="form-group sub">
					<div class="col-sm-12">
						<textarea id="labors" name="labors" style="overflow-y: auto; height:400px; width:100%"></textarea>
					</div>
					<!--label class="col-sm-2 control-label no-padding-right">엑셀파일 업로드</label>
					<div class="col-sm-4">
						<input type="file" class="form-control" id="pw" name="pw" value="" style="height:50px;">
						엑셀 파일 업로드 양식에 맞게 기입하신 뒤 업로드해 주세요<br />
						<a href="http://club.koreadaily.com/pds_update/img_20110521111007.jpg">엑셀 업로드 양식 다운로드</a> 
					</div-->
				</div>		
            </div>
			
            <div class="modal-footer text-align-center">
                <button type="button" class="btn btn-lg btn-blue" id="save2">이미지 저장</button>
                <button type="button" class="btn btn-lg btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<form id="search2" name="search2" >
	<input type="hidden" id="MANDT"		xxxname="MANDT"		value=""	/>
	<input type="hidden" id="WERKS" 	name="WERKS" 		value=""	/>	
	<input type="hidden" id="LGORT"		name="LGORT"		value=""	/>
	<input type="hidden" id="LIFNR"		name="LIFNR"		value=""	/>
	<input type="hidden" id="MAKTX"		name="MAKTX"		value=""	/>
	<input type="hidden" id="CUSTCD"	name="CUSTCD"		value=""	/>  
	<input type="hidden" id="EBELN"		name="EBELN"		value=""	/>
	<input type="hidden" id="MKUSER"	name="MKUSER"		value=""	/>
	<input type="hidden" id="SBEDAT"	name="SBEDAT"		value=""	/>
	<input type="hidden" id="EBEDAT"	name="EBEDAT"		value=""	/>
	<input type="hidden" id="SEINDT"	name="SEINDT"		value=""	/>  
	<input type="hidden" id="EEINDT"	name="EEINDT"		value=""	/>
	<input type="hidden" id="DATEFLAG" 	name="DATEFLAG" 	value=""	/>
	<input type="hidden" id="VIEWALL" 	name="VIEWALL" 		value=""	/>  
	<input type="hidden" id="USERID"	name="USERID"		value=""	/>
</form>



<%@ include file ="/WEB-INF/views/include/include_footer.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_foot.jsp" %>

	<form id="frmDownloadExcel" method="post" action="/sample/openExcel_down.do">
		<input type="hidden" id="pageStart" name="pageStart" value="${map.START}" />				
		<input type="hidden" id="pageEnd" name="pageEnd" value="${map.END}" />						
		
		<input type="hidden" id="search_date" name="search_date" value="${map.search_date}" />	
		<input type="hidden" id="search_date_start" name="search_date_start" value="${map.search_date_start}" />   
		<input type="hidden" id="search_date_end" name="search_date_end" value="${map.search_date_end}" />   
		
		<input type="hidden" id="search_detail" name="search_detail" value="${map.search_detail}" /> 		   	  
		<input type="hidden" id="search_detail_txt" name="search_detail_txt" value="${map.search_detail_txt}" />
		
		<input type="hidden" id="param" name="param" value="" />
	</form>

	<form id="frmDownloadExcel" method="post" action="/sample/openExcel_down.do">xxxxxxxxxxxxxxxxxxx
	
		<input type="hidden" id="pageStart" name="pageStart" value="${map.START}" />				
		<input type="hidden" id="pageEnd" name="pageEnd" value="${map.END}" />						
		
		<input type="hidden" id="search_date" name="search_date" value="${map.search_date}" />	
		<input type="hidden" id="search_date_start" name="search_date_start" value="${map.search_date_start}" />   
		<input type="hidden" id="search_date_end" name="search_date_end" value="${map.search_date_end}" />   
		
		<input type="hidden" id="search_detail" name="search_detail" value="${map.search_detail}" /> 		   	  
		<input type="hidden" id="search_detail_txt" name="search_detail_txt" value="${map.search_detail_txt}" />
		
		<input type="hidden" id="param" name="param" value="" />
	</form>


<script type="text/javascript">
/*
$('.modal').modal({
    backdrop: false
});
*/
$(document).on('click','[id="save2"]',function(e){
//	alert(document.all[id="labors"].value);
	var tttt = document.all[id="labors"].value;
	//tttt = tttt.replace(/\t/gi, "||");
	
	tttt = tttt.replace(/\n/g, '***');//행바꿈제거
	tttt = tttt.split('***');
	
	alert(tttt.length);
	var insertArray = [];
	var test222 = [];
	for(var i = 0; i<tttt.length; i++){
		
		test222 = tttt[i].replace(/\t/gi, "||"); 
		test222 = test222.split("||");
		
		
		insertArray.push({
			M1 	: test222[0],
			M2 	: test222[1],
			M3 	: test222[2],  //품번
			M4	: test222[3],  //라벨품번
			M5	: test222[4],  //유라품번
			M6	: test222[5],  //품번유형(select)	 
			M7	: test222[6],  //제조사	(select)	
			M8	: test222[7],  //구분
			M9	: test222[8],  //포장단위
			M10	: test222[9],  //PPQ
			M11	: test222[10],  //MOQ
			M12	: test222[11]  //MPQ
		});
		
		/*
		//공백 validation 체크 
		if(insertArray[i].M1 == ""){
			alert("M1이 공백입니다.");
			save_chk = false;
			break;
		};
		
		if(insertArray[i].MAKTXLABEL == ""){
			alert("라벨품번이 공백입니다.");
			save_chk = false;
			break;
		};
		*/
	}
	
	alert(insertArray[0].M1 +"\n"+insertArray[1].M1+"\n"+insertArray[2].M1)
	
	var list = ""; 
	for(var i = 0 ; i < insertArray.length-1 ; i++ ){
		
			list += "<tr name='defaultTd'>"+
					"	<input type='hidden='' id='' name=''>"
					"    <td class='text-align-center'>"+ data['list'][i].T_HR +"</td>"+ 					//시간
					"    <td class='text-align-center'>"+ data['list'][i].T_HR +"</td>"+ 					//시간
					
					"    <td class='text-align-left'>"+ numberWithCommas(data['list'][i].BCQTY) +"</td>"+ 	//수량	
					"    <td class='text-align-left'>"+ data['list'][i].BOXCNT +"</td>"+					//박스
					
					
						"<td class='progress progress-lg progress-bordered' style='width:300px; '>"+
						//"("+totalPercent +"/"+ data['list'][i].BCQTY +") *100 = " + result
							"<div class='progress-bar progress-bar-darkorange' style='width:"+result+"%' role='progressbar' aria-valuenow='40%' aria-valuemin='30%' aria-valuemax='100'>"+
								//"<span id='percent'>"+ data['list'][i].BCQTY+"</span>"+   
							"</div>"+
							"<form id='tr_"+i+"'>"+	
								"<input type='hidden'	name='MANDT' 	 id='MANDT' 		value='"+MANDT+"'>"		+
								"<input type='hidden'	name='WERKS' 	 id='WERKS' 		value='"+data['list'][i].WERKS+"'>"		+	//법인
								"<input type='hidden'	name='LGORT' 	 id='LGORT' 		value='"+data['list'][i].LGORT+"'>"		+	//저장위치
								"<input type='hidden'	name='SEQ' 		 id='SEQ' 		value='"+data['list'][i].SEQINX+"'>"	+	//SEQINDX
								"<input type='hidden'	name='HH' 		 id='HH' 			value='"+data['list'][i].T_HR+"'>"		+	//시간
								"<input type='hidden'	name='SUDAT_S' 	 id='SUDAT_S'		value='"+data['list'][i].SUDAT_S+"'>"	+	//수불일자_S
								"<input type='hidden'	name='SUDAT_E' 	 id='SUDAT_E'		value='"+data['list'][i].SUDAT_E+"'>"	+   //수불일자_E
								"<input type='hidden'	name='CRDTC_S' 	 id='CRDTC_S'		value='"+data['list'][i].CRDTC_S+"'>"	+   //실적일자_S
								"<input type='hidden'	name='CRDTC_E' 	 id='CRDTC_E'		value='"+data['list'][i].CRDTC_E+"'>"	+   //실적일자_E
								"<input type='hidden'	name='MATNR' 	 id='MATNR' 		value='"+data['list'][i].MATNR+"'>"		+   //품목코드
								"<input type='hidden'	name='LIFNR' 	 id='LIFNR' 		value='"+data['list'][i].LIFNR+"'>"		+   //공급처
								"<input type='hidden'	name='BWART_1' 	 id='BWART_1'		value='N'>"				+   //현창입고
								"<input type='hidden'	name='BWART_2' 	 id='BWART_2'		value='Y'>"             +   //구매입고
								"<input type='hidden'	name='BWART_3' 	 id='BWART_3'		value='N'>"             +   //이전입고
								"<input type='hidden'	name='BWART_4' 	 id='BWART_4'		value='N'>"             +   //기타입고
								"<input type='hidden'	name='USERID' 	 id='USERID' 		value='"+user+"'>"      +   //사용자
							"</form>"+
						"</td>"+
					"</tr>";
	}
		
	$('#left_table tbody').append(list);
	
});	



//하단 데이터 클릭 시, 윗측 테이블 불러오기 
$(document).on('click','#bottom_table [name="defaultTd"]',function(e){
	
	if(confirm("현재 수정중인 입고요청서가 있습니다.\n현재 선택한 입고요청서 수정으로 변경하시겠습니까?")) {
	 
	    $("#chkAll").prop("checked", false); //전체체크 해제	
		var EBELN =  $(this).children().eq(0).val(); 	//입고요청번호
		
		var BSART =  $(this).children().eq(1).val();	//입고요청구분
		
		var SEINDT =  $(this).children().eq(2).val();	//입고예정일
			SEINDT = SEINDT.replace(/-/gi, "");				//하이픈(-) 제거
		
		var SBEDAT =  $(this).children().eq(3).val();	//입고요청일
			SBEDAT = SBEDAT.replace(/-/gi, "");				//하이픈(-) 제거

		//var WERKS =  $(this).children().eq(3).text();	//법인
		var WERKS = ""	//법인
		//var LGORT =  $(this).children().eq(4).text();	//저장위치
		var LGORT = "";
		//var LIFNR =  $(this).children().eq(5).text();	//공급처
		var LIFNR = "";
		                  
		//체크박스 
		var DATEFLAG = $("input[name='DATEFLAG']:checked").val();
		var USERID = getCookie("sys_member_id"); //로그인시 세션값(=사용자)
		var MANDT = $('#MANDT').val();
		
		
		$('#search2').children('#MANDT').val(MANDT);       
		$('#search2').children('#WERKS').val(WERKS);       
		$('#search2').children('#LGORT').val(LGORT);       
		$('#search2').children('#LIFNR').val(LIFNR);       
		$('#search2').children('#MAKTX').val();          	
		$('#search2').children('#CUSTCD').val();      		
		$('#search2').children('#EBELN').val(EBELN);       
		$('#search2').children('#MKUSER').val();           
		$('#search2').children('#SBEDAT').val(SBEDAT);     
		$('#search2').children('#EBEDAT').val(SBEDAT);     
		$('#search2').children('#SEINDT').val(SEINDT);     
		$('#search2').children('#EEINDT').val(SEINDT);     
		$('#search2').children('#DATEFLAG').val(DATEFLAG);
		$('#search2').children('#VIEWALL').val('N');  
		$('#search2').children('#USERID').val(USERID);     

		var params = jQuery("#search2").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.

		// ajax({ 시작	
		$.ajax({
			url : '/WMS/Instruction_management_5/warehousingOfMaterialsRequestManagement_01Select_bottom.do',
			type: "post",
			dataType : 'json',
			data: params,
			async: false,
			processData: false,
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			cache: false,
			timeout: 600000,
			success : function(data){

				$('#top_table tbody').html('');
				
				var list ="";
			
				var MANDT = $("#MANDT").val();
				var user = getCookie("sys_member_id");
				var disabled = "";		
				var disabledName = "";
				
				Select_array_LFART =  new Array(); 		//출고유형 
				Select_array_LFART = data['Select_LFART'];
			
				Select_array_OUTCUST =  new Array(); 		//출하예정처 
				Select_array_OUTCUST = data['Select_OUTCUST'];
			
				for(var i = 0 ; i < data['list'].length-3 ; i ++ ){
			
					//저장위치
					if(data['list'][i].rowspan2 !== undefined){
						rowspan1 = "<td style='vertical-align:top;' class='text-align-center rowspan1' style='background-color: #f9f9f9; font-size:16px;' rowspan='"+data['list'][i].rowspan2+"'><b class='textFixing'>"+ data['list'][i].BSART +"</b></td>" 
					}else{
						rowspan1 ="";
					}
					
					//상태
					if(data['list'][i].rowspan3 !== undefined){
						rowspan2 = "<td style='vertical-align:top;' class='text-align-center rowspan2' style='background-color: #f9f9f9; font-size:16px;' rowspan='"+data['list'][i].rowspan3+"'><b class='textFixing'>"+ data['list'][i].EINDT +"</b></td>" 
					}else{
						rowspan2 ="";
					}

					//CLOSE 비활성화
					if(data['list'][i].STATUS == "CLOSE"){
						disabled = "disabled='true'";	
						disabledName = "";
					}else{
						disabled = "";
						disabledName = "chk[]";
					}
					
					
					list  += "<tr name='defaultTd'>"+
							
							rowspan1 +	//입고요청구분
							rowspan2 +	//입고예정일
							"<td class='text-align-center'>"+ data['list'][i].WERKS +"</td>"+     		//법인
							"<td class='text-align-center'>"+ data['list'][i].LGORT +"</td>"+			//저장위치	
							"<td class='text-align-center'>"+ data['list'][i].LIFNR +"</td>"+			//공급처
							"<td class='text-align-center'>"+ data['list'][i].SHGBN +"</td>"+ 			//배송방법 
							"<td class='text-align-center'>"+ data['list'][i].EBELN +"</td>"+ 			//입고요청번호 
							"<td class='text-align-center'>"+ data['list'][i].STATUS +"</td>"+ 			//상태
							"<td class='text-align-center'>"+ data['list'][i].ARRIVALFLAG +"</td>"+ 	//하차    
							"<td class='text-align-center'>"+											//선택
								"<label>"+			
									"<input "+disabled+" type='checkbox' name='"+disabledName+"' value='' onclick='check(this)'>"+
									"<span class='text'></span>"+		
								"</label>"+    
							"</td>"+
							"<td class='text-align-center'>"+ data['list'][i].EBELP +"</td>"+ 			//순번 
							"<td class='text-align-center'>"+ data['list'][i].CUSTCD +"</td>"+ 			//제조사 
							"<td class='text-align-center'>"+ data['list'][i].MAKTX +"</td>"+ 			//품번 
							"<td class='text-align-center'>"+ data['list'][i].MATNR +"</td>"+ 			//WMS코드  
							"<td class='text-align-center'>"+ data['list'][i].INSPECTIONFLAG +"</td>"+ 	//입고검사
							"<td class='text-align-center'>"+ data['list'][i].URGENTFLAG +"</td>"+ 		//긴급 
							"<td class='text-align-center'>"+ ( (data['list'][i].MOQ == undefined)? "" : data['list'][i].MOQ ) +"</td>"+ 		//MOQ 
							"<td class='text-align-center'>"+ data['list'][i].BOXCNT +"</td>"+ 			//BOX
							"<td class='text-align-center'>"+ data['list'][i].MENGE +"</td>"+ 			//입고 요청수량
							"<td class='text-align-center'>"+ data['list'][i].PRTQTY +"</td>"+ 			//라벨수량 
							"<td class='text-align-center'>"+ data['list'][i].PROCQTY +"</td>"+ 		//입고수량 
							"<td class='text-align-center'>"+ ( (data['list'][i].NGQTY == undefined)? "" : data['list'][i].NGQTY ) +"</td>"+ 	//불량수량 
							"<td class='text-align-center'>"+ data['list'][i].BEDAT +"</td>"+ 			//입고요청일 
							"<td class='text-align-center'>"+ data['list'][i].OUTCUST +"</td>"+ 		//출하예정처 
							"<td class='text-align-center'>"+ data['list'][i].LFART +"</td>"+ 			//출고유형 				
							"<td class='text-align-center'>"+ data['list'][i].REMARK +"</td>"+ 			//비고 
							"<td class='text-align-center'>"+ ( (data['list'][i].SREMARK == undefined)? "" : data['list'][i].SREMARK ) +"</td>"+ 	//순번비고 
						"</tr>";
				}
				
				$('#top_table tbody').append(list);
				$('#chkAll').trigger('click');
				//스크롤 영역 
			    //var scrollMove = {top:0 , left:240}; //스크롤 맨 위에 위치 
			 
			  	//$('html, #scroll_top_table').animate({//스크롤 위치 이동
				//    scrollTop: scrollMove.top
				//}, 0);
			},
			error : function(error){
				alert('error');
			}
		
		})// ajax({ 끝		
	    
	
	} else {
	    return false;
	}// if(confirm) 끝

	//alert(ROLLID);
	//right_table(MANDT, language, ROLLID, groupName)
	//e.target.parentNode.style.backgroundColor= "gold"; 

});	

	
//행 LFART Select 변환 함수
var Select_array_LFART = new Array();	
var appendSelect_array_LFART = function(val, color) {
	
	var td = val; 
	var td_texter = td.innerHTML; //td text값
	
	//td 속성 변경 
	td.style.backgroundColor = color; //배경색 변환
	td.innerHTML = ""; //공백값 변환 
	
	//Select 객체 생성 
	var selectObj = document.createElement('SELECT');
	selectObj.setAttribute("type", "text");
	selectObj.setAttribute("value", td_texter); //객체 자식노드값 추가 
	selectObj.setAttribute("style",  "width:100%"); //객체 style 속성 추가
	
	var OPT = new Array();  	//select option 객체
	var cnt;
	
	for(var i = 0 ; i < Select_array_LFART.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array_LFART[i].LFARTCODE);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_LFART[i].LFART ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_LFART[i].LFART){
			OPT[i].setAttribute('selected', 'selected');
		}		
	}	
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}
		
		
//행 OUTCUST Select 변환 함수
var Select_array_OUTCUST = new Array();	
var appendSelect_array_OUTCUST = function(val, color) {
	
	var td = val; 
	var td_texter = td.innerHTML; //td text값
	
	//td 속성 변경 
	td.style.backgroundColor = color; //배경색 변환
	td.innerHTML = ""; //공백값 변환 
	
	//Select 객체 생성 
	var selectObj = document.createElement('SELECT');
	selectObj.setAttribute("type", "text");
	selectObj.setAttribute("value", td_texter); //객체 자식노드값 추가 
	selectObj.setAttribute("style",  "width:100%"); //객체 style 속성 추가
	
	var OPT = new Array();  	//select option 객체
	var cnt;
	
	for(var i = 0 ; i < Select_array_OUTCUST.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array_OUTCUST[i].OUTCUSTCODE);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_OUTCUST[i].OUTCUST ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_OUTCUST[i].OUTCUST){
			OPT[i].setAttribute('selected', 'selected');
		}		
	}	
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}
 


//체크박스 전체 선택 
$("#chkAll").on("click", function() {
	
	var size = document.getElementsByName("chk[]").length; //총 row 수를 구한다.
	var chkAll = $(this).is(":checked");
	
	if (chkAll){	
		$("input[name='chk[]']").prop("checked", true);		
	}else{
		$("input[name='chk[]']").prop("checked", false);
	}

	//1. 체크박스 전체 체크
	if (chkAll){

			//3. 모든 row for문 체크  
			for(var i = 0; i < size; i++){
			
				var td = document.getElementsByName("chk[]")[i].parentNode.parentNode;
				
				var	td0 = td.nextElementSibling;  	//순번  
				var	td1 = td0.nextElementSibling; 	//제조사 
				var	td2 = td1.nextElementSibling; 	//품번 
				var	td3 = td2.nextElementSibling; 	//WMS코드 
				var	td4 = td3.nextElementSibling; 	//입고검사
				var	td5 = td4.nextElementSibling; 	//긴급 
				var	td6 = td5.nextElementSibling; 	//MOQ
				var	td7 = td6.nextElementSibling;	//BOX
				var	td8 = td7.nextElementSibling;	//입고 요청수량 
				var	td9 = td8.nextElementSibling; 	//라벨수량 
				var	td10 = td9.nextElementSibling; 	//입고수량 
				var	td11 = td10.nextElementSibling; //불량수량 
				var	td12 = td11.nextElementSibling; //입고요청일
				var	td13 = td12.nextElementSibling; //출하예정처
				var	td14 = td13.nextElementSibling; //출고유형
				var	td15 = td14.nextElementSibling; //비고 
				var	td16 = td15.nextElementSibling; //순번비고
		
				
					
			var mail_arr = 	[
						{  yesCheck: appendSelect, 						column: td4},  	//입고검사
						{  yesCheck: appendSelect, 						column: td5},   //긴급 
						{  yesCheck: appendInput, 						column: td8},   //입고 요청수량 
						{  yesCheck: appendSelect_array_OUTCUST, 		column: td13},  //출하예정처
						{  yesCheck: appendSelect_array_LFART, 			column: td14},  //출고유형
						{  yesCheck: appendSelect, 						column: td16} 	//순번비고
					];
	
				
				//4. input 태그 여부 확인
				inputValue = td4.childNodes[0].value; 
				if(inputValue === undefined ) {
	
					//5.1 추가된 행
					if(td0.parentNode.attributes.name.value == "mytr"){
	
						for (var prop in mail_arr) {
							td.style.backgroundColor = "gold";
							mail_arr[prop].yesCheck(mail_arr[prop].column, "gold");
						}
						
					//5.2 기존 행 
		        	}else if(td0.parentNode.attributes.name.value == "defaultTd"){
		        		
		        		//배열 azrr에 splice 메서드를 이용해 인덱스 1 부터 1개의 원소를 삭제
						mail_arr.splice(0, 1); //(코드 삭제)
						
		        		for (var prop in mail_arr) {
		        			td.style.backgroundColor = "#3fc21f";
		        			mail_arr[prop].yesCheck(mail_arr[prop].column, "#3fc21f");
						}
					}
				}
				
			}//3. 모든 row for문 체크 끝 
		
	}else{ //1.2 전체체크 해제
	
		//3. 모든 row for문 체크  
		for(var i = 0; i < size; i++){
		
			var td = document.getElementsByName("chk[]")[i].parentNode.parentNode;
			
			var	td0 = td.nextElementSibling;  	//순번  
			var	td1 = td0.nextElementSibling; 	//제조사 
			var	td2 = td1.nextElementSibling; 	//품번 
			var	td3 = td2.nextElementSibling; 	//WMS코드 
			var	td4 = td3.nextElementSibling; 	//입고검사
			var	td5 = td4.nextElementSibling; 	//긴급 
			var	td6 = td5.nextElementSibling; 	//MOQ
			var	td7 = td6.nextElementSibling;	//BOX
			var	td8 = td7.nextElementSibling;	//입고 요청수량 
			var	td9 = td8.nextElementSibling; 	//라벨수량 
			var	td10 = td9.nextElementSibling; 	//입고수량 
			var	td11 = td10.nextElementSibling; //불량수량 
			var	td12 = td11.nextElementSibling; //입고요청일
			var	td13 = td12.nextElementSibling; //출하예정처
			var	td14 = td13.nextElementSibling; //출고유형
			var	td15 = td14.nextElementSibling; //비고 
			var	td16 = td15.nextElementSibling; //순번비고
			
			var mail_arr = 	[
				{  noCheck: appendText,  		column: td4},  	//입고검사
				{  noCheck: appendText,  		column: td5},   //긴급 
				{  noCheck: appendText,  		column: td8},   //입고 요청수량 
				{  noCheck: appendText,  		column: td13},  //출하예정처
				{  noCheck: appendText,  		column: td14},  //출고유형
				{  noCheck: appendText,  		column: td16} 	//순번비고
			];
								
			//4. input 태그 여부 확인
			inputValue = td4.childNodes[0].value; 
			if(inputValue !== undefined ) {
				td.style.backgroundColor = "";
				//5.1 추가된 행
				if(td0.parentNode.attributes.name.value == "mytr"){

					for (var prop in mail_arr) {
						mail_arr[prop].noCheck(mail_arr[prop].column);
					}
					
				//5.2 기존 행 	
	        	}else if(td0.parentNode.attributes.name.value == "defaultTd"){
	        		
	        		//배열 arr에 splice 메서드를 이용해 인덱스 1 부터 1개의 원소를 삭제
					mail_arr.splice(0, 1); //(코드 삭제)
				
	        		for (var prop in mail_arr) {
						mail_arr[prop].noCheck(mail_arr[prop].column);
					}
				}
			}
		}//3. 모든 row for문 체크 끝 
	}
});	//체크박스 전체선택 끝
	

//체크박스 선택된 해당 열 선택    
function check(it) {
	
	td = it.parentNode.parentNode;//0. 공통작업- 선택 
	
	td0 = td.nextElementSibling;  	//순번  
	td1 = td0.nextElementSibling; 	//제조사 
	td2 = td1.nextElementSibling; 	//품번 
	td3 = td2.nextElementSibling; 	//WMS코드 
	td4 = td3.nextElementSibling; 	//입고검사
	td5 = td4.nextElementSibling; 	//긴급 
	td6 = td5.nextElementSibling; 	//MOQ
	td7 = td6.nextElementSibling;	//BOX
	td8 = td7.nextElementSibling;	//입고 요청수량 
	td9 = td8.nextElementSibling; 	//라벨수량 
	td10 = td9.nextElementSibling; 	//입고수량 
	td11 = td10.nextElementSibling; //불량수량 
	td12 = td11.nextElementSibling; //입고요청일
	td13 = td12.nextElementSibling; //출하예정처
	td14 = td13.nextElementSibling; //출고유형
	td15 = td14.nextElementSibling; //비고 
	td16 = td15.nextElementSibling; //순번비고
	
		
	var mail_arr = 	[
						{  yesCheck: appendSelect, 		noCheck: appendText,  		column: td4},  	//입고검사
						{  yesCheck: appendSelect, 		noCheck: appendText,  		column: td5},   //긴급 
						{  yesCheck: appendInput, 		noCheck: appendText,  		column: td8},   //입고 요청수량 
						{  yesCheck: appendSelect_array_OUTCUST, 	noCheck: appendSelectText,  		column: td13},  //출하예정처
						{  yesCheck: appendSelect_array_LFART, 		noCheck: appendSelectText,  		column: td14},  //출고유형
						{  yesCheck: appendSelect, 		noCheck: appendText,  		column: td16} 	//순번비고
					];
	
	//2.1 추가된 행 
	if(td0.parentNode.attributes.name.value == "mytr"){
		
		//3.1 체크박스 체크
		if (it.checked){ 
			for (var prop in mail_arr) {
				td.style.backgroundColor = "gold";
				mail_arr[prop].yesCheck(mail_arr[prop].column, "gold");
			}

		//3.2 체크박스 해제	
		}else{
			for (var prop in mail_arr) {
				td.style.backgroundColor = "";
				mail_arr[prop].noCheck(mail_arr[prop].column);	
			}
		}	
		
	//2.2 기존 행
	}else if(td0.parentNode.attributes.name.value == "defaultTd"){
		
		//배열 arr에 splice 메서드를 이용해 인덱스 0 부터 1개의 원소를 삭제
		mail_arr.splice(0, 1); //(코드 삭제)
		
		//3.1 체크박스 체크
		if (it.checked){ 
			for (var prop in mail_arr) {
				td.style.backgroundColor = "#3fc21f";
				mail_arr[prop].yesCheck(mail_arr[prop].column, "#3fc21f");
			}

		//3.2 체크박스 해제	
		}else{
			for (var prop in mail_arr) {
				td.style.backgroundColor = "";
				mail_arr[prop].noCheck(mail_arr[prop].column);	
			}
		}	
	}
}
//-----------------------------------------------
//저장위치 Select 
var Select_array_LGORT = new Array();		
var Select_list_LGORT = "";

function LGORT(MANDT, WERKS){
	//Create an FormData object 
	var params =  "MANDT=" + MANDT + "&WERKS=" + WERKS;
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/Overall_status_4/arrivalStatusByTimeZone_01Select_LGORT.do',
		type: "post",
		dataType : 'json',
		data: params,
		async: false,
		processData: false,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		cache: false,
		timeout: 600000,
		success : function(data){

			Select_list_LGORT = "";
			//코드종류 Select
			Select_array_LGORT = data['Select_LGORT'];
			$('#LGORT').html('');
			
			for(var j = 0 ; j < Select_array_LGORT.length; j ++ ){
				Select_list_LGORT += "<option value="+Select_array_LGORT[j].LGORT+">"+Select_array_LGORT[j].SLNAME+"</option>";
			}
			$('#LGORT').append(Select_list_LGORT);		
		},
		error : function(error){
			alert('error');
		}
	
	})// ajax({ 끝	
}	

	
//법인 콤보박스에 따른 저장위치(LGORT) 콤보박스 불러오기
$(document).on('click','[id="WERKS"]',function(e){
	
		var MANDT = $('#MANDT').val();
		LGORT(MANDT, e.target.value)
		
		var td = e.target.parentNode;		//법인
		var td0 = td.nextElementSibling;	//저장위치
		var color = ""
		
});	


function frmScanSubmit(){
	//Create an FormData object 
	
	//var VIEWALL =  $("input[name='VIEWALL']:checked").val();
	//$("#VIEWALL").val(VIEWALL);
	var params = jQuery("#search").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	setCookie(getParameterByName("prog"), params, 1);  //세션값에 ID 저장

	
	// ajax({ 시작	
	$.ajax({
		url : '/WMS/Instruction_management_5/warehousingOfMaterialsRequestManagement_01Select_bottom.do',
		type: "post",
		dataType : 'json',
		data: params,
		async: false,
		processData: false,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		cache: false,
		timeout: 600000,
		success : function(data){
			$("#chkAll").prop("checked", false); //전체체크 해제	
			$('#bottom_table tbody').html('');
			
			$('#WERKS').html('');	//법인
			$('#LIFNR').html('');	//공급처
			$('#CUSTCD').html('');	//제조사
			//$('#MKUSER').html('');	//작성자
			
			var list ="";
		
			//코드종류 Select
			var Select_array_WERKS =  new Array(); 		//법인 
			var Select_list_WERKS = "";
		
			var Select_array_CUSTCD =  new Array(); 	//공급처 
			var Select_list_CUSTCD = "";
			
			var Select_array_LIFNR =  new Array(); 		//제조사 
			var Select_list_LIFNR = "";
			
			//var Select_array_MKUSER =  new Array(); 	//작성자 
			//var Select_list_MKUSER = "";
			
			Select_array_WERKS = data['Select_WERKS'];
			for(var j = 0 ; j < Select_array_WERKS.length; j ++ ){
				Select_list_WERKS += "<option value="+Select_array_WERKS[j].WERKS+">"+Select_array_WERKS[j].PLANTNAME+"</option>";
			}
			Select_array_LIFNR = data['Select_LIFNR'];
			for(var j = 0 ; j < Select_array_LIFNR.length; j ++ ){
				Select_list_LIFNR += "<option value="+Select_array_LIFNR[j].LIFNR+">"+Select_array_LIFNR[j].LIFNRNAME+"</option>";
			}
			Select_array_CUSTCD = data['Select_CUSTCD'];
			for(var j = 0 ; j < Select_array_CUSTCD.length; j ++ ){
				Select_list_CUSTCD += "<option value="+Select_array_CUSTCD[j].CUSTCD+">"+Select_array_CUSTCD[j].CUSTCDNAME+"</option>";
			}
			/*
			Select_array_MKUSER = data['Select_MKUSER'];
			for(var j = 0 ; j < Select_array_MKUSER.length; j ++ ){
				Select_list_MKUSER += "<option value="+Select_array_MKUSER[j].MKUSER+">"+Select_array_MKUSER[j].MKUSERNAME+"</option>";
			}
			*/
			
			
			
			var MANDT = $("#MANDT").val();
			var user = getCookie("sys_member_id");
						
			for(var i = 0 ; i < data['list'].length-3 ; i ++ ){
		
				//법인
				if(data['list'][i].rowspan !== undefined){
					rowspan = "<td style='vertical-align:top;' class='text-align-center rowspan1' style=' background-color: #f9f9f9; font-size:17px;' rowspan='"+data['list'][i].rowspan+"'><b class='textFixing'>"+ data['list'][i].EBELN +"</b></td>" 
				}else{
					rowspan = "";
				}
				
				//저장위치
				if(data['list'][i].rowspan2 !== undefined){
					rowspan2 = "<td style='vertical-align:top;' class='text-align-center rowspan2' style='background-color: #f9f9f9; font-size:16px;' rowspan='"+data['list'][i].rowspan2+"'><b class='textFixing'>"+ data['list'][i].BSART +"</b></td>" 
				}else{
					rowspan2 ="";
				}
				
				//상태
				if(data['list'][i].rowspan3 !== undefined){
					rowspan3 = "<td style='vertical-align:top;' class='text-align-center rowspan3' style='background-color: #f9f9f9; font-size:16px;' rowspan='"+data['list'][i].rowspan3+"'><b class='textFixing'>"+ data['list'][i].EINDT +"</b></td>" 
				}else{
					rowspan3 ="";
				}
				
				list  += "<tr name='defaultTd'>"+
						"<input type='hidden' name='EBELN' value='"+ data['list'][i].EBELN +"' >"+	//입고요청번호
						"<input type='hidden' name='BSART' value='"+ data['list'][i].BSART +"' >"+	//입고요청구분	
						"<input type='hidden' name='EINDT' value='"+ data['list'][i].EINDT +"' >"+	//입고예정일
						"<input type='hidden' name='BEDAT' value='"+ data['list'][i].BEDAT +"' >"+	//입고요청일
						rowspan +	//입고요청구분
						rowspan2 +	//입고요청구분
						rowspan3 +	//입고예정일
						"<td class='text-align-center'>"+ data['list'][i].WERKS +"</td>"+     		//법인
						"<td class='text-align-center'>"+ data['list'][i].LGORT +"</td>"+			//저장위치	
						"<td class='text-align-center'>"+ data['list'][i].LIFNR +"</td>"+			//공급처
						"<td class='text-align-center'>"+ data['list'][i].FILEYN +"</td>"+			//첨부파일	
						"<td class='text-align-center'>"+ data['list'][i].STATUS +"</td>"+ 			//상태
						"<td class='text-align-center'>"+ data['list'][i].ARRIVALFLAG +"</td>"+ 	//하차                  
						"<td class='text-align-center'>"+ data['list'][i].SHGBN +"</td>"+ 			//배송방법 
						"<td class='text-align-center'>"+ data['list'][i].EBELP +"</td>"+ 			//순번 
						"<td class='text-align-center'>"+ data['list'][i].CUSTCD +"</td>"+ 			//제조사 
						"<td class='text-align-center'>"+ data['list'][i].MAKTX +"</td>"+ 			//품번 
						"<td class='text-align-center'>"+ data['list'][i].MATNR +"</td>"+ 			//WMS코드  
						"<td class='text-align-center'>"+ data['list'][i].INSPECTIONFLAG +"</td>"+ 	//입고검사
						"<td class='text-align-center'>"+ data['list'][i].URGENTFLAG +"</td>"+ 		//긴급 
						"<td class='text-align-center'>"+ ( (data['list'][i].MOQ == undefined)? "" : data['list'][i].MOQ ) +"</td>"+ 			//MOQ 
						"<td class='text-align-center'>"+ data['list'][i].BOXCNT +"</td>"+ 			//BOX
						"<td class='text-align-center'>"+ data['list'][i].MENGE +"</td>"+ 			//입고 요청수량
						"<td class='text-align-center'>"+ data['list'][i].PRTQTY +"</td>"+ 			//라벨수량 
						"<td class='text-align-center'>"+ data['list'][i].PROCQTY +"</td>"+ 		//입고수량 
						"<td class='text-align-center'>"+ ( (data['list'][i].NGQTY == undefined)? "" : data['list'][i].NGQTY ) +"</td>"+ 		//불량수량 
						"<td class='text-align-center'>"+ data['list'][i].OUTCUST +"</td>"+ 		//출하예정처 
						"<td class='text-align-center'>"+ data['list'][i].LFART +"</td>"+ 			//출고유형 
						"<td class='text-align-center'>"+ data['list'][i].BEDAT +"</td>"+ 			//입고요청일 
						"<td class='text-align-center'>"+ data['list'][i].REMARK +"</td>"+ 			//비고 
						"<td class='text-align-center'>"+ ( (data['list'][i].SREMARK == undefined)? "" : data['list'][i].SREMARK ) +"</td>"+ 	//순번비고 
						"<td class='text-align-center'>"+ formatDate(data['list'][i].MKDATE) +"</td>"+ 			//생성일 
						"<td class='text-align-center'>"+ ( (data['list'][i].MKUSERID == undefined)? "" : data['list'][i].MKUSERID ) +"</td>"+ 	//생성자 
						"<td class='text-align-center'>"+ ( (data['list'][i].MODATE == undefined)? "" : formatDate(data['list'][i].MODATE) ) +"</td>"+ 		//수정일 
						"<td class='text-align-center'>"+ ( (data['list'][i].MOUSERID == undefined)? "" : data['list'][i].MOUSERID ) +"</td>"+ 	//수정자 
					"</tr>";
			}
			
			$('#bottom_table tbody').append(list);
			
			//$('#WERKS').append(Select_list_WERKS);
			//$('#LIFNR').append(Select_list_LIFNR);
			
			//$("#WERKS").val(data['map'].WERKS ); //법인
			//$("#LGORT").val(data['map'].LGORT ); //저장위치
			//$("#LIFNR").val(data['map'].LIFNR ); //공급업체
			//$("#MAKTX").val(data['map'].MAKTX ); //품번
			
		    
			//스크롤 영역 
		    // var scrollMove = {top:0 , left:240}; //스크롤 맨 위에 위치 
		 
		  	//$('html, #scroll').animate({//스크롤 위치 이동
			//    scrollTop: scrollMove.top
			//}, 0);
		},
		error : function(error){
			alert('error');
		}
	
	})// ajax({ 끝	
}


	
function right_table(id){
	//Create an FormData object 
	var params = jQuery("#"+id).serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/Overall_status_4/arrivalStatusByTimeZone_01Select_right.do',
		type: "post",
		dataType : 'json',
		data: params,
		async: true,
		processData: false,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		cache: false,
		timeout: 600000,
		success : function(data){

			$('#right_table tbody').html('');
			
			var list ="";
			var rowspan = "";
			/*
			$("#TOTAL_COUNT").html('');
			var TOTAL_COUNT = "";
	
			if(data['list'][0] !== undefined){
				TOTAL_COUNT = data['list'][0].TOTAL_COUNT;
			}else{
				TOTAL_COUNT = 0;
			}
			*/
			
			for(var i = 0 ; i < data['list'].length-3 ; i ++ ){
				
				//제조사
				if(data['list'][i].rowspan !== undefined){
					rowspan = "<td style='vertical-align:top;' class='text-align-center' style=' background-color: #f9f9f9; font-size:16px;' rowspan='"+data['list'][i].rowspan+"'><b class='textFixing'>"+ data['list'][i].CUST +"</b></td>" 
				}else{
					rowspan = "";
				}
				
				//품번
				if(data['list'][i].rowspan2 !== undefined){
					rowspan2 = "<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' rowspan='"+data['list'][i].rowspan2+"'><b>"+ data['list'][i].MAKTX +"</b></td>"

				}else{
					rowspan2 ="";
				}
				
				list = "<tr name='defaultTd'>"+
							rowspan +	//제조사
							rowspan2 +	//품번
							"<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' ><b>"+ data['list'][i].LIFNR +"</b></td>"+ //공급처 
							"<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' ><b>"+ data['list'][i].BCQTY +"</b></td>"+ //수량
							"<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' ><b>"+ data['list'][i].MEINS +"</b></td>"+ //단위 
							"<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' ><b>"+ data['list'][i].BOXCNT +"</b></td>"+ //박스 
						"</tr>";
			
				$('#right_table tbody').append(list);
			
			}
		
			//스크롤 영역 
		    var scrollMove = {top:0 , left:240}; //스크롤 맨 위에 위치 
		 
		  	$('html, #scroll').animate({//스크롤 위치 이동
			    scrollTop: scrollMove.top
			}, 0);
		},
		error : function(error){
			alert('error');
		}
	
	})// ajax({ 끝	
}	


	
function right_bottom_table(id){
	//Create an FormData object 
	var params = jQuery("#"+id).serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/Overall_status_4/arrivalStatusByTimeZone_01Select_right_bottom.do',
		type: "post",
		dataType : 'json',
		data: params,
		async: true,
		processData: false,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		cache: false,
		timeout: 600000,
		success : function(data){

			$('#right_bottom_table tbody').html('');
			
			var list ="";
			var rowspan = "";
		
			for(var i = 0 ; i < data['list'].length-3 ; i ++ ){
				
				//제조사
				if(data['list'][i].rowspan !== undefined){
					rowspan = "<td style='vertical-align:top; background-color: #f9f9f9; font-size:16px;' class='text-align-center'  rowspan='"+data['list'][i].rowspan+"'><b class='textFixing'>"+ data['list'][i].CUST +"</b></td>" 
				}else{
					rowspan = "";
				}
				
				//품번
				if(data['list'][i].rowspan2 !== undefined){
					rowspan2 = "<td style='vertical-align:top; background-color: #f9f9f9; font-size:16px;' class='text-align-center'  rowspan='"+data['list'][i].rowspan2+"'><b class='textFixing'>"+ data['list'][i].MAKTX +"</b></td>" 

				}else{
					rowspan2 ="";
				}
		
				list = "<tr name='defaultTd'>"+
							rowspan +	//제조사
							rowspan2 +	//품번
							"<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' ><b>"+ data['list'][i].ORDNO +"</b></td>"+ //오더번호 
							"<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' ><b>"+ data['list'][i].CBARNO +"</b></td>"+//바코드 
							"<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' ><b>"+ data['list'][i].QTY +"</b></td>"+ 	 //수량 
							"<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' ><b>"+ formatDate(data['list'][i].CRDTD) +"</b></td>"+ //입고일시 
							"<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' ><b>"+ data['list'][i].LIFNRNM +"</b></td>"+ //공급처 
						"</tr>";
			
				$('#right_bottom_table tbody').append(list);
			
			}
		
			//스크롤 영역 
		    var scrollMove = {top:0 , left:240}; //스크롤 맨 위에 위치 
		 
		  	$('html, #scroll').animate({//스크롤 위치 이동
			    scrollTop: scrollMove.top
			}, 0);
		},
		error : function(error){
			alert('error');
		}
	
	})// ajax({ 끝	
}	


</script>



<script type="text/javascript">	

function getMonday(d) {
  d = new Date(d);
  var day = d.getDay(),
      diff = d.getDate() - day + (day == 0 ? -6:1); // adjust when day is sunday
  return new Date(d.setDate(diff));
}
/*
function cb(start, end) {
	var DATEFLAG = $("#DATEFLAG").val();
	
    if(DATEFLAG == "E"){
    	$('#reportrange .txt_date').html(start.format('YYYY년 MM월 DD일') + ' - ' + end.format('YYYY년 MM월 DD일'));
    	//getMonday(start); // Mon Nov 08 2010
    
    	$('#SEINDT').val(start.format('YYYYMMDD'));
        $('#EEINDT').val(end.format('YYYYMMDD'));	
    		
    }else if(DATEFLAG == "B"){
    	$('#reportrange .txt_date').html(start.format('YYYY년 MM월 DD일') + ' - ' + end.format('YYYY년 MM월 DD일'));
    	//getMonday(start); // Mon Nov 08 2010
    	
    	$('#reportrange').data('daterangepicker').setStartDate(start);		    	
        $('#reportrange').data('daterangepicker').setEndDate(end);	
   
    	$('#SBEDAT').val(start.format('YYYYMMDD'));
        $('#EBEDAT').val(end.format('YYYYMMDD'));
    }
}
*/

//처음 페이지 로드 시, 세팅해주는 값 
$(document).ready(function() {
	
	$("#USERID").val(getCookie("sys_member_id")); //세션ID USERID에 넣기

	/*
    $('#reportrange').daterangepicker({
			alwaysShowCalendars:true,
			startDate: moment().startOf('year'),
			endDate: moment(),
			//maxDate: moment(),
			opens: "left",
			ranges: {
				'오늘': [moment(), moment()],
				'어제': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
				'최근 7일': [moment().subtract(6, 'days'), moment()],
				'지난 30일': [moment().subtract(29, 'days'), moment()],
				'이번 달': [moment().startOf('month'), moment().endOf('month')],
				'이번 년도': [moment().startOf('year'), moment().endOf('year')],
				'오늘 이전': [moment().startOf('year'), moment()],
				'지난 달': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
			}
	}, cb);
	*/
	
	
		//if(getParameterByName("MANDT") == ""){
    	//	cb(moment().startOf('year'), moment().endOf('year'));
    	//}else{
    	//  $('#searchButton').trigger('click');
    	//	cb( moment(getParameterByName("SDATE"), 'YYYY-MM-DD'), moment(getParameterByName("EDATE"), 'YYYY-MM-DD') );
    	//get_query();
    	//}
	
//	$('#searchButton').trigger('click');
});



// 엑셀 전체 다운로드 
function fn_excel_all_down() {
   
	var comSubmit = new ComSubmit("frmDownloadExcel");
	comSubmit.setUrl("<c:url value='/sys/excelDown_SysMember.do' />");
	$("#param").val("total");
	comSubmit.submit();
}

// 엑셀 현재 다운로드 
function fn_excel_now_down() {
    
	var comSubmit = new ComSubmit("frmDownloadExcel");
	comSubmit.setUrl("<c:url value='/sys/excelDown_SysMember.do' />");
	$("#param").val("");
	comSubmit.submit();
}

</script>


 
</html>