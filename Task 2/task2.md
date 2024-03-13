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


