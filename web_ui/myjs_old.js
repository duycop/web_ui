
//cho pheo keo tha cac den vao dung vi tri muon muon
$(function () {
	// $(".den").draggable(); //keo tha dung vi tri => lay css tu chrome => css
	// $(".quat").draggable();
	// $(".tv").draggable();

	function set_status(selector, status) {
		if (status == 0)
			$(selector).removeClass("on").addClass("off");
		else
			$(selector).removeClass("off").addClass("on");
	}
	function request_api_get_status_room() { 

		//gửi lên api.aspx, ko gửi gì, phản hồi lại là text trong biến data
		$.post('api.aspx', {}, function (data) {
			var json = JSON.parse(data); //chuyển data sang đối tượng json . JSON là thứ có sẵn của js
			if (json.ok) {
				//json chứa thông tin:
				//json.den  là 1 array[1, 1, 1, 1, 0, 0] //4 đèn 1234 sang, 2 den 5 6 tat
				//json.quat là 1 array[1,0,0,1]			 //quat gv, qat 1: on, 2 quat giua off
				//json.tv=0|1  => on /off				 //chỉ có 1 tv, ko cần mảng
				console.log("=== cái này để phân cách, phân biệt mỗi lần nhận lại json ===")
				//api đã READ db (txt,ini, sqlite, sqlserver...): đúng format ta muốn
				for (var i = 0; i < json.den.length; i++) {
					console.log("den " + i + " gia tri = " + json.den[i]); //test thấy đúng ý rồi
					//chuyển nó lên UI
					//UI đã setup bằng class trong mycss.css hết rồi, đã test ngon rồi

					//if (json.den[i] == 0)
					//	$('#den' + (i + 1)).removeClass("on").addClass("off");
					//else
					//	$('#den' + (i + 1)).removeClass("off").addClass("on");

					//gọi hàm set_status
					set_status('#den' + (i + 1), json.den[i]);
				}

				for (var i = 0; i < json.quat.length; i++) {
					//if (json.quat[i] == 0)
					//	$('#quat' + (i + 1)).removeClass("on").addClass("off");
					//else
					//	$('#quat' + (i + 1)).removeClass("off").addClass("on");

					//gọi hàm set_status
					set_status('#quat' + (i + 1), json.quat[i]);
				}

				//if (json.tv == 0)
				//	$('#tv1').removeClass("on").addClass("off");
				//else
				//	$('#tv1').removeClass("off").addClass("on");

				//gọi hàm set_status
				set_status('#tv1', json.tv);

			} else {
				$('#loi_here').html(json.msg);
			}
		});
	}

	//mỗi 1 giây lại gọi hàm : request_api_get_status_room
	setInterval(function () { request_api_get_status_room(); }, 1000);
});