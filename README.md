# Phân Tích Hoạt Động Kinh Doanh Bảo Hiểm (Insurance Business Performance Dashboard)

##Giới thiệu dự án
Dự án này là một Dashboard tương tác được xây dựng để phân tích và theo dõi hiệu suất kinh doanh của một công ty bảo hiểm. Báo cáo cung cấp cái nhìn toàn diện về 4 khía cạnh chính: **Tổng quan doanh thu**, **Hành vi khách hàng**, **Cơ cấu sản phẩm**, và **Hiệu suất của các phòng ban/kênh phân phối**.

**Công cụ sử dụng:** Power BI, SQL

---
## Quy trình thực hiện (Data Workflow)
1.  **Trích xuất & Xử lý (SQL):** Làm sạch dữ liệu, xử lý các giá trị bị thiếu và thực hiện các phép tính toán (Aggregations) để chuẩn bị tập dữ liệu cho báo cáo.
2.  **Mô hình hóa dữ liệu:** Thiết lập các mối quan hệ giữa bảng Khách hàng, Hợp đồng, Sản phẩm và Chi nhánh.
3.  **Trực quan hóa:** Xây dựng dashboard tương tác giúp nhà quản lý theo dõi biến động kinh doanh theo thời gian thực.

---

##  Kỹ năng SQL sử dụng trong dự án
Trong dự án này, tôi đã sử dụng các kỹ thuật SQL như:
*   **CTEs & Subqueries:** Để phân nhóm khách hàng theo doanh thu.
*   **Window Functions:** Tính toán xu hướng tăng trưởng doanh thu theo tháng.
*   **Joins:** Kết nối dữ liệu từ nhiều bảng (Khách hàng, Chi nhánh, Kênh bán hàng).
---
## Giao diện Dashboard (Tham khảo file BẢO HIỂM.pdf)
(Lưu ý: Thay thế các link ảnh dưới đây bằng ảnh bạn đã upload lên folder Images trên GitHub)

Trang 1: Tổng quan Doanh thu
Trang 2: Phân tích Khách hàng
Trang 3: Phân tích sản phẩm
Trang 4: Hiệu suất Phòng ban

---
## Cấu trúc thư mục
SQL_Scripts/: Chứa các truy vấn xử lý dữ liệu thô.
Dashboards/: Chứa file gốc báo cáo (.pbix hoặc .twbx).
Data/: Dữ liệu mẫu (Data Dictionary).
Images/: Ảnh chụp màn hình các báo cáo.

---
## Mục tiêu kinh doanh (Business Questions)
Dashboard được thiết kế để trả lời các câu hỏi sau:
1. Doanh thu hiện tại có đạt mục tiêu đề ra không? Đang đến từ những chi nhánh và kênh bán nào?
2. Chân dung khách hàng là ai? Tỷ lệ giữ chân và bán chéo sản phẩm đang ở mức nào?
3. Nhóm sản phẩm nào đang mang lại hiệu quả cao nhất?
4. Kênh phân phối và phòng ban nào đang hoạt động vượt/đạt/chưa đạt KPI?

---

## 💡 Các Insight Chính 
Dựa trên phân tích dữ liệu, dưới đây là những kết quả nổi bật nhất:

### 1. Tổng quan & Doanh thu
*   **Tổng doanh thu:** Đạt **770.56 tỷ VNĐ**, hoàn thành **79.28%** so với mục tiêu đề ra là 971.90 tỷ VNĐ.
*   **Chi nhánh dẫn đầu:** Hội sở đóng góp phần lớn doanh thu (292.29 tỷ VNĐ), theo sau là Bình Dương và Hà Nội.
*   **Cơ cấu hợp đồng:** Tỷ lệ hợp đồng tái tục đạt **20.70%**.

### 2. Hành vi Khách hàng
*   **Tăng trưởng tệp KH:** Tổng số khách hàng đạt mức **130K**, trong đó có lượng lớn khách hàng mới là **97K**.
*   **Giá trị khách hàng:** Phí bảo hiểm trung bình trên mỗi khách hàng đạt **5.92 triệu VNĐ**.
*   **Bán chéo:** Tỷ lệ khách hàng sở hữu đa sản phẩm đang ở mức **14.20%**.
*   **Nghề nghiệp:** Tệp khách hàng tập trung nhiều vào nhóm "Nhân viên văn phòng" (6.80%) và "Giáo viên" (6.61%).
  
### 3. Phân tích Sản phẩm
*   **Sản phẩm chủ lực:** Bức tranh doanh thu chủ yếu được thúc đẩy bởi nhóm **Bảo hiểm tự nguyện** (chiếm áp đảo **95.66%**), trong khi bảo hiểm bắt buộc chỉ chiếm 4.34%.
*   Công ty hiện đang cung cấp tổng cộng 21 gói sản phẩm, với tỷ lệ hợp đồng kỳ hạn 12 tháng chiếm 36.79%.

### 4. Hiệu suất (Performance)
*   Doanh thu trung bình mang về trên mỗi nhân viên đạt mức **57.23 triệu VNĐ**.
*   **Kênh bán hàng:** Chỉ có **Kênh trực tiếp** (hoàn thành 159.00%) và **Kênh đại lý** (hoàn thành 104.76%) là vượt chỉ tiêu KPI. Các kênh khác như Kênh doanh nghiệp (11.11%) đang cần chiến lược cải thiện.
*   Có tổng cộng 11 phòng ban đạt KPI.
---

## Hướng dẫn xem báo cáo gốc
1. Clone repository này về máy.
2. Tải phần mềm Power BI Desktop.
3. Mở file 'DATAGO.pbix' trong thư mục `/Dashboards`.
