#!/bin/bash

# 定义输入和输出文件
input_file="trackers_link.txt"
output_file="trackers.txt"

# 清空或创建输出文件
> "$output_file"

# 逐行读取输入文件中的链接
while IFS= read -r url; do
    echo $url
    # 使用 curl 获取链接内容并追加到输出文件中
    curl -s "$url" >> "$output_file"
done < "$input_file"

# 去掉多余的空行
sed -i '/^$/d' "$output_file"

echo "Trackers have been consolidated into $output_file"