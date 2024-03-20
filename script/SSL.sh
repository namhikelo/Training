#!/bin/bash

# Root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

generate_ssl() {
    read -p "Enter Common Name (e.g., example.com): " common_name
    read -p "Enter Email Address: " email_address
    organization="Example Corp"
    organizational_unit="IT Department"
    city="VIET NAM"
    state="VIET NAM"
    country_code="VN"

    openssl genrsa -out "$common_name.key" 2048

    openssl req -new -key "$common_name.key" -out "$common_name.csr" -subj "/C=$country_code/ST=$state/L=$city/O=$organization/OU=$organizational_unit/CN=$common_name/emailAddress=$email_address"

    openssl x509 -req -days 365 -in "$common_name.csr" -signkey "$common_name.key" -out "$common_name.crt"
}

generate_ssl
