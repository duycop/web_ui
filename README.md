# web_ui

## Mục tiêu:

Tạo ứng dụng trực quan hoá thực địa, để giám sát realtime được thuận tiện.

## Bản chất

1. Tạo sẵn class css với các trường hợp cần hiển thị
2. Dữ liệu json với format biết trước, cover hết các khả năng
3. căn cứ vào json data: xác định được đối tượng cần thay đổi, đổi css class sang trạng thái mới

## Các bước thực hiện

1. Khảo sát hiện trạng, lắp cảm biến, code nhúng đọc cảm biến, lưu trữ vào db với cấu trúc phù hợp: Ko bàn ở môn học này.
2. Tạo web app, add api.aspx, remove all line of design, keep line 1.
3. Code in api.aspx.cs: trong hàm Page_Load : dùng 1 DLL nào đó (độc lập) để đọc được dữ liệu trạng thái của hệ thống. chuyển thành json, gửi về cho client.
4. Tạo file index.html, thiết kế giao diện phù hợp: vd này dùng toàn DIV kết hợp thuộc tính id và class một cách khéo léo.
5. Chuẩn bị các ảnh mô tả trạng thái các thiết bị, tạo nen.png mô tả sơ bộ vị trí các đối tượng. ảnh png có vùng trong suốt, tiện cho hiển thị đè nhau => biết nghịch photoshop.
6. Sử dụng thư viện jquery.min.js và jquery-ui.min.js Có thể  kéo thả các file download này vào Project của vs2022. trong vs2022 kéo thả các file từ Solution Explorder vào thẻ head của index.html
7. Tạo myjs.js để code js: cho phéo kéo thả các đối tượng theo class  vd $(".den").draggable();
8. Tạo mycss.css để viết code css: trong đó chú ý phần .class (.den  .quat .tv) nó sẽ áp dụng chung cho các class đó, còn các #id sẽ áp dụng cho 1 đối tượng. Có thể kéo thả ảnh vào file mycss.css
9. Chạy thử file index.html trên iis, kéo thả các đối tượng đến vị trí mong muốn, F12, lấy css thay đổi (do jquery.min.js tạo ra) copy paste vào #id tương ứng trong mycss.css ; lặp lại với các đối tượng khác.
10. Code cho myjs.js: AJAX tới api.aspx để yêu cầu dữ liệu trạng thái hệ thống. DLL sẽ lấy đc trạng thái và chuyển về json. api.aspx sẽ trả về string json. myjs.js nhận đc chuỗi text (ở format json) thì chuyển nó thành đối tượng json xịn json = JSON.parse(data); xử lý khéo léo dữ liệu json này để thay đổi các class của các div để thể hiện trạng thái của đối tượng.
11. Bài này sử dụng mydb.txt là csdl, mở nó bằng notepad, chage and save => thấy ngay kết quả.
12. file myjs_old.js có nhiều comment như khi làm trên lớp, file myjs.js là bản clone, đã xoá bớt đi những comment cho gọn code
13. full code của solution đã gửi lên github này.

## Video quay màn hình quá trình làm tại lớp:

- Đã gửi video qua nhóm telegram, [Xem video](https://t.me/c/2461681536/19) 420.8MB

# Nội dung buổi học ngày 19-09-2024:

## Cập nhật DLL : Có khả năng truy xuất dữ liệu từ SQL Server
1. Tạo db với cấu trúc phù hợp: xem file [script sql](web_ui/db/abc-data.sql)
2. Tạo SP_API xử lý 3 khả năng: **get_status**, **get_history** và **control** => trả về json sau khi thực hiện.  xem phần cuối file [script sql](web_ui/db/abc-data.sql)
3. DLL có class nhận cnstr là chuỗi kết nối, thực thi command là SP_API với tham số phù hợp, thực thi dạng **cmd.ExecuteScalar();** để thu về chuỗi json => Xem class thứ 2 trong file [class dll](read_db/txt_db.cs)
4. api.aspx.cs phân luồng các yêu cầu bằng biến action, vì ajax sẽ cùng gửi lên api nhưng với action khác nhau, xem phần switch trong [api.aspx.cs](web_ui/api.aspx.cs)
5. Mỗi yêu cầu của action được gọi 1 hàm tương ứng. Mỗi hàm sẽ lấy thêm dữ liệu post lên từ client. vd: **int idSensor = int.Parse(this.Request["id"]);**  sau đó gọi DLL và truyền tham số vào để lấy được json. gửi json này về client

## Cập nhật index.html:

1. Thêm các thuộc tính html5 vào các div. ví dụ:  <div id="den1" class="den" **data-sid="101"** ></div>
2. Download thư viện, kéo vào project, và thêm dòng tham chiếu tới thư viện đó trong index.html: 
 - bootstrap.min.css
 - bootstrap.bundle.min.js
 - jquery-confirm.min.css
 - jquery-confirm.min.js

## Cập nhật myjs.js

1. Đăng ký sự kiện khi click vào đèn,quạt,tv thì show hộp thoại : **$(".den,.quat,.tv").click(function(){ do_some_thing_here })**
2. Hộp thoại phải lấy được sid và status của thiết bị bị clicked: **var sid = $ (this).data('sid'); var status = $ (this).hasClass('on') ? 1 : 0;**
3. Hộp thoại có giao diện phù hợp, tự động lấy history của thiết bị, hậu xử lý thành html và show ra vị trí phù hợp **$('#history_here').html(tb);**
4. Thêm nút để bật tắt thiết bị: bản chất là gửi đi {action='control',sid=sid của thiết bị, status=new_status}

## Thêm DLL để gửi y/c bật tắt sang Node-Red

1. Đã cài sẵn node-red trên docker desktop, port 1880
2. tạo luồng nhận dữ liệu tới 127.0.0.1:1880/dieu_khien  (sủ dụng node: http_in và http_response)
3. trong class c#: copy paste code từ chatGPT đẻ ra, để gửi yêu cầu tới url với data json phù hợp việc bật tắt thiết bị sid
4. debug trên nodered thấy nhận đúng dữ liệu thao tác control bật tắt từ web
5. thêm mã dùng DLL này vào hàm control của api.aspx.cs => xem dòng 42, 43 của [asp.aspx.cs](web_ui/api.aspx.cs)

## Không cần cập nhật mycss.cs

## Kết quả buổi học 19.9.2024:

1. Thấy rằng việc giám sát và điều khiển realtime cũng dễ
2. Việc bật tắt thiết bị thật: phải có phần cứng thực hiện (PLC, adruino, esp8266, ....). Việc app của chúng ta dùng thư viện DLL control_nodered để tiện cho việc giao tiếp với phần cứng. trên lớp chỉ debug để thaasya rằng đã nhận được đúng dữ liệu gửi sang nodered từ giao diện web mà người dùng muốn bật/tắt
3. Việc lấy trạng thái các thiết bị : phải dùng sensor để đo trực tiếp, hoặc gián tiếp để ra số liệu
4. Phải tổ chức đc csdl phù hợp thì mới lưu đc trạng thái và lịch sử
5. phải biết dùng SQL (các môn trước) thì giờ mới lấy đc nó (get_status, get_history, control) qua lệnh SQL
6. Việc sử dụng các selector trong css và trong cú pháp cả jQuery là như nhau , hổng thì phải đọc đọc và đọc
7. các thư viện mới: jquery-confirm: cách dùng đơn giản và thú vị => giúp tạo các dialog động => giúp trang monitor thành app dạng One_page rất hiệu quả trong giám sát và điều khiển online realtime.

## Bài tập về nhà 02: Tối nay giao (19.9) chú ý  DEAD-LINE: 3 NGÀY
