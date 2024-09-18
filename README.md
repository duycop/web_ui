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
