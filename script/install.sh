# Install modules testcookie Nginx
# ROOT
if [ "$EUID" -ne 0 ]; then
    echo "RUN AS ROOT ^^!"
    exit 1
fi

# Update
sudo apt-get update && sudo apt-get upgrade -y

# Package requirement
sudo apt-get install -y g++ build-essential make net-tools git curl wget openssl gcc libssl-dev libpcre3 libpcre3-dev zlib1g-dev libgeoip-dev unzip uuid-dev  zlib1g libxml2 libperl-dev

# Varible 
nginx_ver='1.25.4'
NGX_DEVEL_KIT_VERSION='0.3.2'
PATH_DOWNLOAD='/opt/nginx-build'
NGX_DEVEL_KIT_PATH=$PATH_DOWNLOAD/ngx_devel_kit-${NGX_DEVEL_KIT_VERSION}

mkdir $PATH_DOWNLOAD
cd $PATH_DOWNLOAD

# Download nginx
    wget http://nginx.org/download/nginx-${nginx_ver}.tar.gz

# Download ngx_devel_kit
    wget https://github.com/simpl/ngx_devel_kit/archive/v${NGX_DEVEL_KIT_VERSION}.tar.gz \
        -O ngx_devel_kit-${NGX_DEVEL_KIT_VERSION}.tar.gz

# Download test cookie
    git clone https://github.com/kyprizel/testcookie-nginx-module.git

# Extract
find . -type f -name '*.tar.gz' -exec tar -xzf {} \;


cd $PATH_DOWNLOAD
cd nginx-${nginx_ver}
./configure \
     --user=nginx                          \
     --group=nginx                         \
     --prefix=/etc/nginx                   \
     --sbin-path=/usr/sbin/nginx           \
     --conf-path=/etc/nginx/nginx.conf     \
     --pid-path=/run/nginx.pid         \
     --lock-path=/run/nginx.lock       \
     --error-log-path=/var/log/nginx/error.log \
     --http-log-path=/var/log/nginx/access.log \
     --with-http_gzip_static_module        \
     --with-http_stub_status_module        \
     --with-http_ssl_module                \
     --with-pcre-jit                           \
     --with-debug                           \
     --with-compat                           \
     --with-file-aio                       \
     --with-http_realip_module             \
     --with-http_geoip_module             \
     --with-http_mp4_module             \
     --with-http_perl_module            \
     --without-http_scgi_module            \
     --with-http_addition_module \
	 --with-http_sub_module \
	 --with-http_dav_module \
     --with-http_flv_module \
	 --with-http_mp4_module \
	 --with-http_gunzip_module \
	 --with-http_gzip_static_module \
	 --with-http_random_index_module \
	 --with-http_secure_link_module \
	 --with-http_stub_status_module \
	 --with-http_auth_request_module \
     --without-http_uwsgi_module           \
     --without-http_fastcgi_module ${NGINX_DEBUG:+--debug} \
     --with-cc-opt=-O2 --with-ld-opt='-Wl,-rpath,/usr/local/lib' \
     --add-dynamic-module=/opt/nginx-build/ngx_devel_kit-${NGX_DEVEL_KIT_VERSION} 	\
     --add-dynamic-module=/opt/nginx-build/testcookie-nginx-module/ 

make && make modules && make install

# Config nginx
useradd -r -M -s /sbin/nologin -d /etc/nginx nginx
chown -R nginx:nginx /etc/nginx

# Path to the systemd configuration file for the Nginx service
systemd_service_file="/etc/systemd/system/nginx.service"

# Contents of the systemd configuration file
nginx_service_content="
[Unit]
Description=A high performance web server and a reverse proxy server
Documentation=man:nginx(8)
After=network.target nss-lookup.target

[Service]
Type=forking
PIDFile=/run/nginx.pid  
ExecStartPre=/usr/sbin/nginx -t -q -g 'daemon on; master_process on;'
ExecStart=/usr/sbin/nginx -g 'daemon on; master_process on;'
ExecReload=/usr/sbin/nginx -g 'daemon on; master_process on;' -s reload
ExecStop=-/sbin/start-stop-daemon --quiet --stop --retry QUIT/5 --pidfile /run/nginx.pid  
TimeoutStopSec=5
KillMode=mixed

[Install]
WantedBy=multi-user.target
"
# Create systemd configuration file
echo "$nginx_service_content" | sudo tee "$systemd_service_file"

# Add module
sed -i '10i\pid /run/nginx.pid;' /etc/nginx/nginx.conf
sed -i '1i\load_module /etc/nginx/modules/ngx_http_testcookie_access_module.so;' /etc/nginx/nginx.conf

# Config services
systemctl daemon-reload
sudo systemctl start nginx
sudo systemctl restart nginx
sudo systemctl enable nginx
sudo systemctl status nginx