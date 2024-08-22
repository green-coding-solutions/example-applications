#!/bin/bash

# File name
filename="/usr/share/nginx/html/large_file.bin"

# Size in GB
size_in_gb=5

# Block size (1MB)
block_size=1M

# Number of blocks (5GB / 1MB = 5120 blocks)
count=$((size_in_gb * 1024))

# Create the file with random data
dd if=/dev/urandom of="$filename" bs="$block_size" count="$count" status=progress

echo "Created a $size_in_gb GB file with random data named $filename"
