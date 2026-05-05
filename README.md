# Phân Tích Hoạt Động Kinh Doanh Bảo Hiểm (Insurance Business Performance Dashboard)

## Giới thiệu dự án
Dự án này là một Dashboard tương tác được xây dựng để phân tích và theo dõi hiệu suất kinh doanh của một công ty bảo hiểm. Báo cáo cung cấp cái nhìn toàn diện về 4 khía cạnh chính: **Tổng quan doanh thu**, **Hành vi khách hàng**, **Cơ cấu sản phẩm**, và **Hiệu suất của các phòng ban/kênh phân phối**.

**Công cụ sử dụng:** Power BI, SQL, Python

---

## Mục tiêu kinh doanh (Business Questions)
Dashboard được thiết kế để trả lời các câu hỏi sau:
1. Doanh thu hiện tại có đạt mục tiêu đề ra không? Đang đến từ những chi nhánh và kênh bán nào?[cite: 1]
2. Chân dung khách hàng là ai? Tỷ lệ giữ chân và bán chéo sản phẩm đang ở mức nào?[cite: 1]
3. Nhóm sản phẩm nào đang mang lại hiệu quả cao nhất?[cite: 1]
4. Kênh phân phối và phòng ban nào đang hoạt động vượt/đạt/chưa đạt KPI?[cite: 1]

---

## Quy trình thực hiện (Data Workflow)
1. **Làm sạch dữ liệu (Python):** Sử dụng thư viện Pandas để xử lý dữ liệu thô, chuẩn hóa định dạng ngày tháng và xử lý các giá trị thiếu (Null).
2. **Biến đổi & Trích xuất (SQL):** Thực hiện các phép tính toán (Aggregations), phân hạng khách hàng và tính toán tỷ lệ hoàn thành KPI để chuẩn bị tập dữ liệu cho báo cáo.[cite: 1]
3. **Mô hình hóa dữ liệu:** Thiết lập các mối quan hệ (Relationships) giữa bảng Khách hàng, Hợp đồng, Sản phẩm và Chi nhánh.
4. **Trực quan hóa:** Xây dựng dashboard tương tác giúp nhà quản lý theo dõi biến động kinh doanh theo thời gian thực.

---

## Kỹ năng Kỹ thuật sử dụng

### 1. Python (Data Cleaning)
*   Sử dụng thư viện **Pandas** để chuẩn hóa dữ liệu đầu vào.
*   Xử lý kiểu dữ liệu, loại bỏ dữ liệu trùng lặp và làm sạch tệp khách hàng.

### 2. SQL (Data Transformation)
Trong dự án này, tôi đã sử dụng các kỹ thuật SQL nâng cao:
*   **CTEs & Subqueries:** Để phân nhóm khách hàng theo doanh thu.[cite: 1]
*   **Window Functions:** Tính toán xu hướng tăng trưởng doanh thu theo tháng.[cite: 1]
*   **Joins:** Kết nối dữ liệu từ nhiều bảng (Khách hàng, Chi nhánh, Kênh bán hàng).[cite: 1]

---

## Các Insight Chính
Dựa trên phân tích dữ liệu từ file **BẢO HIỂM.pdf**, dưới đây là những kết quả nổi bật nhất:

### 1. Tổng quan & Doanh thu
*   **Tổng doanh thu:** Đạt **770.56 tỷ VNĐ**, hoàn thành **79.28%** so với mục tiêu đề ra là 971.90 tỷ VNĐ.[cite: 1]
*   **Chi nhánh dẫn đầu:** Hội sở đóng góp phần lớn doanh thu (292.29 tỷ VNĐ), theo sau là Bình Dương và Hà Nội.[cite: 1]
*   **Cơ cấu hợp đồng:** Tỷ lệ hợp đồng tái tục đạt **20.70%**.[cite: 1]

### 2. Hành vi Khách hàng
*   **Tăng trưởng tệp KH:** Tổng số khách hàng đạt mức **130K**, trong đó có lượng lớn khách hàng mới là **97K**.[cite: 1]
*   **Giá trị khách hàng:** Phí bảo hiểm trung bình trên mỗi khách hàng đạt **5.92 triệu VNĐ**.[cite: 1]
*   **Bán chéo:** Tỷ lệ khách hàng sở hữu đa sản phẩm đang ở mức **14.20%**.[cite: 1]
*   **Nghề nghiệp:** Tệp khách hàng tập trung nhiều vào nhóm "Nhân viên văn phòng" (6.80%) và "Giáo viên" (6.61%).[cite: 1]

### 3. Phân tích Sản phẩm
*   **Sản phẩm chủ lực:** Báo cáo cho thấy nhóm **Bảo hiểm tự nguyện** chiếm ưu thế tuyệt đối với **95.66%** doanh thu.[cite: 1]
*   Tỷ lệ hợp đồng kỳ hạn 12 tháng chiếm 36.79%.[cite: 1]

### 4. Hiệu suất (Performance)
*   Doanh thu trung bình mang về trên mỗi nhân viên đạt mức **57.23 triệu VNĐ**.[cite: 1]
*   **Kênh bán hàng:** Chỉ có **Kênh trực tiếp** (hoàn thành 159.00%) và **Kênh đại lý** (hoàn thành 104.76%) là vượt chỉ tiêu KPI.[cite: 1]
*   Có tổng cộng 11 phòng ban đạt KPI.[cite: 1]

---

## Giao diện Dashboard

*   **Trang 1:** Tổng quan Doanh thu
*   **Trang 2:** Phân tích Khách hàng
*   **Trang 3:** Phân tích Sản phẩm
*   **Trang 4:** Hiệu suất Phòng ban

---

## Cấu trúc thư mục
*   `Data_Processing/`: Chứa file Python (`cleaning.py`) và SQL (`transformation.sql`) xử lý dữ liệu.
*   `Dashboards/`: Chứa file gốc báo cáo `DATAGO.pbix`.
*   `Data/`: Dữ liệu mẫu (Data Dictionary).
*   `Images/`: Ảnh chụp màn hình các trang báo cáo.

---

## Hướng dẫn xem báo cáo gốc
1. Clone repository này về máy.
2. Tải phần mềm Power BI Desktop.
3. Mở file **DATAGO.pbix** trong thư mục `/Dashboards`.
