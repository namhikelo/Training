# Viết Script backup mysql, lưu 3 bản gần nhất, sync lên google drive

## Kết nối ubuntu với google drive.

Cài đặt gói cần thiết:

```bash
apt-get install rclone
```

Cấu hình ``rclone``

```bash
rclone config
```

- Chọn ``n`` để tạo kết nối mới sao đó đặt tên kết nối đó.
- Chọn số  ``17`` để chọn Google Drive

![pic](/Task%204/img/1.png)

- Tiếp đến bỏ qua ``Option client_id.`` và ``Option client_secret.``
- Phần ``Option scope.`` chọn số 1.
- Phần ``Option service_account_file.`` chọn ``n`.
- Ở phần ``Use web browser to automatically authenticate rclone with remote?`` có 2 cách. Một là xác thực trực tiếp trên giao diện. Tuy nhiên nên chọn cho bản GUI còn bản server thì chọn ``n`` (Do không có GUI).

![pic](/Task%204/img/3.png)

Xác thực token:

- Trên máy window or linux cài rclone.
- Chạy lệnh để xác thực:

```bash
rclone authorize "drive"
```

Sao đó copy đoạn mã đó paste vào token để xác thực. Sau đó chọn ``y`` và kết thúc.

### Kiểm tra kết nối

Trên server và ggdrive tạo thư mục để sync.

```bash
rclone about bk:backup/
```

![pic](/Task%204/img/5.png)

### Đồng bộ file.

Cấu trúc:

```bash
rclone sync [source] [connection-name]:[path]
```

![pic](/Task%204/img/6.png)

## Script backup mysql

```bash
# /bin/bash

DB_HOST="localhost"
DB_USER="ctfd"
DB_PASS="6hGA9v3Fco1VtE7pXV2BVxo7tfgBaI"
DB_NAME="ctfd"

name_remotes=bk
gdrive_folder=backup

# Directory to store backups
BACKUP_DIR="/root/bk/data"

# Number of backups to keep
NUM_BACKUPS=3

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Backup MySQL database
backup_file="$BACKUP_DIR/${DB_NAME}_$(date +%Y%m%d_%H%M%S).sql"
mysqldump -h"$DB_HOST" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$backup_file"

# Delete old backups if there are more than NUM_BACKUPS
backup_files=$(ls -t "$BACKUP_DIR/${DB_NAME}"*.sql)
count=1
for file in $backup_files; do
    if [ $count -gt $NUM_BACKUPS ]; then
        rm "$file"
    fi
    count=$((count+1))
done

rclone sync "$BACKUP_DIR"  $name_remotes:$gdrive_folder
```

![pic](/Task%204/img/7.png)

## Tạo crontab cứ 4 tiếng backup 1 lần

```bash
crontab -e

0 */4 * * * /root/bk/backup.sh
```

# Script generate CSR + private key dùng để request SSL.

Cài đặt opensll:

```bash
apt-get install openssl
```

Script generate CSR + Private key: [Link]()



