<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Main Container -->
<div class="main-container container-fluid">
    <!-- Page Container -->
    <div class="page-container">
        <!-- Page Sidebar -->
        <div class="page-sidebar" id="sidebar">
        <script type="text/javascript">
		
				var url_check = location.pathname; 
				
				var list_SysMemeber = "/WMS/main_menu/notice_list.do"; 
				if(url_check == "/WMS/sys/write_SysMember.do" ){
					url_check = list_SysMemeber; 
				} 
				if(url_check == "/WMS/sys/view_SysMember.do" ){
					url_check = list_SysMemeber; 
				} 
				
				var list_SysMemeber_account = "/WMS/sys/list_account.do"; 
				if(url_check == "/WMS/sys/write_account.do" ){
					url_check = list_SysMemeber_account; 
				} 
				if(url_check == "/WMS/sys/view_account.do" ){
					url_check = list_SysMemeber_account; 
				} 
				
				$("a[href*='"+url_check+"']").closest('li').attr('class','active');
				$("a[href*='"+url_check+"']").closest('ul').parent().attr('class','active open');
				
		</script>		
            
            <!-- Sidebar Menu -->
            <ul class="nav sidebar-menu">
                <!--Dashboard-->
		
                <!--Databoxes-->
				<li>
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-sitemap"></i>
                        <span class="menu-text"> 기준정보 </span>
                        <i class="menu-expand"></i>
                    </a>			               
					<ul class="submenu">
                        <li>
                            <a href="/WMS/main_menu/notice_list.do"><span class="menu-text">회원 관리</span></a>
                        </li>
                        <li>
                            <a href="/WMS/code_01/code_01_list.do"><span class="menu-text">코드 관리</span></a>
                        </li>
                        <li>
                            <a href="/WMS/corporation_02/corporation_02_list.do"><span class="menu-text">법인 관리</span></a>
                        </li>
                        <li>
                            <a href="/WMS/customer_03/customer_03_list.do"><span class="menu-text">거래처 관리</span></a>
                        </li>
                        <li>
                            <a href="/WMS/storageLocation_04/storageLocation_04_list.do"><span class="menu-text">저장위치 관리</span></a>
                        </li>
                        <li>
                            <a href="/WMS/imageReference_05/imageReference_05_list.do"><span class="menu-text">이미지 기준관리</span></a>
                        </li>
                        <li>
                            <a href="/WMS/receiptLabel_06/receiptLabel_06_list.do"><span class="menu-text">입고 라벨 타입 관리</span></a>
                        </li>
                        <li>
                            <a href="/WMS/supplierPartNumberMapping_07/supplierPartNumberMapping_07_list.do"><span class="menu-text">거래처 품번 매핑</span></a>
                        </li>
                        <li>
                            <a href="/WMS/partNumberMaster_08/partNumberMaster_08_list.do"><span class="menu-text">품번마스터 관리</span></a>
                        </li>
                        <li>
                            <a href="/WMS/PDAip_09/PDAip_09_list.do"><span class="menu-text">PDA IP 관리</span></a>
                        </li>
                    </ul>
				</li>
				
				<li>
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-sitemap"></i>
                        <span class="menu-text"> 시스템 관리 </span>
                        <i class="menu-expand"></i>
                    </a>			               
					<ul class="submenu">
                        <li>
                            <a href="/WMS/screen_01/screen_01_list.do"><span class="menu-text">화면 관리</span></a>
                        </li>
                        <li>
                            <a href="/WMS/menu_02/menu_02_list.do"><span class="menu-text">메뉴 관리</span></a>
                        </li>
                    </ul>
				</li>
				
				<li>
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-sitemap"></i>
                        <span class="menu-text"> 작업자 관리 </span>
                        <i class="menu-expand"></i>
                    </a>			               
					<ul class="submenu">
                        <li>
                            <a href="/WMS/user_01/user_01_list.do"><span class="menu-text">사용자 관리</span></a>
                        </li>
                        <li>
                            <a href="/WMS/corporateByUser_02/corporateByUser_02_list.do"><span class="menu-text">사용자별 법인관리</span></a>
                        </li>
                        <li>
                            <a href="/WMS/groupAuthority_03/groupAuthority_03_list.do"><span class="menu-text">그룹별 권한 관리</span></a>
                        </li>
                         <li>
                            <a href="/WMS/userAuthority_04/userAuthority_04_list.do"><span class="menu-text">사용자별 권한 관리</span></a>
                        </li>
                    </ul>
				</li>
				
				<li>
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-sitemap"></i>
                        <span class="menu-text"> 종합 현황 </span>
                        <i class="menu-expand"></i>
                    </a>			               
					<ul class="submenu">
                        <li>
                            <a href="/WMS/arrivalStatusByTimeZone_01/arrivalStatusByTimeZone_01_list.do"><span class="menu-text">시간대별 입고 현황</span></a>
                        </li>
                        <li>
                            <a href="/WMS/arrivalStatus_02/arrivalStatus_02_list.do"><span class="menu-text">입고 현황</span></a>
                        </li>
                         <li>
                            <a href="/WMS/materialsDetail_03/materialsDetail_03_list.do"><span class="menu-text">입고 상세</span></a>
                        </li>
                         <li>
                            <a href="/WMS/presentStatusOfShipment_04/presentStatusOfShipment_04_list.do"><span class="menu-text">출고 현황</span></a>
                        </li>
                        <li>
                            <a href="/WMS/detailStatusOfShipment_05/detailStatusOfShipment_05_list.do"><span class="menu-text">출고 상세</span></a>
                        </li>
                    </ul>
				</li>
 
            </ul>
            <!-- /Sidebar Menu -->
        </div>
        <!-- /Page Sidebar -->
        
		
		