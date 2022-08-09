<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>
<!-- 종합현황 - 시간대별 입고 현황  -->   
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
										<label>
											<input name="SEARCHTYPE" id="SEARCHTYPE" type="radio" value="WEEK" checked="checked">
											<span class="text" style="bottom:10px"></span>
										</label>
										<span class="input-group-btn" style="bottom:3px">
											<label style="">
												<input name="SEARCHTYPE" id="SEARCHTYPE" type="radio" value="WEEK" checked="checked">  
												<span class="form-control" style="width:100px;">
													<span class="text">입고예정일</span>											
												</span>
											</label>
										</span>
										<div id="reportrange" class="input-sm btn_daterange2 form-control">
											<span class="txt_date">2020년 01월 01일 - 2020년 12월 31일</span>
										</div>
										<input type="hidden" id="FDATE" name="FDATE" value="20200101">
										<input type="hidden" id="TDATE" name="TDATE" value="20201231">
									</div>
									
									<div class="input-group ">
										<label>
											<input name="SEARCHTYPE" id="SEARCHTYPE" type="radio" value="WEEK" checked="checked">
											<span class="text" style="bottom:10px"></span>
										</label>
										<span class="input-group-btn" style="bottom:3px">
											<label style="">
												<input name="SEARCHTYPE" id="SEARCHTYPE" type="radio" value="WEEK" checked="checked">  
												<span class="form-control" style="width:100px;">
													<span class="text">입고예정일</span>
												</span>
											</label>
										</span>
										<div id="reportrange" class="input-sm btn_daterange2 form-control">
											<span class="txt_date">2020년 01월 01일 - 2020년 12월 31일</span>
										</div>
										<input type="hidden" id="FDATE" name="FDATE" value="20200101">
										<input type="hidden" id="TDATE" name="TDATE" value="20201231">
									</div>
									
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">입고요청구분</span>
										</span>
										<select id="BSART" name="BSART" class="form-control" value="" style=""><option value=""></option><option value="DM">[DM] 내수구매</option><option value="EI">[EI] 부외재고 편입</option><option value="EP">[EP] 기타판매(재분배)</option><option value="IM">[IM] 수입</option><option value="OI">[OI] 외주창고 입고</option><option value="OV">[OV] 해외법인</option><option value="RT">[RT] 반품</option><option value="SB">[SB] 관계사간 거래</option><option value="sdf">[sdf] sdfds</option><option value="DC">[DC] 직납전환</option><option value="ET">[ET] 기타판매</option></select>
									</div>
									
								</div>		
								
								<div class="col-sm-3">   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">법인</span>
										</span>
										<select id="WERKS" name="WERKS" class="form-control" value="" style=""><option value=""></option><option value="0100">[0100] HK Semitech</option><option value="0200">[0200] Sorentee</option><option value="0300">[0300] BNY</option><option value="0400">[0400] DORINT</option><option value="0500">[0500] YINGHAN</option><option value="1">[1] 100001</option><option value="2">[2] test2</option><option value="3">[3] test33</option><option value="45">[45] 45</option><option value="test">[test] test</option></select>
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">배송방법</span>
										</span>
										<select id="SHGBN" name="SHGBN" class="form-control" value="" style=""><option value=""></option><option value="CD">[CD] 거래처직배송</option><option value="DH">[DH] DHL</option><option value="ET">[ET] 부외출고</option><option value="FD">[FD] FDX</option><option value="HK">[HK] 센터직납</option><option value="IE">[IE] 기초재고등록</option><option value="IN">[IN] 센터 내부 이동</option><option value="KJ">[KJ] 광진</option><option value="PT">[PT] 택배(착불)</option><option value="RT">[RT] 반품(공급처반품)</option><option value="SC">[SC] 폐기</option><option value="TN">[TN] TNT</option><option value="DD">[DD] 직수령/직배송</option><option value="DV">[DV] 용차</option><option value="PS">[PS] 택배(선불)</option></select>
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">작성자</span>
										</span>
										<select id="SHGBN" name="SHGBN" class="form-control" value="" style=""><option value=""></option><option value="CD">[CD] 거래처직배송</option><option value="DH">[DH] DHL</option><option value="ET">[ET] 부외출고</option><option value="FD">[FD] FDX</option><option value="HK">[HK] 센터직납</option><option value="IE">[IE] 기초재고등록</option><option value="IN">[IN] 센터 내부 이동</option><option value="KJ">[KJ] 광진</option><option value="PT">[PT] 택배(착불)</option><option value="RT">[RT] 반품(공급처반품)</option><option value="SC">[SC] 폐기</option><option value="TN">[TN] TNT</option><option value="DD">[DD] 직수령/직배송</option><option value="DV">[DV] 용차</option><option value="PS">[PS] 택배(선불)</option></select>
									</div>
								</div>
								
								<div class="col-sm-3">   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">저장위치</span>
										</span>
										<select id="LGORT" name="LGORT" class="form-control" style=""><option value=""></option><option value="1001">[1001] 화성물류창고</option><option value="2001">[2001] 부외물류창고</option><option value="4111">[4111] WIN창고</option><option value="4112">[4112] WIN창고</option><option value="4113">[4113] 화성물류창고</option><option value="4114">[4114] 화성물류창고</option><option value="4115">[4115] 화성물류창고</option><option value="4116">[4116] 화성물류창고</option></select>
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">품번</span>
										</span>
										<input type="text" id="BELN" name="BELN" value="" onblur="removeSpace(this);" class="form-control">
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">입고요청번호</span>
										</span>
										<input type="text" id="BELN" name="BELN" value="" onblur="removeSpace(this);" class="form-control">
									</div>
								</div>
								
								<div class="col-sm-2">
									<div class=" table-responsive">
										<button type="button" id="searchButton" style="margin-top: 0px;" class="btn btn-lg btn-block btn-primary search" onclick="javascript:frmScanSubmit();"><i class="fa fa-search"></i> Search</button>
									</div>
								</div>
						
							</form>
						</div>
				<div class="search_box">
							<div class="search_box_sub">  
							<form name="search" id="search">
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
											<select id="BSART" name="BSART" class="form-control" value="" style=""><option value=""></option><option value="DM">[DM] 내수구매</option><option value="EI">[EI] 부외재고 편입</option><option value="EP">[EP] 기타판매(재분배)</option><option value="IM">[IM] 수입</option><option value="OI">[OI] 외주창고 입고</option><option value="OV">[OV] 해외법인</option><option value="RT">[RT] 반품</option><option value="SB">[SB] 관계사간 거래</option><option value="sdf">[sdf] sdfds</option><option value="DC">[DC] 직납전환</option><option value="ET">[ET] 기타판매</option></select>
										</div>
										<div class="input-group table-responsive">
											<span class="input-group-btn">
												<span class="form-control" style="width:100px;">베송방법</span>
											</span>
											<select id="BSART" name="BSART" class="form-control" value="" style=""><option value=""></option><option value="DM">[DM] 내수구매</option><option value="EI">[EI] 부외재고 편입</option><option value="EP">[EP] 기타판매(재분배)</option><option value="IM">[IM] 수입</option><option value="OI">[OI] 외주창고 입고</option><option value="OV">[OV] 해외법인</option><option value="RT">[RT] 반품</option><option value="SB">[SB] 관계사간 거래</option><option value="sdf">[sdf] sdfds</option><option value="DC">[DC] 직납전환</option><option value="ET">[ET] 기타판매</option></select>
										</div>
									</div>

									<div class="col-sm-7"> 
										<div class="input-group table-responsive">
											<span class="input-group-btn">
												<span class="form-control" style="width:100px;">입고요청구분</span>
											</span>
											<select id="BSART" name="BSART" class="form-control" value="" style=""><option value=""></option><option value="DM">[DM] 내수구매</option><option value="EI">[EI] 부외재고 편입</option><option value="EP">[EP] 기타판매(재분배)</option><option value="IM">[IM] 수입</option><option value="OI">[OI] 외주창고 입고</option><option value="OV">[OV] 해외법인</option><option value="RT">[RT] 반품</option><option value="SB">[SB] 관계사간 거래</option><option value="sdf">[sdf] sdfds</option><option value="DC">[DC] 직납전환</option><option value="ET">[ET] 기타판매</option></select>
										</div>
										<div class="input-group table-responsive">
											<span class="input-group-btn">
												<span class="form-control" style="width:100px;">입고요청구분</span>
											</span>
											<select id="BSART" name="BSART" class="form-control" value="" style=""><option value=""></option><option value="DM">[DM] 내수구매</option><option value="EI">[EI] 부외재고 편입</option><option value="EP">[EP] 기타판매(재분배)</option><option value="IM">[IM] 수입</option><option value="OI">[OI] 외주창고 입고</option><option value="OV">[OV] 해외법인</option><option value="RT">[RT] 반품</option><option value="SB">[SB] 관계사간 거래</option><option value="sdf">[sdf] sdfds</option><option value="DC">[DC] 직납전환</option><option value="ET">[ET] 기타판매</option></select>
										</div>
										<div class="input-group table-responsive">
											<span class="input-group-btn">
												<span class="form-control" style="width:100px;">베송방법</span>
											</span>
											<select id="BSART" name="BSART" class="form-control" value="" style=""><option value=""></option><option value="DM">[DM] 내수구매</option><option value="EI">[EI] 부외재고 편입</option><option value="EP">[EP] 기타판매(재분배)</option><option value="IM">[IM] 수입</option><option value="OI">[OI] 외주창고 입고</option><option value="OV">[OV] 해외법인</option><option value="RT">[RT] 반품</option><option value="SB">[SB] 관계사간 거래</option><option value="sdf">[sdf] sdfds</option><option value="DC">[DC] 직납전환</option><option value="ET">[ET] 기타판매</option></select>
										</div>
									</div>
									
									<div class="col-sm-12"> 
										

<div class="input-group table-responsive">
											<span class="input-group-btn">
												<span class="form-control" style="width:100px;">입고예정일</span>
											</span>
											<input value="" id="DATE" name="DATE" type="text" data-date-format="YYYY-MM-DD" class="form-control datetimepicker">		
										</div><div class="input-group table-responsive">
											<span class="input-group-btn">
												<span class="form-control" style="width:100px;">입고예정일</span>
											</span>
											<input value="" id="DATE" name="DATE" type="text" data-date-format="YYYY-MM-DD" class="form-control datetimepicker">		
										</div>
									</div>

<div class="col-sm-12"> 
									
		<div class="col-sm-3 ">
     
																					
<div class="input-group-btn">
													<label>
														<input type="checkbox" name="IFLAG" id="IFLAG" value="Y"><span class="text">전체선택</span>
		    										</label>
	    										</div>
									
    
    
    
    
    
										
<div class=""> 
<div class="input-group-btn">
													<label>
														<input type="checkbox" name="IFLAG" id="IFLAG" value="Y"><span class="text">미마감 전체 조회</span>
		    										</label>
	    										</div>
    			</div>


	    									
	    								
    


										
									</div>							

<div class="col-sm-9"> 
    
    <table class="table table-striped table-bordered ">
												<tbody id="chart_01">
													
<tr>
													<td style="font-size:20px; border:1px #555 solid; background-color: #606578; color:#ffffff;
 " colspan="2">총수량</td>
    <td style="font-size:20px; " colspan="2">31,4000</td>
    
														<td class=" text-align-center " style="background-color:#d73d32; border-color:#d73d32;  color:#ffffff; font-size:20px">수정중</td><td><button type="button" class="btn btn-default shiny " onclick="javascript:REPRINT();" style="width:100%;height:100%; font-size:20px;">수정취소</button></td>
    
    

												</tr>


												</tbody>
											</table>
    
    
    
    
    	</div>
									
									

									
								

									
							
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
												<span class="form-control" style="width:85px;">첨부파일1</span>
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
												<span class="form-control" style="width:85px;">첨부파일1</span>
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
												<span class="form-control" style="width:85px;">첨부파일1</span>
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
												<span class="form-control" style="width:85px;">첨부파일1</span>
											</span>
											<input type="text" id="BELN" name="BELN" value="" onblur="removeSpace(this);" class="form-control">
											<span class="input-group-btn" style="width:40px;">                          
												<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">파일첨부</button>
												<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">파일다운</button>
												<button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">x</button>
											</span>
										</div>

										<button type="button" class="btn btn-default shiny pull-right" onclick="javascript:REPRINT();"><i class="fa fa-download"></i>첨부파일 전체다운</button>
										<button type="button" class="btn btn-default shiny pull-right" onclick="javascript:REPRINT();" style="right:10px;"><i class="fa fa-floppy-o"></i> 첨부파일 저장</button>
										
											
													
									
									
    
    
    
    
    
									





</div>


									
									
									
    
									



<div class="col-sm-3 widget-body-sub pull-right" style="margin-bottom:-7px; margin-top:-7px; ">
    
    
    <div style="font-size:11px;margin-bottom: 10px;" id="right_title">Shipping Mark</div>
    
   	<div class="input-group">
											<span class="input-group-btn">
												<span class="form-control" style="width:85px;">Shipper</span>
											</span>
											<input class="form-control" onblur="removeSpace(this);" value="" name="BELN" id="BELN" type="text">
											
										</div>
<div class="input-group">
											<span class="input-group-btn">
												<span class="form-control" style="width:85px;">Consignee</span>
											</span>
											<input type="text" id="BELN" name="BELN" value="" onblur="removeSpace(this);" class="form-control">
											
										</div>
<div class="input-group">
											<span class="input-group-btn">
												<span class="form-control" style="width:85px;">출발항</span>
											</span>
											<input type="text" id="BELN" name="BELN" value="" onblur="removeSpace(this);" class="form-control">
											
										</div>
<div class="input-group">
											<span class="input-group-btn">
												<span class="form-control" style="width:85px;">도착항</span>
											</span>
											<input type="text" id="BELN" name="BELN" value="" onblur="removeSpace(this);" class="form-control">
											
										</div>
<div class="input-group">
											<span class="input-group-btn">
												<span class="form-control" style="width:85px;">Description</span>
											</span>
											<input type="text" id="BELN" name="BELN" value="" onblur="removeSpace(this);" class="form-control">
											
										</div>
<div class="input-group">
											<span class="input-group-btn">
												<span class="form-control" style="width:85px;">기타사항</span>
											</span>
											<input type="text" id="BELN" name="BELN" value="" onblur="removeSpace(this);" class="form-control">
											
										</div>

<button type="button" class="btn btn-default shiny pull-right" onclick="javascript:REPRINT();" style="width: 100%;"> Shipping Mark 저장</button>
		
										
		
										





										
										
										
											
													
									
									
    
    
    

										
									</div>
									
									

									
								

									
							</form>
							</div>
						</div>

									
							</form>
							</div>
						</div>
						
<style>

.table.table-bordered th { top: -1px; }
.tableFixHead { overflow-x: hidden; overflow-y: auto; height: 540px; }
.tableFixHead thead th { position: sticky; top: 0; }


.textFixing {
  display: inline-block;
  position: sticky;
  top: 130px;
  /*width: 80px; */
  /*height: 90px; */
  /*background: blue;*/
}


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
						
						<div id="scroll_right_table" class="table-responsive tableFixHead " style="height:270px;">
							<table id="right_table" class="table table-bordered table-striped table-condensed ">
								<colgroup>
									<col style="width: 100px;">
									<col style="width: 80px;">
									<col style="width: 180px;">
									<col style="width: 50px;">
									<col style="width: 50px;">
									<col style="width: 50px;">  
									<col style="width: 50px;">
									<col style="width: 50px;">
									<col style="width: 50px;">  
									<col style="width: 50px;">
									<col style="width: 50px;">
									<col style="width: 50px;">  
									<col style="width: 50px;">
									<col style="width: 50px;">
									<col style="width: 50px;">  
									<col style="width: 50px;">
									<col style="width: 50px;">  
									<col style="width: 50px;">
									<col style="width: 50px;">
									<col style="width: 50px;">  
									<col style="width: 50px;">
									<col style="width: 50px;">
									<col style="width: 50px;">  
									<col style="width: 50px;">
									<col style="width: 50px;">  
									<col style="width: 50px;">
									<col style="width: 50px;">
								</colgroup>
								<thead>
									<tr>
										<th>입고요청구분</th>
										<th>입고예정일</th>
										<th>법인</th>
										<th>저장위치</th>
										<th>공급처</th>
										<th>배송방법</th>
										<th>입고요청번호</th>
										<th>상태</th>
										<th>하차</th>
										<th>선택</th>
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
						
						<div id="scroll_right_bottom_table" class="table-responsive tableFixHead" style="height:270px;">
							<table id="right_bottom_table" class="table table-bordered table-striped table-condensed ">
								<colgroup>
									<col style="width: 80px;">
									<col style="width: 80px;">
									<col style="width: 90px;">
									<col style="width: 50px;">
									<col style="width: 70px;">
									<col style="width: 120px;">   
									<col style="width: 50px;">
									
								</colgroup>
								<thead>
									<tr>
										<th class="fixedColum">제조사</th>
										<th class="fixedColum">품번</th>
										<th>오더번호</th>
										<th>바코드</th>
										<th>수량</th>
										<th>입고일시</th>
										<th>공급처</th>
									</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>
						</div>				
					</div>
					
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


<script type="text/javascript">

$('.modal').modal({
    backdrop: false
});

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
	for(var i = 0 ; i < insertArray.length ; i++ ){
		
			list += "<tr name='defaultTd'>"+
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
	var params = jQuery("#search").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	setCookie(getParameterByName("prog"), params, 1);  //세션값에 ID 저장

	// ajax({ 시작	
	$.ajax({
		url : '/WMS/Overall_status_4/arrivalStatusByTimeZone_01Select_left.do',
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
			$('#left_table tbody').html('');
			$('#right_table tbody').html('');
			$("#right_title").html('');
			$('#WERKS').html('');
			$('#LIFNR').html('');
			
			var list ="";
			var TOTAL_COUNT = "";
			var totalPercent = "";
			//코드종류 Select
			var Select_array_WERKS =  new Array(); 		//법인 
			var Select_list_WERKS = "";
			
			var Select_array_LIFNR =  new Array(); 		//공급처 
			var Select_list_LIFNR = "";
			
			if(data['list'][0] !== undefined){
				TOTAL_COUNT = data['list'][0].TOTAL_COUNT;
			}else{
				TOTAL_COUNT = 0;
			}
			totalPercent =  data['totalPercent'];
	
			Select_array_WERKS = data['Select_WERKS'];
			for(var j = 0 ; j < Select_array_WERKS.length; j ++ ){
				Select_list_WERKS += "<option value="+Select_array_WERKS[j].WERKS+">"+Select_array_WERKS[j].PLANTNAME+"</option>";
			}
			
			Select_array_LIFNR = data['Select_CUSTCD'];
			for(var j = 0 ; j < Select_array_LIFNR.length; j ++ ){
				Select_list_LIFNR += "<option value="+Select_array_LIFNR[j].CUSTCD+">"+Select_array_LIFNR[j].CUSTNM+"</option>";
			}
	
			//법인- WERKS
			//저장위치- LGORT
			//작업장- ARBPL
			//입고유형- BWART
			//SEQINDX - SEQINS
			//시간 - T_HR
			//수량 - BCQTY
			//박스 - BOXCNT
			//수불일자_S - SUDAT_S
			//수불일자_E - SUDAT_E
			//실적일자_S - CRDTC_S
			//실적일자_E - CRDTC_E
			//품목코드 - MATNR
			//공급처 - LIFNR

			var MANDT = $("#MANDT").val();
			var user = getCookie("sys_member_id");
						
			for(var i = 0 ; i < data['list'].length ; i ++ ){
				var result = (data['list'][i].BCQTY/parseInt(totalPercent))*100;
				result = Math.floor(parseFloat(result));
			
				list += "<tr name='defaultTd'>"+
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
			
			$('#WERKS').append(Select_list_WERKS);
			$('#LIFNR').append(Select_list_LIFNR);
			
			$("#WERKS").val(data['map'].WERKS ); //법인
			$("#LGORT").val(data['map'].LGORT ); //저장위치
			$("#LIFNR").val(data['map'].LIFNR ); //공급업체
			$("#MAKTX").val(data['map'].MAKTX ); //품번
			
			
			//$("#WERKS").val("0100");
		    //$("#WERKS > option[value=0100]").attr("selected", "true");
		 	
		    
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

function cb(start, end) {
	$('#reportrange .txt_date').html(start.format('YYYY년 MM월 DD일') + ' - ' + end.format('YYYY년 MM월 DD일'));
	//getMonday(start); // Mon Nov 08 2010
	
	$('#reportrange').data('daterangepicker').setStartDate(start);		    	
    $('#reportrange').data('daterangepicker').setEndDate(end);	
    $('#SDATE').val(start.format('YYYYMMDD'));
    $('#EDATE').val(end.format('YYYYMMDD'));
}

// 출근지역 (=ACODE) 라디오버튼 선택시에 역할 라디오버튼 출력  
$('input:radio').change(function(){
	var radioValue = $(this).val();
	var startDate = $('#reportrange').data('daterangepicker').startDate;
	
	if(radioValue == "day"){ //일
		cb(moment(startDate), moment(startDate));
	
	}else if(radioValue == "week"){ //주	
		cb(moment(getMonday(startDate)), moment(getMonday(startDate)).add(6, 'days'));
	
	}else if(radioValue == "month"){ //월
		cb(moment(startDate).startOf('month'), moment(startDate).endOf('month'));
	}

});

//처음 페이지 로드 시, 세팅해주는 값 
$(document).ready(function() {
	
	$("#USERID").val(getCookie("sys_member_id")); //세션ID USERID에 넣기
	
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
 
    if(getParameterByName("MANDT") == ""){
    	cb(moment().startOf('year'), moment().endOf('year'));
    }else{
    	$('#searchButton').trigger('click');
    	cb( moment(getParameterByName("SDATE"), 'YYYY-MM-DD'), moment(getParameterByName("EDATE"), 'YYYY-MM-DD') );
    	get_query();
    }
	
	$('#searchButton').trigger('click');
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