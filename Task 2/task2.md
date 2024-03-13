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

- Kiểm tra ổ đĩa đã và đã cấu hình hay chưa:

```bash
lsblk
```

![t2_lsblk](/img/t2_lsblk.png)

Sau khi xác định ổ đĩa vừa thêm, ta cấu hình:

- 1. **Tạo Physical Volume (PV)**: Xác định ổ đĩa muốn sử dụng cho LVM.

```bash
sudo pvcreate /dev/vdb
```

- 2. **Tạo Volume Group (VG)**: Tạo một VG và thêm PV vào đó.

```bash
sudo vgcreate kelo_vg  /dev/vdb
```

- 3. **Tạo Logical Volume (LV)**: Tạo các LV từ VG. Tạo một LV với dung lượng 30GB:

```bash
sudo lvcreate -L 29G -n kelo_lv kelo_vg
```

- 4. **Định dạng Logical Volume**: Định dạng LV về kiểu ext4.

```bash
sudo mkfs.ext4  /dev/kelo_vg/kelo_lv 
```

- 5. **Mount vào hệ thống**

```bash
mkdir /root/data
mount /dev/kelo_vg/kelo_lv /root/data/
```

![mount](/img/t2_mount.png)

# SSL

- SSL là viết tắt của **"Secure Sockets Layer"** - một tiêu chuẩn công nghệ bảo mật đảm bảo việc truyền thông được mã hóa giữa máy chủ web và trình duyệt của người dùng. SSL đảm bảo rằng dữ liệu được truyền giữa máy chủ và trình duyệt của người dùng là riêng tư và hoàn chỉnh. Đây là tiêu chuẩn bảo mật hiện tại của hàng triệu trang web trên toàn thế giới, bảo vệ dữ liệu được truyền qua internet một cách an toàn.

## Có bao nhiêu cách chứng thực SSL ?

- Chứng chỉ SSL được phân chia thành 3 loại như sau:
  - **DV SSL (Domain Validated)**: Chứng chỉ được xác thực với cấp độ tên miền.
  - **OV SSL (Organization Validated)**: Chứng chỉ được xác thực với cấp độ doanh nghiệp/tổ chức.
  - **EV SSL (Extended Validated)**: Chứng chỉ được xác thực với cấp độ doanh nghiệp/tổ chức mở rộng.


### CSR file dùng làm gì trong quá trình tạo SSL

- Tập tin CSR (Certificate Signing Request) được sử dụng để yêu cầu chứng nhận SSL từ một tổ chức cấp chứng chỉ (CA).

### Sử dụng OpenSSL để gen file CSR sau đó request SSL cho domain <name>.techtraining.vietnix.tech

openssl req -new -newkey rsa:2048 -nodes -keyout *.techtraining.vietnix.tech.key -out *.techtraining.vietnix.tech.csr

### Pem file là gì ?

- Tập tin PEM (Privacy Enhanced Mail) là một định dạng lưu trữ dữ liệu mã hóa, thường được sử dụng cho các chứng chỉ SSL, khóa riêng tư và các dữ liệu khác.

### Private key ssl là gì ?

- Private key trong SSL là một phần quan trọng của cặp khóa được sử dụng để giải mã dữ liệu được mã hóa và tạo chữ ký số để xác minh danh tính trong quá trình truyền thông bảo mật.

### PFX file là gì ? Cách chuyển từ file crt file sang PFX file.

- PFX là một loại định dạng tập tin chứa cả chứng chỉ SSL và khóa riêng tư được mã hóa. Nó thường được sử dụng để xuất và nhập chứng chỉ SSL và khóa riêng tư từ và đến các hệ thống hoặc dịch vụ khác nhau.

* Cấu trúc:

```bash
openssl pkcs12 -export -out certificate.pfx -inkey privkey.pem -in cert.pem -certfile chain.pem

Trong đó:

certificate.pfx là tên của tập tin PFX bạn muốn tạo.
privkey.pem là tập tin chứa khóa riêng tư.
cert.pem là tập tin chứa chứng chỉ SSL.
chain.pem là tập tin chứa chuỗi chứng chỉ (nếu có).
```

![PFX](/img/t2_PFX.png)

# Domain

- Domain là tên miền của một website hoạt động trên internet, đóng vai trò là một địa chỉ tĩnh, cố định.

## Các trạng thái của domain

- Các trạng thái của tên miền gồm:

1. Active: Đang hoạt động.
2. Expired: Hết hạn.
3. Pending Delete: Đợi xóa.
4. Server Transfer Prohibited: Cấm chuyển đổi (mức cơ quan quản lý).
5. Server Renew Prohibited: Cấm gia hạn (mức cơ quan quản lý).
6. Server Hold: Tạm ngưng (mức cơ quan quản lý).
7. Server Delete Prohibited: Cấm xóa (mức cơ quan quản lý).
8. Server Update Prohibited: Cấm cập nhật (mức cơ quan quản lý).
9. Pending Transfer: Đợi chuyển đổi nhà đăng ký.
10. Pending Delete: Đợi xóa tên miền.
11. Inactive: Chưa được đăng ký thành công.
12. Add Period: Giai đoạn thêm tên miền (sau khi đăng ký).
13. Auto Renew Period: Giai đoạn tự động gia hạn.
14. Transfer Period: Giai đoạn sau khi chuyển đổi tên miền.
15. Redemption Period: Giai đoạn khôi phục.
16. Pending Restore: Đợi khôi phục.
17. Client Transfer Prohibited: Cấm chuyển đổi (người dùng).
18. Client Renew Prohibited: Cấm gia hạn (người dùng).
19. Client Hold: Tạm ngưng (người dùng).
20. Client Delete Prohibited: Cấm xóa (người dùng).
21. Client Update Prohibited: Cấm cập nhật (người dùng).
22. OK: Đang hoạt động bình thường.

- Các loại top-level domains (TLD) bao gồm:
  - Country code top-level domains (ccTLD): Được sử dụng cho các quốc gia cụ thể, ví dụ: .us cho Hoa Kỳ, .vn cho Việt Nam.

  - Generic top-level domains (gTLD): Được sử dụng cho mục đích chung, ví dụ: .com, .org, .net.

  - Second-Level Domain (SLD): Phần mà người dùng liên kết với trang web của bạn, ví dụ: trong example.com, "example" là SLD.

  - Third-Level Domain: Phần thứ ba của tên miền, thường là www. hoặc www1.

## Subdomain là gì?

- Subdomain là một phần của tên miền chính, thường được thêm vào trước tên miền chính để tạo ra các địa chỉ web con hoặc phân loại các dịch vụ khác nhau dưới một tên miền lớn. Ví dụ, trong "blog.example.com", "blog" là subdomain của "example.com".

## Virtual Hosts là gì?

- Virtual Hosts là tính năng trong máy chủ web cho phép chạy nhiều trang web trên cùng một máy chủ vật lý bằng cách phân biệt dựa trên tên miền hoặc địa chỉ IP.

# Mail Server

- Mail server là một hệ thống được sử dụng để gửi và nhận email giữa các người dùng hoặc các máy chủ email khác nhau trên Internet.

## Tìm hiểu MX Record

- MX Record là viết tắt của Mail Exchanger Record được định nghĩa là một bản ghi trong DNS zone dùng để định vị Mail Server cho một Domain. Một tên miền có thể được gán bởi nhiều bản ghi MX, việc này giúp cho các email của bạn không bị mất đi dữ liệu nếu ngưng hoạt động một thời gian

Cách cấu hình MX trên quản lí DNS:

![webmail](/img/t2_webmail.png)

## Tìm hiểu DMARC, DKIM, SPF, PTR

### **DMARC**

- DMARC là một giao thức bảo mật email sử dụng SPF và DKIM để xác minh tính xác thực của các email. Nó giúp ngăn chặn các hoạt động lừa đảo email và tăng cường bảo mật cho hộp thư đến bằng cách cho phép người gửi định rõ cách xử lý các email không rõ nguồn gốc. DMARC cung cấp báo cáo chi tiết giúp ngăn chặn thư rác và xác định các email độc hại.

![DMARC](/img/t2_dmarc.png)

#### Cách hoạt động 

- DMARC hoạt động bằng cách kết hợp hai chính sách là SPF và DKIM để xác thực tính hợp lệ của một email và đảm bảo tính xác thực của nguồn gốc email. SPF xác định các máy chủ được ủy quyền để gửi email từ một tên miền cụ thể, trong khi DKIM sử dụng cặp khóa private và public để chữ ký số hóa email và xác thực tính toàn vẹn của nó. Kết hợp, DMARC giúp ngăn chặn thư rác và lừa đảo email bằng cách cho phép người gửi định rõ cách xử lý các email không rõ nguồn gốc và cung cấp báo cáo để cải thiện quản lý bảo mật email.

![pic](/img/t2_dmarc-dkim.png)

### **DKIM**

- DKIM (DomainKeys Identified Mail) là một phương pháp xác thực email bằng cách gắn một chữ ký điện tử vào email. Chữ ký này cho phép người nhận kiểm tra xem email có được gửi từ chủ sở hữu miền đúng hay không, và xác định liệu nội dung của email đã được chỉnh sửa hay không. DKIM không hiển thị cho người dùng cuối mà thường được xác thực ở cấp máy chủ.

#### Cách hoạt động 

- DKIM là một phương thức xác thực email, không phải là cách chống Spam trực tiếp. Tuy nhiên, nó hỗ trợ ngăn chặn thư giả mạo và lừa đảo bằng cách gắn chữ ký điện tử vào email. Hoạt động của DKIM bao gồm hai phần: tạo chữ ký và xác minh. 

  - Bên gửi cần tạo cặp khóa private/public và cấu hình mail server sử dụng khóa private này để ký vào email trước khi gửi đi. 
  
  - Bên nhận sau đó kiểm tra email có chữ ký DKIM và xác minh nó bằng cách truy vấn DNS để lấy khóa public và giải mã. Nếu giải mã thành công, email được xác nhận nguồn gốc và đảm bảo.

![pic](/img/t2_Dkim.png)

### **SPF**

- SPF record là một bản ghi DNS được sử dụng để xác định mail server được phép gửi email từ tên miền của bạn. Mục đích của SPF là ngăn chặn việc gửi email spam hoặc email giả mạo từ tên miền của bạn. SPF là một công cụ hữu ích trong việc chống lại email spam.

### Cách tạo bản ghi SPF

- Truy cập quản lí DNS của domain và thêm 1 bản ghi:
  - Host record: Tên domain or "@" 
  - Record Type: TXT
  - Address: v=spf1 ip4:14.225.217.70 -all

*Note:* -all có nghĩa là nếu một email không phù hợp với bất kỳ quy tắc nào trong bản ghi SPF, nó sẽ bị từ chối.

### **PTR**

- Bản ghi PTR (Pointer Record) là một loại bản ghi trong hệ thống DNS được sử dụng để ánh xạ một địa chỉ IP (IPv4 hoặc IPv6) thành một tên miền. Bản ghi PTR hoạt động theo chiều ngược lại so với các bản ghi DNS thông thường: thay vì ánh xạ tên miền thành địa chỉ IP (như trong bản ghi A hoặc AAAA), nó ánh xạ địa chỉ IP thành tên miền. 

- Các trường hợp sử dụng bản ghi PTR bao gồm:

  - Xác minh địa chỉ IP: Sử dụng để xác minh máy chủ hoặc máy tính có địa chỉ IP cụ thể.
  - Bộ lọc spam và phòng chống lừa đảo: Kiểm tra xem máy chủ gửi email có khớp với tên miền mà nó tự xác minh hay không.
  - Xác định danh tính máy chủ: Cung cấp thông tin về tên miền của máy chủ từ địa chỉ IP.

**Các bản ghi PTR được định dạng như sau:**

```bash
1.1.168.192.in-addr.arpa. IN PTR example.com.
```

- Trong đó:

  - 1.1.168.192: Địa chỉ IP muốn ánh xạ, được ghi đảo ngược.
  - in-addr.arpa.: Phần cố định của định dạng PTR cho việc đảo ngược DNS.
  - IN PTR: Xác định bản ghi là PTR và sử dụng để ánh xạ địa chỉ IP thành tên miền.
  - example.com: Tên miền mà địa chỉ IP sẽ được ánh xạ đến.

### Debug khi khách hàng không nhận được email.

- Kiểm tra khi khách hàng không nhận được email:
  - Sử dụng [MXToolbox](https://mxtoolbox.com/blacklists.aspx) để kiểm tra IP hoặc người gửi có trong danh sách blacklist không.
  - KH không nhận được mail thì kiểm tra MX domain của KH đang nhận ở đâu.
  - Check MX để kiểm tra chiều nhận.
  <!-- - Kiểm tra DKIM Record: Sử dụng [MXToolbox](https://mxtoolbox.com/blacklists.aspx) kiểm tra cấu hình DNS để xác minh bản ghi DKIM cho tên miền.
  - Kiểm tra DMARC Record: Sử dụng [MXToolbox](https://mxtoolbox.com/blacklists.aspx) kiểm tra cấu hình DNS có bản ghi DMARC cho tên miền. -->

# DNS

## **DNS là gì ?**

- DNS (Domain Name System) là một hệ thống cơ sở dữ liệu phân tán dùng để phân giải tên miền (ví dụ: example.com) thành địa chỉ IP (ví dụ: 192.0.2.1) và ngược lại. 

## Các loại recored DNS ?

- Các loại recored DNS phổ biến ngày nay:

- 1. A Record: Chuyển đổi tên miền thành địa chỉ IPv4.
- 2. AAAA Record: Chuyển đổi tên miền thành địa chỉ IPv6.
- 3. CNAME Record: Chuyển đổi tên miền thành tên miền khác (alias).
- 4. MX Record: Xác định máy chủ email cho một tên miền.
- 5. TXT Record: Lưu trữ thông tin văn bản không định dạng.
- 6. NS Record: Xác định máy chủ DNS chính cho một tên miền.
- 7. PTR Record: Chuyển đổi địa chỉ IP thành tên miền (ngược lại của A Record).
- 8. SOA Record: Xác định thông tin về tên miền và máy chủ DNS chính.

## Nguyên tắc làm việc của DNS ?

- DNS hoạt động bằng cách thực hiện các bước sau:

- 1. DNS query: Một truy vấn được gửi để tìm thông tin phân giải tên miền.
- 2. Tìm trong file hosts: Kiểm tra trong file hosts trên hệ thống máy tính.
- 3. Tìm trong cache: Kiểm tra trong bộ nhớ cache của trình duyệt hoặc ISP.
- 4. Gọi đến DNS recursor: Nếu không tìm thấy trong cache, gửi truy vấn đến DNS recursor.
- 5. Root Nameserver: DNS recursor gửi truy vấn đến Root DNS Server để hướng dẫn tìm kiếm.
- 6. TLD Nameserver: Root DNS Server hướng dẫn tìm kiếm tới TLD Nameserver dựa trên phần mở rộng tên miền.
- 7. Authoritative Nameserver: TLD Nameserver chỉ đường tới Authoritative Nameserver, chứa thông tin cụ thể về tên miền.
- 8. Phản hồi: Authoritative Nameserver cung cấp địa chỉ IP tương ứng với tên miền cho DNS recursor.
- 9. Phản hồi cuối cùng: DNS recursor gửi địa chỉ IP trả về cho máy tính yêu cầu, cho phép truy cập vào tên miền đã được phân giải.

Các loại server tham gia bao gồm: DNS recursor, Root Nameserver, TLD Nameserver, và Authoritative Nameserver.

![DNS](/img/t2_DNS.png)

## Cách phân giải địa chỉ DNS

- Cách phân giải địa chỉ DNS:

- 1. Người dùng nhập tên miền vào trình duyệt.
- 2. Máy tính gửi yêu cầu đến DNS resolver.
- 3. DNS resolver kiểm tra bộ nhớ cache xem có địa chỉ IP cho tên miền đó không.
- 4. Nếu không có trong cache, DNS resolver gửi yêu cầu tới DNS root server.
- 5. DNS root server hướng dẫn DNS resolver tới TLD (Top-Level Domain) server phù hợp.
- 6. TLD server cung cấp thông tin về DNS authoritative server cho tên miền.
- 7. DNS resolver liên hệ với DNS authoritative server để lấy địa chỉ IP.
- 8. DNS resolver nhận được địa chỉ IP và trả về cho máy tính người dùng.
- 9. Máy tính kết nối với địa chỉ IP nhận được để truy cập trang web.