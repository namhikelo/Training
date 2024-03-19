# Ipset là gì 

- IPset là một công cụ trong Linux cho phép quản lý các tập hợp địa chỉ IP, giúp tăng cường bảo mật và kiểm soát lưu lượng mạng.

Cấu trúc:

```bash
ipset [OPTIONS] COMMAND [COMMAND_OPTIONS]
```

Trong đó:

```bash
OPTIONS: Là các tùy chọn mà bạn có thể cung cấp cho lệnh ipset.
COMMAND: Là các hành động cụ thể mà bạn muốn thực hiện, như tạo, xóa, cập nhật hoặc liệt kê các tập hợp địa chỉ IP.
COMMAND_OPTIONS: Là các tùy chọn cụ thể được sử dụng cho từng lệnh cụ thể.
```

## Ipset

Để chặn truy cập từ hai địa chỉ IP 1.1.1.1 và 10.10.10.4 với iptables, ta thường sử dụng các lệnh sau:

```bash
iptables -A INPUT -s 1.1.1.1 -j DROP
iptables -A INPUT -s 2.2.2.2 -j DROP
```

Việc sử dụng ipset kết hợp cùng iptables sẽ thực hiện như sau:

```bash
ipset -N myset hash:ip
ipset -A myset 1.1.1.1  
ipset -A myset 10.10.10.4 
iptables -A INPUT -m set --match-set  myset src -j DROP
```

![pic](/Task%203/img/ipset.png)

## Cách tạo ipset

1. Tạo danh sách với tên tùy ý chứa các ip để thao tác.

```bash
ipset -N myset hash:ip
```

2. Thêm các IP vào danh sách vừa tạo.

```bash
ipset -A myset 1.1.1.1  
ipset -A myset 10.10.10.4
```

3. Tiến hành thao tác iptables.

```bash
iptables -A INPUT -m set --match-set  myset src -j DROP
```

### Liệt kê danh sách ip của ipset

```bash
ipset -L
```

![pic](/Task%203/img/show_ipset.png)

### Add IP vào ipset

```bash
ipset add {Ten set} {IP}
```

![pic](/Task%203/img/ipset_add.png)

### Xóa IP trong ipset

```bash
ipset del {Ten set} {IP}
```

