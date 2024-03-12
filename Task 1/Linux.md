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

- Lệnh ``stress`` là công cụ được sử dụng để tạo ra tải cao trên hệ thống để kiểm tra và đánh giá hiệu suất.

![stress](/img/stress.png)

Tổng %CPU hiển thị là 200% vì có hai tiến trình đang chạy, mỗi tiến trình chiếm 50% CPU.

## Ram

- Lệnh ``free -h`` để kiểm tra RAM.

![ram](/img/check_ram.png)

**Các chỉ số RAM trong của lệnh ``free``:**

* 1: used: Dung lượng RAM đã sử dụng.
* 2: free: Dung lượng RAM còn trống.
* 3: shared: Dung lượng RAM được sử dụng chung.
* 4: buff/cache: Dung lượng RAM được sử dụng cho bộ đệm và cache.
* 5: available: Dung lượng RAM sẵn có cho việc sử dụng ngay lập tức.

Để kiểm tra dung lượng RAM còn trống trên Linux bằng lệnh free, chỉ cần đọc giá trị trong cột "free" hoặc "available".

## Network

- Lệnh ```ip``` trong Linux được sử dụng để quản lý và cấu hình mạng.

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

- Tạo thư mục

![mkdir](/img/mkdir.png)

- Copy file / Thư mục

![copy](/img/copy.png)

- Di chuyển file / Thư mục

![move](/img/move.png)

## Làm quen với trình editor vim, vi, nano. Yêu cầu phải biết cách instert, xóa, save, thoát vim, vi, nano.

### Vim / VI

Hai trình editor Vim và Vi khá giống nhau.

Tạo file :
```bash
vi [tên_file]
```

Insert file: Shift + i 

Lưu file: ESC -> Shift + ; -> wq!

### Nano

Tạo file :
```bash
nano [tên_file]
```

Lưu file: Ctrl C + Y + Enter

## Mount/Umount một phân vùng.

- Lệnh ``mount`` được sử dụng để kết nối một hệ thống tập tin (file system) vào hệ thống Linux.

![mount](/img/mount.png)

- Lệnh ``umount`` được sử dụng để ngắt kết nối một hệ thống tập tin đã được gắn vào hệ thống Linux.

![unmount](/img/unmount.png)

- Sau khi add thêm một ổ cứng sdb ~ 5gb

![mount](/img/lsblk.png)

Tạo phân vùng mới.

```bash
sudo mkfs.ext4 /dev/sdb1
```

Kiểm tra:
```bash
lsblk
```

Mount ổ cứng:
```bash
mount /dev/sdb1 /mnt/test/
```

Unmount ổ cứng:
```bash
umount /mnt/test
```

![done_mount](/img/done_mount.png)

### Symbolic Links (Symlinks):

- Là con trỏ mềm tới tệp hoặc thư mục gốc. Nếu tệp gốc mất thì tệp mềm cũng vậy.

![symbolic](/img/ln_symbolic.png)

### Hard Links:

Hard links là các liên kết giữa tên và dữ liệu thực của một tệp trong hệ thống tập tin, cho phép nhiều tên trỏ đến cùng một tệp vật lý. Nếu 1 tệp mất thì tệp còn lại còn hoạt động

![hard_link](/img/hardlink.png)

## Nén/Giải nén file tar.gz

Lệnh ``tar`` là một công cụ trong Linux để tạo, quản lý và giải nén các tập tin được nén hoặc sao lưu.

```bash
-c: Tạo một tệp nén mới.
-f <tệp sao lưu>: Chỉ định tên của tệp nén.
-v: Hiển thị quá trình thực hiện lệnh.
-x: Giải nén tệp từ tệp sao lưu.
-z: Tạo tệp nén bằng gzip.
```

![tar](/img/tar.png)

Giải nén

![untar](/img/untar.png)

## Nén/Giải nén file .zip

Lệnh ``zip`` được sử dụng để nén tệp hoặc thư mục thành một tập tin nén .zip. 

![zip](/img/zip.png)

Giải nén

![unzip](/img/unzip.png)

## Tìm hiểu và thử nghiệm thử các command cơ bản:

- telnet

```bash
telnet server-IP address
```

![telnet](/img/telnet.png)

- ping

```bash
ping [options] {ip or hostname}
ping {ip or hostname}
```

![ping](/img/ping.png)

- hping3

![hping3](/img/hping3.png)

## ssh, ssh với key, ssh với port custom, gen key ssh.

- ssh

* Cấu trúc:

```bash
ssh {user}@{IP} -p 22
```
![ssh](/img/ssh.png)

- Thay đổi port ssh

```bash
nano /etc/ssh/sshd_config
Port {Port mong muốn}
```

Sau đó khởi động lại ssh

```bash 
systemctl restart ssh
```

- Key gen ssh

![keygen](/img/keygen.png)

## SCP

SCP là công cụ dòng lệnh để sao chép file/thư mục an toàn giữa các máy tính qua mạng. Lệnh này sử dụng SSH mã hóa dữ liệu, đảm bảo bảo mật.

Cấu trúc:

```bash
scp [options] [source] [destination]
```

Giải thích:

```bash
[options]: Các tùy chọn cấu hình cho lệnh scp.
[source]: Đường dẫn đến file hoặc thư mục nguồn cần sao chép.
[destination]: Đường dẫn đến vị trí lưu trữ file hoặc thư mục sau khi sao chép.
```

Sao chép file từ máy cục bộ sang máy từ xa:

```bash
scp file.txt user@remote_host:/home/user/
```

Sao chép thư mục từ máy từ xa sang máy cục bộ:

```bash
scp -r user@remote_host:/home/user/directory /local/directory
```

Sao chép file giữa hai máy từ xa:

```bash
scp user1@remote_host1:/home/user1/file.txt user2@remote_host2:/home/user2/
```

## Xem nhanh nội dung của file.

Lệnh ``cat`` là một công cụ dòng lệnh cho phép bạn xem nội dung của file văn bản.

```bash
cat ten_file
```

![cat](/img/cat.png)

## Rsync file, folder, rsync incremental.

- Rsync

Rsync là công cụ để đồng bộ hóa file và thư mục giữa các máy tính.

Cấu trúc:

```bash
rsync [options] source destination
```

![rsync](/img/rsync.png)

- Rsync incremental

Rsync incremental giúp đồng bộ hóa chỉ những thay đổi của file/thư mục, tiết kiệm thời gian và băng thông.

Cấu trúc:

```bash
rsync -auv /local/directory user@remote_host:/home/user/
```

```bash
-a để sao chép tất cả thuộc tính của file/thư mục.
-u để chỉ cập nhật file mới hơn hoặc đã thay đổi trên máy đích.
-i để bỏ qua file không thay đổi.
```

## Chèn một đoạn text vào cuối file.

Cấu trúc:

```bash
cat >> File << EOF

Nội dung text 

EOF
```

## Show 2 dòng đầu file

Cấu trúc:

```bash
head -n 2 filename
```

```bash
head: Hiển thị phần đầu file.
-n 2: Chỉ hiển thị 2 dòng đầu tiên.
filename: Tên file bạn muốn hiển thị.
```

![head](/img/head.png)

## Show 2 dòng cuối file

Cấu trúc:

```bash
tail -n 2 filename
```

```bash
tail: Hiển thị phần cuối file.
-n 2: Chỉ hiển thị 2 dòng cuối cùng.
filename: Tên file bạn muốn hiển thị.
```

![tail](/img/tail.png)

## Dùng sed command để find and replace một trong string trong file text

Lệnh ``sed`` là một công cụ dòng lệnh mạnh mẽ để chỉnh sửa file văn bản trong Unix/Linux

Cấu trúc:

```bash
sed 's/chuỗi_cần_tìm/chuỗi_thay_thế/g' filename
```

```bash
sed: Lệnh sed.
's/chuỗi_cần_tìm/chuỗi_thay_thế/g':
s: Ký hiệu bắt đầu lệnh thay thế.
/chuỗi_cần_tìm/: Chuỗi cần tìm kiếm.
/chuỗi_thay_thế/: Chuỗi thay thế.
g: Thay thế tất cả các lần xuất hiện của chuỗi cần tìm.
```

![sed](/img/sed.png)

## netstat command

- Lệnh ``netstat`` là một công cụ dòng lệnh mạnh mẽ để hiển thị thông tin chi tiết về các kết nối mạng của máy tính.

Cấu trúc:

```bash
netstat [option]

-a: Hiển thị tất cả các kết nối, bao gồm cả các kết nối không hoạt động.
-n: Hiển thị địa chỉ IP và số cổng dưới dạng số thay vì tên máy chủ.
-t: Hiển thị chỉ kết nối TCP.
-u: Hiển thị chỉ kết nối UDP.
-l: Hiển thị chỉ các cổng đang được lắng nghe.
-s: Hiển thị số liệu thống kê về giao thức mạng.
```

![netstat](/img/netstat.png)

## Print command 

- Lệnh ``print`` trong Ubuntu có thể được sử dụng để in tệp văn bản, hình ảnh và các loại dữ liệu khác. Lệnh này có nhiều tùy chọn để định dạng đầu ra và kiểm soát cách thức in ấn.

Cấu trúc:

```bash
lpr [option] [file or URL]

-o: Xác định các tùy chọn in ấn.
page-ranges: Chọn trang cụ thể để in.
media: Chọn loại vật liệu in (ví dụ: giấy, ảnh).
copies: Số lượng bản sao cần in.
landscape: In ngang trang.
portrait: In dọc trang.
```

In tệp văn bản:

```bash
lpr file.txt
```

## sort, uniq, wc, cut, join command

- sort: là lệnh sắp xếp dữ liệu theo thứ tự.

![sort](/img/sort.png)

- uniq: là lệnh đếm số lượng dòng, từ và ký tự trong tệp

![uniq](/img/uniq.png)

- wc là một công cụ hữu ích trong hệ thống Unix để đếm số dòng, từ và ký tự trong file văn bản. 

![wc](/img/wc.png)

```bash
Kết quả wc hello.txt là:

11 dòng (lines): Số dòng trong file hello.txt.
11 từ (words): Mỗi số được tính là một từ vì chúng riêng biệt trên mỗi dòng.
22 ký tự (characters): Tổng số ký tự bao gồm các số và xuống dòng.
```

## Hiểu về Standard Input, Standard Output, Standard Error.

**Standard Input (stdin):**

Là nơi chương trình nhận dữ liệu từ người dùng, thường là bàn phím.
Ví dụ: bạn nhập tên vào chương trình, chương trình sẽ đọc tên từ stdin.

**Standard Output (stdout):**

Là nơi chương trình hiển thị kết quả ra màn hình.
Ví dụ: chương trình in ra kết quả tính toán lên màn hình.

**Standard Error (stderr):**

Là nơi chương trình hiển thị thông báo lỗi.
Ví dụ: chương trình báo lỗi "file not found" ra stderr.

## Redirect error to a file

![Error_to_file](/img/error_to_file.png)

## Redirect output messages to a file

![mess_to_file](/img/mess_to_file.png)

## Redirect error and output messages to a file

![aaa](/img/mount_hard.png)