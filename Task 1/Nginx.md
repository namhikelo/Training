# Testcookie nginx 

Testcookie trong nginx là một mô-đun mở rộng được sử dụng để bảo vệ trang web khỏi các cuộc tấn công giả mạo (forgery). Nó hoạt động bằng cách sử dụng "cookie profile" để phát hiện ra các yêu cầu không hợp lệ từ trình duyệt người dùng. Đơn giản là, Testcookie giúp ngăn chặn các cuộc tấn công giả mạo bằng cách kiểm tra và xác minh thông tin trong cookie từ trình duyệt người dùng.

## Cơ chế hoạt động của Testcookie ?

1. Tạo và Gửi Cookie: Khi người dùng truy cập vào trang web, server sẽ tạo một cookie đặc biệt và gửi nó đến trình duyệt của người dùng.

2. Lưu Trữ Thông Tin Cookie: Mô-đun Testcookie sẽ lưu trữ thông tin của cookie này, bao gồm cả thông tin địa chỉ IP và các giá trị khác.

3. So Sánh Thông Tin: Khi có yêu cầu từ trình duyệt người dùng, mô-đun Testcookie sẽ so sánh thông tin của yêu cầu với thông tin của cookie đã lưu trữ. Nếu có bất kỳ thay đổi hoặc không khớp, nó sẽ xem xét yêu cầu là không hợp lệ.

4. Từ Chối Yêu Cầu Không Hợp Lệ: Nếu mô-đun Testcookie phát hiện ra rằng yêu cầu không hợp lệ (ví dụ: thông tin cookie bị thay đổi), nó sẽ từ chối yêu cầu đó và không cho phép truy cập vào trang web.

## Cài đặt modules Testcookie

Cài file bash để cài modules [Testcookie](https://github.com/namhikelo/Training_Vietnix/blob/main/script/install_Testcookie.sh).

Nguồn tham khảo cài đặt [Link](https://hocvps.com/huong-dan-tang-toc-nginx-web-server-voi-pagespeed/comment-page-1/)


### Cấu hình Testcookie

Ở block http:

* testcookie_domain training.vietnix.tech;: Định nghĩa tên miền cho cookie được tạo bởi module Testcookie. Trong trường hợp này, cookie sẽ được gắn với tên miền 

* testcookie_secret 2b4589dac4caa9af154309d15a315075;: Xác định giá trị bí mật (secret) được sử dụng để tạo và xác minh chữ ký cho cookie Testcookie. Đây là một chuỗi hash được sử dụng để bảo vệ cookie khỏi việc chỉnh sửa không mong muốn.

* testcookie_session $remote_addr;: Định nghĩa cách thức tạo session cho cookie Testcookie. Trong trường hợp này, session được tạo dựa trên địa chỉ IP của máy khách ($remote_addr), có nghĩa là mỗi địa chỉ IP sẽ có một session riêng.

* testcookie_arg ckattempt;: Định nghĩa tên của tham số (parameter) được sử dụng để xác định số lần cố gắng truy cập. Trong trường hợp này, tham số được sử dụng là ckattempt.

* testcookie_refresh_status (code); : Định nghĩa mã trạng thái HTTP tùy chỉnh được sử dụng khi phục vụ trang HTML cho trường hợp sử dụng Testcookie. Mặc định là 200 (OK). Bạn có thể sử dụng mã trạng thái HTTP tùy chỉnh này để xử lý các trường hợp cụ thể, chẳng hạn như khi cần chuyển hướng người dùng đến một trang khác.

* testcookie_deny_keepalive (on|off);: Xác định xem kết nối nên được giữ mở hay không sau khi thiết lập cookie Testcookie. Mặc định là off. Khi cài đặt là on, kết nối sẽ được đóng ngay sau khi thiết lập cookie, không giữ kết nối với bot. Điều này giúp giảm tải cho máy chủ và bảo vệ cookie khỏi các cuộc tấn công của bot.

Ở block location. Thêm dòng "testcookie on; " Để modules hoạt động.

# Real_Ip Nginx

Module http_realip_module trong Nginx là một module mở rộng cho máy chủ HTTP, cho phép máy chủ xác định địa chỉ IP thực sự của client khi máy chủ đứng sau một proxy hoặc load balancer. Điều này giúp làm cho các ứng dụng web có thể nhận diện đúng địa chỉ IP của client khi có sự trung gian của các proxy hoặc load balancer.

## Cơ chế hoạt động của Real_Ip ?

1. Thiết lập Header từ Proxy: Proxy server thêm các header vào yêu cầu HTTP trước khi chúng đến máy chủ Nginx. Các header này thường chứa địa chỉ IP của client gốc, như X-Forwarded-For.

* Header X-Forwarded-For là một header HTTP chứa địa chỉ IP của client gốc khi yêu cầu đi qua các proxy hoặc load balancer.

2. Đọc và Sử Dụng Header: Module http_realip_module trong Nginx được cấu hình để đọc các giá trị của các header được thiết lập bởi proxy server. Nó sử dụng giá trị này làm địa chỉ IP thực sự của client.

3. Cập Nhật Địa Chỉ IP: Nginx cập nhật địa chỉ IP của client trong quá trình xử lý yêu cầu. Điều này cho phép các ứng dụng web hoặc module khác có thể sử dụng địa chỉ IP chính xác của client cho các mục đích như xác thực hoặc ghi log.

### Cấu hình Real_Ip

Khi chưa kích hoạt modules ``remoteip`` thì log apache sẽ nhận IP của nginx : 127.0.0.1

![log_apache](/img/log_apache.png)

* Lệnh ``a2enmod remoteip``  trong Apache được sử dụng để kích hoạt module mod_remoteip, cho phép Apache nhìn thấy địa chỉ IP thực sự của client khi máy chủ đứng sau một proxy hoặc load balancer.

Trên web server cài thêm modules remoteip.

```bash 
a2enmod remoteip
```

Sau đó cấu hình apache2.conf

```bash 
nano /etc/apache2/apache2.conf
```

Thêm ``RemoteIPHeader X-Forwarded-For`` vào file apache2.conf

* Lệnh RemoteIPHeader X-Forwarded-For chỉ định Apache sử dụng giá trị trong header X-Forwarded-For để xác định địa chỉ IP thực sự của client khi có proxy hoặc load balancer kết nối.

Sau đó khởi động lại apache2:

```bash
systemctl restart apache2
```

![ip_real](/img/ip_real.png)







