# Testcookie nginx là gì?

Testcookie trong nginx là một mô-đun mở rộng được sử dụng để bảo vệ trang web khỏi các cuộc tấn công giả mạo (forgery). Nó hoạt động bằng cách sử dụng "cookie profile" để phát hiện ra các yêu cầu không hợp lệ từ trình duyệt người dùng. Đơn giản là, Testcookie giúp ngăn chặn các cuộc tấn công giả mạo bằng cách kiểm tra và xác minh thông tin trong cookie từ trình duyệt người dùng.

# Cơ chế hoạt động của Testcookie ?

1. Tạo và Gửi Cookie: Khi người dùng truy cập vào trang web, server sẽ tạo một cookie đặc biệt và gửi nó đến trình duyệt của người dùng.

2. Lưu Trữ Thông Tin Cookie: Mô-đun Testcookie sẽ lưu trữ thông tin của cookie này, bao gồm cả thông tin địa chỉ IP và các giá trị khác.

3. So Sánh Thông Tin: Khi có yêu cầu từ trình duyệt người dùng, mô-đun Testcookie sẽ so sánh thông tin của yêu cầu với thông tin của cookie đã lưu trữ. Nếu có bất kỳ thay đổi hoặc không khớp, nó sẽ xem xét yêu cầu là không hợp lệ.

4. Từ Chối Yêu Cầu Không Hợp Lệ: Nếu mô-đun Testcookie phát hiện ra rằng yêu cầu không hợp lệ (ví dụ: thông tin cookie bị thay đổi), nó sẽ từ chối yêu cầu đó và không cho phép truy cập vào trang web.

# Cài đặt modules Testcookie

Cài file bash để cài modules [Testcookie](https://github.com/namhikelo/Training_Vietnix/blob/main/script/install_Testcookie.sh).

## Cấu hình Testcookie

Ở block http:

testcookie_domain training.vietnix.tech;: Định nghĩa tên miền cho cookie được tạo bởi module Testcookie. Trong trường hợp này, cookie sẽ được gắn với tên miền 

testcookie_secret 2b4589dac4caa9af154309d15a315075;: Xác định giá trị bí mật (secret) được sử dụng để tạo và xác minh chữ ký cho cookie Testcookie. Đây là một chuỗi hash được sử dụng để bảo vệ cookie khỏi việc chỉnh sửa không mong muốn.

testcookie_session $remote_addr;: Định nghĩa cách thức tạo session cho cookie Testcookie. Trong trường hợp này, session được tạo dựa trên địa chỉ IP của máy khách ($remote_addr), có nghĩa là mỗi địa chỉ IP sẽ có một session riêng.

testcookie_arg ckattempt;: Định nghĩa tên của tham số (parameter) được sử dụng để xác định số lần cố gắng truy cập. Trong trường hợp này, tham số được sử dụng là ckattempt.

Ở block location. Thêm dòng "testcookie on; " Để modules hoạt động.

