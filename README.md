# Dự án BookStore - Ứng dụng quản lý cửa hàng bán sách

> Seminar Project môn Lập trình web nâng cao - Đại học Sài Gòn.

**Được thực hiện bởi:**

- Nguyễn Anh Tuấn (Leader) - @NT02IT
- Nguyễn Duy Nghiêm - @wandermoi
- Nguyễn Công Huấn - @CongHuanDev

---

## Đối tượng sử dụng ứng dụng

### 1. Chủ cửa hàng (admin)

**Mong muốn:**

- Xem các báo cáo về tình hình kinh doanh như: doanh thu, lợi nhuận, tổng chi,... theo khoảng thời gian
- Hợp tác các nhà cung cấp mới một cách nhanh chóng
- So sánh giá nhập cùng 1 sản phẩm giữa các nhà cung cấp với nhau
- Có thể quản lý dữ liệu một cách tập trung

### 2. Nhân viên bán hàng (sales staff)

**Mong muốn:**

- Có thể bán hàng trực tiếp cho khách hàng (bán hàng tại quầy)
- Có thể theo dõi đơn hàng của khách và hỗ trợ vận đơn
- Các trạng thái rõ ràng dễ thay đổi cập nhật
- Có thể kiểm soát lượng hàng tồn/ thiếu hàng và tạo yêu cầu cho kho nhập thêm hàng lên cửa hàng online

### 3. Nhân viên kho (warehouse staff)

**Mong muốn:**

- Có thể dễ dàng tạo phiếu nhập hàng
- Nhập hàng tự động bằng cách quét mã, ra file excel sau đó import file excel này vào hệ thống
- Không bỏ lỡ thông báo các yêu cầu từ phía Nhân viên bán hàng

### 4. Quản lý nhân sự (HR manager)

**Mong muốn:**

- Có thể quản lý nhân sự và lương một cách thuận tiện
- Có thể quản lý đối tác/ nhà cung cấp

### 5. Người mua hàng (enduser)

**Mong muốn:**

- Giao diện thân thiện, tìm kiếm chính xác sản phẩm cần mua
- Quy trình mua hàng dễ dàng
- Có thể đổi trả hàng dễ dàng
- Sản phẩm được giảm giá, giá rẻ hơn thị trường

## Các tính năng chính của ứng dụng

### 1. Ứng dụng dành cho admin

#### 1.1. Module Đăng nhập và Đăng xuất

**Các tính năng chính:**

- Đăng nhập
- Đăng xuất
- Quên mật khẩu

#### 1.2. Module Cửa hàng

**Các tính năng chính:**

- Kiểm soát sản phẩm đã lên cửa hàng online
- Gửi ticket yêu cầu xuất hàng
- Gán giá niêm yết cho các sản phẩm chuẩn bị lên sàn
- Bán hàng trực tiếp cho khách hàng thân thiết (đã có tài khoản) hoặc khách vãng lai

#### 1.3. Module Kho

**Các tính năng chính:**

- Nhập sách
- Xuất sách

#### 1.4. Module Nhân viên

**Các tính năng chính:**

- Quản lý nhân viên

#### 1.5. Module Khách hàng

**Các tính năng chính:**

- Quản lý khách hàng

#### 1.6. Module Sách

**Các tính năng chính:**

- Quản lý các đầu sách đang kinh doanh
- Gán nhãn, phân loại sách theo các thể loại

#### 1.7. Module Nhà cung cấp

**Các tính năng chính:**

- Quản lý nhà cung cấp

#### 1.8. Module Thống kê

**Các tính năng chính:**

- Thống kê sản phẩm bán chạy theo khoảng thời gian
- Xem báo cáo tình hình kinh doanh
- Xem thống kê doanh thu và lợi nhuận theo từng dòng sản phẩm

#### 1.9. Module Phân quyền

**Các tính năng chính:**

- Phân quyền cho người dùng trên hệ thống

#### 1.10. Module Thông báo

**Các tính năng chính:**

- Xử lý các thông báo khi có đơn hàng mới 
- Xử lý các thông báo khi có ticket mới

#### 1.11. Module Chuẩn hóa dữ liệu, Xác thực dữ liệu và Bảo mật

**Các tính năng chính:**

- Chuẩn hóa dữ liệu trước khi xử lý logic
- Xác thực dữ liệu trước khi đưa xuống database
- Mã hóa dữ liệu nhạy cảm trước khi lưu vào database

---

## Các tài liệu liên quan

UI Design: https://www.figma.com/design/5EAfNhhGd52btSnkwFDIb3/BookStore-UID?node-id=0-1&p=f&t=i4pA1HcC3HdVeuTd-0
Google Drive: https://drive.google.com/drive/u/0/folders/1T9wW310YdWth2FPaMTlH5AKy9FxJxmZs
ERD: https://app.diagrams.net/#G1c_YzuMURALfCf-rHXdgAC1plLlyk_-ps
Technical Requirements: https://docs.google.com/spreadsheets/d/1jNAJynDGe1vUjzTAobyjemC_rnRcuqLkgO9jzcfv2ks/edit?gid=0#gid=0