


	$('.datetimepicker').datetimepicker({
            format: 'YYYY-MM-DD',
            pickTime: false,
            language: 'kr'
        });
	
	
	
	
	
	$(document).ready(function() {

        //popover
        $('[data-toggle="popover"]').popover({
            trigger: 'manual',
            content: '<span class="badge badge-success badge-square">좋음</span> <span class="badge badge-primary badge-square">보통</span> <span class="badge badge-warning badge-square">주의</span> <span class="badge badge-danger badge-square">위험 </span>',
            html: true,
            placement: 'bottom',
            dismissible: false
        }).on('click', function(e){
            e.preventDefault();
            $(this).popover('show');
        });

        $('body').on('click', function (e) {
            $('[data-toggle="popover"]').each(function () {
                if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
                    $(this).popover('hide');
                }
            });
        });
		
		
		
	});


       		