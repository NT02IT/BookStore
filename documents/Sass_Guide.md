# Các hướng dẫn liên quan đến việc sử dụng database

## Các bước khởi tạo Sass file (bỏ qua nếu project đã có)

### Bước 1. 

Di chuyển đến thư mục project (Ví dụ: `cd frontend-admin`)

### Bước 2. 

Chạy lệnh `npm init -y` để tạo 1 `package.json` giúp quản lý các package version cũng như khởi chạy dự án thông qua npm

### Bước 3. 

Tạo thư mục `src` để chứa code SASS, và thư mục `public` để chứa code CSS

### Bước 4. 

Cài đặt SASS `npm install -D sass`

### Bước 5. 

Trong file `package.json`, thêm 1 dòng khởi chạy giúp biên dịch SASS 

```json
"scripts": {
  ...
  "start": "sass <inputPath>:<outputPath>"
  ...
}
```
Dòng khởi chạy có dạng `sass <inputPath>:<outputPath>`, chúng ta sẽ khai báo cho sass cần biên dịch bất kỳ file .scss nào mà nó tìm thấy (ngoại trừ những tệp bắt đầu bằng dấu gạch dưới) từ thư mục src/scss và xuất tới public/.

### Bước 6. 

Viết code SASS

### Bước 7. 

Có 1 vài sự khác biệt khi build ở môi trường development và production. Nếu ở môi trường Dev, bạn cần giữ code nguyên vẹn, cùng với source-map giúp debug và dễ dàng tìm kiếm khi phát sinh lỗi, lỗi ở đâu. Nếu ở môi trường Prod, bạn cần nén code, loại bỏ source-map, những khoảng trống và comment không cần thiết để tăng hiệu suất.

Khi nãy chúng ta đã tạo 1 lệnh giúp build code về CSS, bây giờ hãy tách riêng nó ra 2 phiên bản cho phù hợp với đặc điểm của mỗi môi trường.

```json
"scripts": {
    ...
    "sass:dev": "sass --watch --embed-source-map src/scss:public/styles",
    "sass:prod": "sass --no-source-map --style compressed src/scss:public/styles"
    ...
}
```

**Dev Script:** `--watch` giúp SASS lắng nghe trong thư mục `src/scss` và biên dịch lại nếu phát hiện có sự thay đổi trong file. `--embed-source-map` để tạo ra source-map dành cho file CSS đã được biên dịch.

**Prod Script:** Sử dụng `--no-source-map` để không khởi tạo source-map. Còn `--style compressed` giúp nén và loại bỏ bất kỳ khoảng trắng không cần thiết nào khỏi file CSS đã biên dịch. 

### Bước 8. 

Chạy `npm run start` hoặc `npm run sass:dev` tại terminal để chuyển đổi từ .scss sang .css