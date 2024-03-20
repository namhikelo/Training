#!/bin/bash

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

# Function to generate CSR and private key
generate_csr() {
    read -p "Enter Common Name (e.g., example.com): " common_name
    organization="Example Corp"
    organizational_unit="IT Department"
    city="VIET NAM"
    state="VIET NAM"
    country_code="VN"

    # Generate private key
    openssl genrsa -out "$common_name.key" 2048

    # Generate CSR
    openssl req -new -key "$common_name.key" -out "$common_name.csr" -subj "/C=$country_code/ST=$state/L=$city/O=$organization/OU=$organizational_unit/CN=$common_name"
}

# Run the function to generate CSR
generate_csr