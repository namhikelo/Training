## Allow connect remote DB:

### Dành cho OS Centos

```bash
nano /etc/my.cnf.d/mariadb-server.cnf 
```

Bỏ ccomment "#" trước bind-address:

```bash
bind-address            = 0.0.0.0 
```

Sau đó khởi động lại dịch vụ mysql:

```bash 
systemctl restart mysql 
```

### Dành cho OS Ubuntu

```bash
nano /etc/mysql/mysql.conf.d/mysqld.cnf 
```

Bỏ ccomment "#" trước bind-address:

```bash
bind-address            = 0.0.0.0 
```

Sau đó khởi động lại dịch vụ mysql:

```bash 
systemctl restart mysql 
```

## Tạo user truy cập

Truy cập mysql:

```bash 
mysql -u root -p 
```

Cho user root:

```sql
CREATE USER 'root'@'%' IDENTIFIED BY 'Password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%';
FLUSH PRIVILEGES;
```

Cho user :
```sql
CREATE USER 'user'@'%' IDENTIFIED BY 'Password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON wordpress.* TO 'user'@'%';
FLUSH PRIVILEGES;
```

Cho user với IP cố định:
```sql
CREATE USER 'root'@'171.244.18.3' IDENTIFIED BY 'Password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'171.244.18.3';
FLUSH PRIVILEGES;
```

Đổi IP:
```sql
UPDATE mysql.user SET Host='118.69.63.53' WHERE User='root' AND Host='171.244.18.3';
FLUSH PRIVILEGES;
```

Lệnh kiểm tra: 

```bash 
SELECT User, Host FROM mysql.user; 
```

```
MariaDB [(none)]> SELECT User, Host FROM mysql.user;
+---------------+--------------+
| User          | Host         |
+---------------+--------------+
| root          | %            |
| user          | %            |
| root          | 118.69.63.53 |
| root          | 127.0.0.1    |
| root          | ::1          |
| root          | localhost    |
| wordpressuser | localhost    |
+---------------+--------------+
7 rows in set (0,002 sec)
```