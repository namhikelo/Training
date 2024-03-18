# Iptables la gi ?

- Iptables là một tiện ích dòng lệnh trong hệ điều hành Linux, được sử dụng để quản lý tường lửa. Nó cho phép người dùng xác định và cấu hình các quy tắc để kiểm soát luồng dữ liệu qua mạng, bảo vệ máy tính và mạng khỏi các loại tấn công và truy cập không mong muốn từ bên ngoài.

- Cấu trúc của iptables: `iptables` -> `Tables` -> `Chains` -> `Rules`.

## Các thành phần Iptables ?

- Iptables kiểm tra mọi gói dữ liệu bằng cách sử dụng các bảng được xây dựng sẵn (tables), bao gồm 3 loại bảng chính:

1. **Filter**
2. **Mangle**
3. **NAT**

### **Filter**

- Chịu trách nhiệm lọc các gói dữ liệu. Bao gồm 5 chains:

1. **INPUT** : Dùng để lọc các gói tin đi vào trong server.

VD: Chặn ping icmp

![ping](/Task%203/img/filter.png)

2. **OUTPUT** : Dùng để  lọc gói khi ra khỏi server.

