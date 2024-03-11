## Allow connect remote DB:

```nano /etc/my.cnf.d/mariadb-server.cnf ```

Bỏ ccomment "#" trước bind-address:

```bind-address            = 0.0.0.0 ```

Sau đó khởi động lại dịch vụ mysql:

``` systemctl restart mysql ```


## Tạo user truy cập

Truy cập mysql:

``` mysql -u root -p ```

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
