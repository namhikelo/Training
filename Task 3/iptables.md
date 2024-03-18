# Iptables la gi ?

- Iptables là một tiện ích dòng lệnh trong hệ điều hành Linux, được sử dụng để quản lý tường lửa. Nó cho phép người dùng xác định và cấu hình các quy tắc để kiểm soát luồng dữ liệu qua mạng, bảo vệ máy tính và mạng khỏi các loại tấn công và truy cập không mong muốn từ bên ngoài.

- Cấu trúc của iptables: `iptables` -> `Tables` -> `Chains` -> `Rules`.

## Các thành phần Iptables ?

- Iptables kiểm tra mọi gói dữ liệu bằng cách sử dụng các bảng được xây dựng sẵn (tables), bao gồm 3 loại bảng chính:

1. **Filter**
2. **Mangle**
3. **NAT**

### **Filter**

- Chịu trách nhiệm lọc các gói dữ liệu. Bao gồm 3 chains:

1. **INPUT** : Dùng để lọc các gói tin đi vào trong server.

VD: Chặn ping icmp

![ping](/Task%203/img/filter.png)

2. **OUTPUT** : Dùng để  lọc gói khi ra khỏi server.

VD: Chặn gói tin từ server ping đến google.com

![block](/Task%203/img/filter_1.png)

3. **FORWARD** : lọc các gói tin đến server khác.

### **Mangle** : 

- Được sử dụng để thay đổi các trường header của gói tin, bao gồm thay đổi TTL, TOS, đánh dấu gói tin, xác định dịch vụ (QoS), và chuyển hướng gói tin.

### **NAT** 

- Gồm 2 loại:

- Chain PREROUTING xử lý gói tin trước khi định tuyến, thường để thay đổi địa chỉ đích.

- Chain POSTROUTING xử lý gói tin sau khi định tuyến, thường để thay đổi địa chỉ nguồn.