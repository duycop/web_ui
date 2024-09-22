# BÀI TẬP VỀ NHÀ 02: (ko dành cho sv đã bị cấm thi)

## DEAD LINE: 

  - **23:59:59 NGÀY 22/09/2024**
  - **QUÁ GIỜ NÀY VẪN CHƯA HOÀN THÀNH YÊU CẦU TỐI THIỂU LÀ CẤM THI**

# ĐỀ LẺ: DÀNH CHO SV CÓ MÃ SV CÓ SỐ CUỐI LÀ SỐ LẺ (1,3,5,7,9)

1. Tạo website **giám sát** vị trí các thành viên trong lớp 57kmt (ở ktx, ở nhà trọ, ở trường, ở chợ, không biết đang ở đâu) . ko cần vị trí gps
2. Sử dụng database SQL Server với cấu trúc phù hợp.
3. Giao diện web **cho phép cập nhật** thay đổi vị trí mỗi thành viên.
4. Thống kê dạng bảng sự thay đổi vị trí của mỗi thành viên.
5. Báo cáo thời điểm tất cả các thành viên đều có ở trường.

# ĐỀ CHẴN: DÀNH CHO SV CÓ MÃ SV CÓ SỐ CUỐI LÀ SỐ CHẴN (0,2,4,6,8)

1. Tạo website **giám sát** trạng thái các phòng học của tnut, mỗi phòng có các trạng thái: CÓ NGƯỜI HỌC, KHÔNG CÓ NGƯỜI HỌC, ĐANG SỬA CHỮA
2. Sử dụng database SQL Server với cấu trúc phù hợp.
3. Giao diện web **cho phép cập nhật** thay đổi trạng thái mỗi phòng học.
4. Thống kê dạng bảng sự thay đổi trạng thái các phòng.
5. Báo cáo thời điểm có ít phòng ĐANG CÓ NGƯỜI HỌC
  
# HƯỚNG DẪN CÁC BƯỚC LÀM:

1. Sử dụng vs2022, Sql server 2019
2. Tạo solution trên vs2022, có thay đổi lớn là commit và push lên github
3. Để link GITHUB LÀ **PRIVATE** NHƯNG ADD THẦY ( duycop@gmail.com ) VÀO, MỌI LẦN PUSH THẦY ĐỀU ĐƯỢC BÁO EMAIL: ![image](https://github.com/user-attachments/assets/7675aea3-2c2a-48e5-bece-974b7889ca89)
4. Paste link public của Repository vào link sau (sử dụng tài khoản @tnut để edit file excel sau): [paste link github vào đây](https://docs.google.com/spreadsheets/d/1I5CjD4tDEX_gIaOB9UwCMqXJEHihkibVGggCYwWhYv0/edit?usp=sharing)
5. Tạo ứng dụng web loại **ASP.NET Web Application (.NET Framework)** sử dụng **.NET Framework 2.0**
6. Tạo **index.html** làm giao diện trang web (one page application)
7. Giao diện thay đổi hình dạng theo các trạng thái của đối tượng cần monitor => cần ảnh (nên dùng png) và các .class  #id để định vị nó
8. Kéo thả các đối tượng đến đúng vị trí (dùng thư viện jQueryUI) => **F12** Lấy css từ thay đổi về vị trí các đối tượng => cập nhật vào file css. Tham khảo link [https://jqueryui.com/](https://jqueryui.com/)
9. Tạo file js, dùng jQuery để gắn các hành động click các đối tượng tới hàm. Tham khảo cách dùng jQuery tại [https://www.w3schools.com/jquery/](https://www.w3schools.com/jquery/)
10. Sử dụng thư viện jQuery-Confirm để tạo các hộp thoại với content phù hợp. Tham khảo [https://craftpip.github.io/jquery-confirm/](https://craftpip.github.io/jquery-confirm/)
11. Tạo api.aspx => ko dùng designer (bỏ hết code autogen, giữ lại line1). Code trong file api.aspx.cs tại hàm Page_Load
12. App có form đăng nhập, chú ý dùng Hash ở SQL vì SQL ko phân biệt **HOA thường** trong pw. Nếu đăng nhập đúng user/pass trong db thì mới có thể control được, ko đăng nhập thì chỉ monitor thôi

# ĐƯỢC PHÉP THAM KHẢO NHƯNG ...

1. ĐƯỢC THAM KHẢO TẤT CẢ CÁC NGUỒN TÀI LIỆU ĐỂ HIỂU VẤN ĐỀ CẦN ĐƯỢC GIẢI QUYẾT NHƯ THẾ NÀO, NHƯNG..
2. KO ĐƯỢC SAO CHÉP DƯỚI MỌI HÌNH THỨC.
3. PHẢI BIẾN NÓ THÀNH CỦA MÌNH.
4. MỌI SỰ GIAN LẬN SAO CHÉP ĐỀU BỊ CẤM THI.
5. MIỄN GIẢI TRÌNH MỌI LÝ DO SAU KHI BỊ CẤM THI.
6. HAI BÀI GIỐNG NHAU: CẤM THI CÓ TIME SUBMIT SAU. (PUSH LÊN GITHUB TRƯỚC CÓ LỢI)
