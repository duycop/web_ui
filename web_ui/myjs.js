$(function () {
	function set_status(selector, status) {
		if (status == 0)
			$(selector).removeClass("on").addClass("off");
		else
			$(selector).removeClass("off").addClass("on");
	}
	function request_api_get_status_room() {

		//gửi lên api.aspx, ko gửi gì, phản hồi lại là text trong biến data
		$.post('api.aspx', { action: 'get_status' }, function (data) {
			var json = JSON.parse(data); //chuyển data sang đối tượng json . JSON là thứ có sẵn của js
			if (json.ok) {
				for (var i = 0; i < json.den.length; i++)set_status('#den' + (i + 1), json.den[i]);
				for (var i = 0; i < json.quat.length; i++)set_status('#quat' + (i + 1), json.quat[i]);
				set_status('#tv1', json.tv);

			} else {
				$('#loi_here').html(json.msg);
			}
		});
	}

	//mỗi 1 giây lại gọi hàm : request_api_get_status_room
	setInterval(function () { request_api_get_status_room(); }, 1000);

	//khi click vào đèn,quạt,tv thì show hộp thoại
	//xem lịch sử? điều khiển: đảo trạng thái
	$(".den,.quat,.tv").click(function () {
		var sid = $(this).data('sid');
		var status = $(this).hasClass('on') ? 1 : 0;
		hop_thoai(sid, status);
	});

	const map = [{ "id": 1, "name": "tivi Xiaomi 65Inch" }, { "id": 11, "name": "Q1" }, { "id": 12, "name": "Q2" }, { "id": 13, "name": "Q3" }, { "id": 14, "name": "Quạt treo tường GV" }, { "id": 101, "name": "Đèn1" }, { "id": 102, "name": "Đèn2" }, { "id": 103, "name": "Đèn3" }, { "id": 104, "name": "Đèn4" }, { "id": 105, "name": "Đèn5" }, { "id": 106, "name": "Đèn6" }]

	function hop_thoai(sid, status) {
		var html = 'sid = ' + sid + "  Hiện tại nó đang " + status + "<br>";
		for (var tb of map) {
			if (tb.id == sid) {
				html += "Bạn đang điều khiển thiết bị: " + tb.name + '<hr>';
				break;
			}
		}

		if (status == 0)
			html += `<button class="btn btn-primary nut_bat_tat" data-control="1">Bật nó</button>`;
		else
			html += `<button class="btn btn-danger nut_bat_tat" data-control="0">Tắt nó</button>`;

		//html += ` <button class="btn btn-info nut_history" >Xem lịch sử bật tắt</button>`;
		html += '<br><div class="table-responsive" id="history_here"></div>';
		var dialog=$.confirm({
			title: 'Điều khiển',
			content: html,
			columnClass: 'l',
			buttons: {
				Close: function () {
					//ko co gi
				},
			},
			onContentReady: function () {
				$('.nut_bat_tat').click(function () {
					//mày muốn gì?
					var new_status = $(this).data('control');
					//gửi đi
					var gui_di = { action: 'control', id: sid, status: new_status };
					//alert(JSON.stringify(gui_di));  //test done
					//gửi đi thật
					$.post('api.aspx', gui_di, function (data) {
						var json = JSON.parse(data);
						if (!json.ok)
							alert(json.msg);
						else {
							dialog.close();
						}
					})
				});

				function xem_lich_su() {
					var gui_di = { action: 'get_history', id: sid };
					$.post('api.aspx', gui_di, function (data) {
						var json = JSON.parse(data);
						//json là mảng
						var tb = '<table class="table">';
						tb += '<thead><tr><th>STT</th><th>Trạng thái</th><th>Thời gian</th></tr></thead>';
						tb += '<tbody>';
						var stt = 0;
						for (var item of json) {
							stt++;
							var status = item.status ? 'Bật' : 'Tắt';
							var time = item.time;
							tb += `<tr><td>${stt}</td><td>${status}</td><td>${time}</th></tr>`;
						}
						tb += '</table>';
						$('#history_here').html(tb);
					})
				};
				xem_lich_su(); //tự chạy luôn
			}
		});
	}
});