## Allow connect remote DB:

```nano /etc/my.cnf.d/mariadb-server.cnf ```

Bỏ ccomment "#" trước bind-address:

```bind-address            = 0.0.0.0 ```

Sau đó khởi động lại dịch vụ mysql:

``` systemctl restart mysql ```


## Tạo user truy cập

Cho user root:

```sql
CREATE USER 'root'@'14.225.217.70' IDENTIFIED BY 'vietnix@1q2w3e';
GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'14.225.217.70';
GRANT SELECT, INSERT, UPDATE, DELETE ON wordpress.* TO 'root'@'14.225.217.70';
FLUSH PRIVILEGES;
```

Cho user :
```sql
CREATE USER 'user'@'14.225.217.70 ' IDENTIFIED BY 'user@1q2w3e';
GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'14.225.217.70 ';
GRANT SELECT, INSERT, UPDATE, DELETE ON wordpress.* TO 'user'@'14.225.217.70 ';
FLUSH PRIVILEGES;
```
