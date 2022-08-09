window.onload = function() {
	
	// 임시 : LeftMenu 활성화
	var url = String(window.location);
	var tmp1 = url.split("/");	
	var tmp2 = tmp1[5].split(".");	//로컬용
	//var tmp2 = tmp1[6].split(".");	서버용
	var menu = tmp2[0];

	//console.log(menu);	
	setMenu(menu);
};

var max_num = 8 ;
function setMenu( menu ) {	
	
	for(i = 1; i < max_num; i++){
		$('.menu' + i).removeClass('active');
		$('.menu' + i).removeClass('open');

		// 3. 광고 효과 보고서
		if ( i == 3 && ( menu == "ad_report_list" || menu == "ad_report_work" || menu == "ad_report_work_write" || menu == "ad_report_type" || menu == "ad_report_type_write" || menu == "ad_data" || menu == "ad_data_write") )
		{
			$('.menu' + i).addClass('active');
			$('.menu' + i).addClass('open');
		}

		// 4. 자동 입찰
		if ( i == 4 && ( menu == "auto_bid" || menu == "auto_bid_write" || menu == "auto_bid_history"  || menu == "auto_bid_write_type") )
		{
			$('.menu' + i).addClass('active');
			$('.menu' + i).addClass('open');
		}

		// 6. 데이터 분석
		if ( i == 6 && ( menu == "data_keyword" || menu == "data_keyword_write"   ) )
		{
			$('.menu' + i).addClass('active');
			$('.menu' + i).addClass('open');
		}

		// 7. 광고주 설정
		if ( i == 7 && ( menu == "account_ad_list" || menu == "account_ad_write" || menu == "account_media_write" || menu == "account_media_api_write" || menu == "account_media_history_list"  ) )
		{
			$('.menu' + i).addClass('active');
			$('.menu' + i).addClass('open');
		}
	}
	
}