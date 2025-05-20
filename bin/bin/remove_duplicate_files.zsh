#!/bin/zsh

# 设置扫描目录，默认为当前目录
dir="${1:-.}"

# 在指定目录递归查找所有以 “ 数字” 结尾的文件
find "$dir" -type f -name '* [0-9]*.*' | while read -r filepath; do
  filename="${filepath##*/}"      # 获取文件名
  dirname="${filepath%/*}"       # 获取所在目录

  # 使用模式去除最后的 " 数字" 部分，例如 "file 2.heic" -> "file.heic"
  base="${filename%% *}"
  ext="${filename##*.}"
  original="$dirname/$base.$ext"

  # 如果原始文件存在，则删除这个副本
  if [[ -f "$original" ]]; then
    echo "🗑 删除重复文件: $filepath"
    rm "$filepath"
  fi
done
