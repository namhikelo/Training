# LVM

- LVM (Logical Volume Management) là quản lý lưu trữ trên Linux, cho phép người dùng tổ chức và mở rộng các phân vùng bằng cách gom nhóm các ổ đĩa vật lý lại và phân chia chúng thành các phần nhỏ hơn.

- **Ưu điểm của LVM:**
  - Quản lý một lượng lớn ổ đĩa một cách dễ dàng.
  - Điều chỉnh phân vùng ổ cứng một cách linh động.
  - Backup hệ thống bằng cách snapshot các phân vùng ổ cứng (real-time).
  - Migrate dữ liệu dễ dàng.

## Physical Volume, Volume Group, Logical Volume là gì ?

- LVM, hoặc Logical Volume Manager, là  quản lý ổ đĩa linh hoạt trên Linux. Đây là cách hữu ích để quản lý lưu trữ trên hệ thống máy chủ.

  - **Physical Volume (PV)**: Là các ổ đĩa vật lý, phân vùng, hoặc thiết bị lưu trữ khác như SSD, được sử dụng bởi LVM. Mỗi PV chứa một phần header để ghi thông tin về cách phân bổ trong Volume Group (VG) của nó.

  - **Volume Group (VG)**: Là một nhóm các PV kết hợp lại để tạo thành một "kho" lưu trữ chung. Dung lượng từ các PV được chia thành các Physical Extent (PE) với kích thước như nhau. Từ VG, chúng ta có thể tạo ra các Logical Volume (LV).

  - **Logical Volume (LV)**: Là các phân vùng ảo tạo ra từ VG. Chúng tương tự như các phân vùng truyền thống, nhưng linh hoạt hơn vì kích thước có thể thay đổi dễ dàng và không làm gián đoạn hệ thống. LV được tạo ra từ các Logical Extent (LE), và chúng có thể được mở rộng hoặc thu nhỏ bằng cách thêm hoặc giảm LE từ VG.

## Cấu hình mở rộng LVM



