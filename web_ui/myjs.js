
//cho pheo keo tha cac den vao dung vi tri muon muon
$(function () {
	// $(".den").draggable(); //keo tha dung vi tri => lay css tu chrome => css
	// $(".quat").draggable();
	// $(".tv").draggable();
	function request_api_get_status_room() { 
		$.post('api.aspx', {}, function (data) {
			var json = JSON.parse(data);
			if (json.ok) {
				//json chua thong tin:
				//json.den la  1 array[1, 1, 1, 1, 0, 0] //4 den 1234 sang, 2 den 5 6 tat
				//json.quat la 1 array[1,0,0,1] //quat gv, qat 1: on, 2 quat giua off
				//json.tv=0|1  => on /off
				console.log("=====================")
				//api da READ db (txt,ini, sqlite, sqlserver...): dung format ta muon
				for (var i = 0; i < json.den.length; i++) {
					console.log("den " + i + " gia tri = " + json.den[i]); //tesst thay dung y roi
					//chuyen no len UI
					//UI da setup = class het roi, test ngon roi
					if (json.den[i] == 0)
						$('#den' + (i + 1)).removeClass("on").addClass("off");
					else
						$('#den' + (i + 1)).removeClass("off").addClass("on");
				}

				for (var i = 0; i < json.quat.length; i++) {
					if (json.quat[i] == 0)
						$('#quat' + (i + 1)).removeClass("on").addClass("off");
					else
						$('#quat' + (i + 1)).removeClass("off").addClass("on");
				}

				if (json.tv == 0)
					$('#tv1').removeClass("on").addClass("off");
				else
					$('#tv1').removeClass("off").addClass("on");

			} else {
				$('#loi_here').html(json.msg);
			}
		});
	}
	setInterval(function () { request_api_get_status_room(); }, 1000);
});