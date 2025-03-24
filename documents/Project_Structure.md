# Kiến trúc project

Project được thực hiện theo kiến trúc Microservices, được chia làm 3 services chính là:

- Backend Service: Xử lý logic, API, tương tác với database MySQL qua Stored Procedures
- Frontend Admin Service: Xử lý giao diện Admin, gửi yêu cầu AJAX đến Backend Service thông qua API
- Frontend Enduser Service: Xử lý giao diện End user, gửi yêu cầu AJAX đến Backend Service thông qua API

## Cấu trúc thư mục

```bash
/BookStore
    /backend
        /config         # Chứa file kết nối Database, cài đặt chung,...
        /models         # Giao tiếp với MySQL qua Stored Procedure
        /dto            # Giao tiếp trung gian và đóng gói kiểu dữ liệu trả về cần thiết thay vì trả về toàn bộ nội dung model
        /controllers    # Điều hướng đến các services
        /services       # Xử lý logic 
        /public         # Chứa index.php làm entry point
        /routes         # Xác định các API endpoint
        /utils          # Chứa các hàm tiện ích (validation, normalization,...)
        /.env           # Cấu hình biến môi trường
        /composer.json # Dùng Conposer để quản lý package
    /frontend-enduser
        /assets         # Chứa fonts, icons, imgs,...
        /scss           # Chứa scss
        /css            # Chứa css được biên dịch từ scss (không sửa đổi trên các file css này)
        /js             # Chứa file jQuery, AJAX
        /views          # Chứa các trang html, php
        /index.php      # Trang chính của cửa hàng bán sách
    /frontend-admin
        /assets         # Chứa fonts, icons, imgs,...
        /scss           # Chứa scss
        /css            # Chứa css được biên dịch từ scss (không sửa đổi trên các file css này)
        /js             # Chứa file jQuery, AJAX
        /views          # Chứa các trang html, php
        /index.php      # Trang chính của trang admin
    /database
        /storages       # Lưu trữ các dữ liệu lớn như file, ảnh, video,...
        /migrations     # Chứa các .sql update cơ sở dữ liệu
        /procedures     # Chứa các stored procedures
        /crawl-data     # Chứa code crawl dữ liệu từ nhiều nguồn khác nhau
        /create-database.sql        # Khởi tạo database
        /insert-defaultdata.sql     # Khởi tạo các data default của hệ thống
    /documents          # Chứa các document, hướng dẫn cần thiết 
    /.gitignore    
    /README.md
```
