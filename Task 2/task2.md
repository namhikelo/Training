# LVM

- LVM (Logical Volume Management) là quản lý lưu trữ trên Linux, cho phép người dùng tổ chức và mở rộng các phân vùng bằng cách gom nhóm các ổ đĩa vật lý lại và phân chia chúng thành các phần nhỏ hơn.

- **Ưu điểm của LVM:**
  - Quản lý một lượng lớn ổ đĩa một cách dễ dàng.
  - Điều chỉnh phân vùng ổ cứng một cách linh động.
  - Backup hệ thống bằng cách snapshot các phân vùng ổ cứng (real-time).
  - Migrate dữ liệu dễ dàng.

## Physical Volume

- **LVM, hoặc Logical Volume Manager, là  quản lý ổ đĩa linh hoạt trên Linux. Đây là cách hữu ích để quản lý lưu trữ trên hệ thống máy chủ.**

  - **Physical Volume (PV)**: Đây là các ổ đĩa vật lý, phân vùng, hoặc thiết bị lưu trữ khác như SSD, được sử dụng bởi LVM. Mỗi PV chứa một phần header để ghi thông tin về cách phân bổ trong Volume Group (VG) của nó.

