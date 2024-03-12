## Tìm kiếm một file, directory

- Lệnh find được sử dụng để tìm kiếm các tệp tin trong một cấu trúc thư mục.

### Cấu trúc lệnh `find` :

```bash
find [path] [search_conditions] [action]
```

Tìm kiếm bằng tên hoặc bằng extension.

![find](/img/find.png)

Tìm kiếm với giá trị -maxdepth, -mindepth.

![find_max_min](/img/find_max.png)

Tìm kiếm với giá trị -maxdepth, -mtime.

![find_mtime](/img/find_mtime.png)

## Xem dung lượng disk

* df: Xem dung lượng đĩa trên hệ thống.

* du: Kiểm tra kích thước của các tệp tin cụ thể.

#### Cấu trúc lệnh `df`

```bash
df [option]
```

Option:

-h: Hiển thị kết quả dễ đọc.

-T: Hiển thị kiểu hệ thống tệp tin.

-t <loại_hệ_thống>: Chỉ hiển thị các phân vùng có loại hệ thống tệp tin được chỉ định.

-x <loại_hệ_thống>: Loại bỏ các phân vùng có loại hệ thống tệp tin được chỉ định.

-i: Hiển thị thông tin về inode.

![df](/img/df.png)

#### Cấu trúc lệnh `du`

```bash
du [option] [path]
```

![du](/img/du.png)

Kiểm tra phân vùng / 

![df](/img/du_h.png)

Kiểm tra phân vùng tmpfs 

![df](/img/df_tmpfs.png)

Kiểm tra inodes 

![df](/img/df_inodes.png)

## Kiểm tra phân vùng lvm

- Kiểm tra phân vùng LVM là quá trình xem thông tin về các phân vùng được quản lý bằng Logical Volume Manager (LVM) trong Linux.

![vgs](/img/vgs.png)

## Kiểm tra cpu

- **lscpu** hiển thị thông tin về kiến trúc CPU trên hệ thống Linux.

![lscpu](/img/lscpu.png)

## Kiểm tra cpu bằng top command

Chương trình ``top`` cung cấp cái nhìn thời gian thực động về hệ thống.

![top](/img/top.png)

Liên quan thời gian về server

![top](/img/top_detail.png)

* 1: Thời gian hiện tại.
* 2: Thời gian hệ thống hoạt động.
* 3: Số lượng người dùng đã đăng nhập.
* 4: Thời gian CPU và trung bình tải 1/5/15 phút.

**Liên quan đến tiến trình của server**

![top](/img/top_proces.png)

* 1: Tổng số tiến trình đang ở chế độ hoạt động.
* 2: Tiến trình đang chạy.
* 3: Tiến trình đang ở chế độ.
* 4: Tiến trình đã dừng.
* 5: Tiến trình đang chờ đợi tạm dừng từ một tiến trình khác.

**Liên quan đến CPU của server**

![top](/img/top_cpu.png)

- **us**: Thời gian CPU sử dụng cho các tiến trình người dùng .
- **sy**: Thời gian CPU sử dụng cho các tác vụ hệ thống .
- **ni**: Thời gian CPU sử dụng cho các tiến trình được ưu tiên .
- **id**: Thời gian CPU không được sử dụng .
- **wa**: Thời gian CPU chờ đợi để xử lý các yêu cầu I/O l.
- **hi**: Thời gian CPU sử dụng cho xử lý các ngắt phần cứng.
- **si**: Thời gian CPU sử dụng cho xử lý các ngắt phần mềm .
- **st**: Thời gian CPU bị đánh cắp bởi một máy ảo khác .

## stress

Lệnh ``stress`` là công cụ được sử dụng để tạo ra tải cao trên hệ thống để kiểm tra và đánh giá hiệu suất.

![stress](/img/stress.png)

Tổng %CPU hiển thị là 200% vì có hai tiến trình đang chạy, mỗi tiến trình chiếm 50% CPU.

## Ram

Lệnh ``free -h`` để kiểm tra RAM.

![ram](/img/check_ram.png)

**Các chỉ số RAM trong của lệnh ``free``:**

* 1: used: Dung lượng RAM đã sử dụng.
* 2: free: Dung lượng RAM còn trống.
* 3: shared: Dung lượng RAM được sử dụng chung.
* 4: buff/cache: Dung lượng RAM được sử dụng cho bộ đệm và cache.
* 5: available: Dung lượng RAM sẵn có cho việc sử dụng ngay lập tức.

Để kiểm tra dung lượng RAM còn trống trên Linux bằng lệnh free, chỉ cần đọc giá trị trong cột "free" hoặc "available".

## Network

Lệnh ```ip``` trong Linux được sử dụng để quản lý và cấu hình mạng.

```bash
ip link show
```
Kiểm tra lượng traffic (Mbps) và packet/s

![ip_mac](/img/ip_mac.png)

Kiểm tra lượng traffic của từng ip in/out

![iftop](/img/iftop.png)

## Quản lý tiến trình

Lệnh để kiểm tra tiến trình trên hệ thống Linux là ``ps``.

* 1: ps: Tiến trình của người dùng hiện tại.
* 2: ps -e: Tất cả các tiến trình.
* 3: ps -ef: Tất cả các tiến trình với đầy đủ thông tin.
* 4: ps aux: Tất cả các tiến trình của tất cả người dùng với đầy đủ thông tin.
* 5: ps -aux | grep process_name: Tiến trình cụ thể bằng tên tiến trình.

![ps](/img/ps.png)

## Ngắt 1 tiến trình

Để tắt một tiến trình, dùng lệnh ``kill`` với ID tiến trình hoặc tên tiến trình.

![kill](/img/kill.png)

## Liệt kê danh sách file/thư mục, cách show các file ẩn trong thư mục

Lệnh ``ls`` liệt kê danh sách các file và thư mục trong thư mục hiện tại.

![ls](/img/ls.png)

Lệnh ``ls -a`` hiển thị tất cả các file và thư mục, bao gồm cả các file và thư mục ẩn.

![ls_a](/img/ls_a.png)

## Tìm kiếm, copy, di chuyển,... file/thư mục



