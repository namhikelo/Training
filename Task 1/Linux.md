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

#### Cấu trúc

```bash
df [option]
```

Option:

-h: Hiển thị kết quả dễ đọc.

-T: Hiển thị kiểu hệ thống tệp tin.

-t <loại_hệ_thống>: Chỉ hiển thị các phân vùng có loại hệ thống tệp tin được chỉ định.

-x <loại_hệ_thống>: Loại bỏ các phân vùng có loại hệ thống tệp tin được chỉ định.

-i: Hiển thị thông tin về inode.