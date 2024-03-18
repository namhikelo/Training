# Iptables la gi ?

- Iptables là một tiện ích dòng lệnh trong hệ điều hành Linux, được sử dụng để quản lý tường lửa. Nó cho phép người dùng xác định và cấu hình các quy tắc để kiểm soát luồng dữ liệu qua mạng, bảo vệ máy tính và mạng khỏi các loại tấn công và truy cập không mong muốn từ bên ngoài.

## Flowchart diagram

- Cấu trúc thực thi của iptables: `iptables` -> `Tables` -> `Chains` -> `Rules`.

![pic](/Task%203/img/chain.png)

- Dữ liệu khi truy cập sẽ được kiểm tra bởi các quy tắc trong chain PREROUTING của bảng Mangle. Sau đó, dữ liệu sẽ được kiểm tra bởi NAT Table trong PREROUTING chain để xem liệu nó cần DNAT hay không. Nếu cần, DNAT sẽ thay đổi địa chỉ đích của dữ liệu.

- Dữ liệu được chuyển đến các chain INPUT, FORWARD hoặc OUTPUT dựa trên quyết định định tuyến trước đó.

- Trong bảng Filter, iptables kiểm tra dữ liệu bởi các quy tắc trong chain INPUT, FORWARD hoặc OUTPUT để xác định cách xử lý tiếp theo, chẳng hạn như chấp nhận (ACCEPT), từ chối (DROP), hoặc chuyển hướng (REDIRECT).

- Các quy tắc trong chain POSTROUTING của bảng Mangle được áp dụng trước khi gói tin rời khỏi hệ thống.

- Kết thúc gói tin

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

Gồm 2 loại:

- Chain PREROUTING xử lý gói tin trước khi định tuyến, để thay đổi địa chỉ đích.

- Chain POSTROUTING xử lý gói tin sau khi định tuyến, để thay đổi địa chỉ nguồn.

## Lệnh trong iptables

CẤU TRÚC LỆNH IPTABLES:

```bash
iptables [-t table_name] -COMMAND CHAIN_NAME matches -j TARGET
```

| Table   | Command        | CHAIN        | matches           | Target/Jump   |
|---------|----------------|--------------|-------------------|---------------|
| filter  | `-A` (append)  | INPUT        | -s source_ip     | ACCEPT        |
| nat     | `-I` (insert)  | OUTPUT       | -d dest_ip       | DROP          |
| mangle  | `-D` (delete)  | FORWARD      | -p protocol      | REJECT        |
| raw     | `-R` (replace) | PREROUTING   | --sport source_ip | LOG           |
|         | `-F` (flush)   | POSTROUTING  | --dport dest_ip  | SNAT          |
|         | `-Z` (zero)    |              | -i incoming_int  | DNAT          |
|         | `-L` (list)    |              | -o outgoing_int  | MASQUERADE    |
|         | `-S` (show)    |              | -m mac           | LIMIT         |
|         | `-N` (create chain) |        | -m time          | RETURN        |
|         | `-X` (delete chain) |        | -m quota         | TEE           |
|         |                |              | -m limit         | TOS           |
|         |                |              | -m recent        | TTL           |

*Note: Nếu không chỉ định rõ table nào, mặc định là filter table sẽ được áp dụng.*

### Command

| Command | Description                                 |
|---------|---------------------------------------------|
| `-A`    | Thêm một quy tắc vào một chain.            |
| `-I`    | Chèn một quy tắc vào một vị trí cụ thể trong chain. |
| `-D`    | Xóa một hoặc nhiều quy tắc khỏi chain.    |
| `-R`    | Thay thế một quy tắc trong chain bằng một quy tắc mới. |
| `-F`    | Xóa tất cả các quy tắc trong một chain.    |
| `-Z`    | Reset các counters (bộ đếm) của các quy tắc trong chain. |
| `-L`    | Liệt kê tất cả các quy tắc trong chain.   |
| `-S`    | Hiển thị cấu hình của iptables dưới dạng script. |
| `-N`    | Tạo một chain mới.                         |
| `-X`    | Xóa một chain.                             |

### matches

| Matches | Description                       |
|---------|-----------------------------------|
| -s source_ip | So sánh địa chỉ nguồn của gói tin với `source_ip`. |
| -d dest_ip | So sánh địa chỉ đích của gói tin với `dest_ip`. |
| -p protocol | So sánh protocol của gói tin với `protocol`. |
| --sport source_ip | So sánh cổng nguồn của gói tin với `source_ip`. |
| --dport dest_ip | So sánh cổng đích của gói tin với `dest_ip`. |
| -i incoming_int | So sánh giao diện đầu vào của gói tin với `incoming_int`. |
| -o outgoing_int | So sánh giao diện đầu ra của gói tin với `outgoing_int`. |
| -m mac | So sánh địa chỉ MAC của gói tin với `mac`. |
| -m time | Sử dụng modul `time` để so sánh thời gian của gói tin. |
| -m quota | Sử dụng modul `quota` để kiểm soát số lượng gói tin. |
| -m limit | Sử dụng modul `limit` để giới hạn số lượng gói tin. |
| -m recent | Sử dụng modul `recent` để kiểm soát trạng thái gần đây của gói tin. |

### Tagert

| Target/Jump | Description                                  |
|-------------|----------------------------------------------|
| ACCEPT      | Chấp nhận gói tin                           |
| DROP        | Loại bỏ gói tin                             |
| REJECT      | Loại bỏ gói tin và gửi thông báo từ chối   |
| LOG         | Ghi lại thông tin vào logs                   |
| SNAT        | Thay đổi địa chỉ nguồn của gói tin          |
| DNAT        | Thay đổi địa chỉ đích của gói tin           |
| MASQUERADE  | Chuyển đổi địa chỉ nguồn để ẩn danh tính   |
| LIMIT       | Giới hạn số lượng gói tin được xử lý       |
| RETURN      | Trả lại kết quả từ chain hiện tại          |
| TEE         | Sao chép và gửi gói tin đến địa chỉ khác   |
| TOS         | Đặt trường Type of Service trong header IP  |
| TTL         | Đặt trường Time-To-Live trong header IP    |


VD: 
