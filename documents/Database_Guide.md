# Các hướng dẫn liên quan đến việc sử dụng database

## Hướng dẫn khởi tạo Database

<!-- Bước 1: Chạy file `create-database.sql`

Bước 2: Chạy file `insert-defaultdata.sql`

Bước 3: Chạy lần lượt tất cả các file trong folder `procedures` -->

**Bước 1:** Bật XAMPP

**Bước 2:** Bật các dịch vụ: Apache và MySQL

**Bước 3:** Vào folder database, phải chuột vào file install.bat để cài đặt database

**Bước 4:** Chương trình sẽ yêu cầu mật khẩu, nếu không đặt mật khẩu cho user root thì chỉ cần enter

Database sẽ tự động cài đặt bằng cách chạy tự động các file .sql

> Chạy file sql bằng cách mở XAMPP, bật Apache và MySQL lên sau đó bấm nút Admin của dịch vụ MySQL hoặc truy cập đường dẫn `http://localhost/phpmyadmin/`. Sau đó chuyển đến tab `SQL`, paste code vào và bấm nút `run` để chạy.
> Điều này đồng nghĩa, khi có thay đổi về database, procedure hoặc các dữ liệu default phải báo lại cho tất cả các thành viên trong nhóm cùng cập nhật CSDL đồng bộ, nếu không chương trình có thể chạy trên máy người này mà không chạy trên máy người kia.

## Cập nhật database

Các cập nhật liên quan đến database vui lòng tạo file mới cho mỗi lần cập nhật với tên ddmmyy-'commit message'.sql và đặt trong folder migrations.

## Kết nối database

Để kết nối database thành công, vui lòng kiểm tra file `.env` xem đã username và password chưa. Nếu không sẽ bị lỗi.
