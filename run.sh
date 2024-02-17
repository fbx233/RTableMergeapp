#!/bin/bash

# 获取脚本当前所在的目录
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# 进入该目录
cd "$DIR"

# 使用Rscript命令运行Shiny应用
Rscript runApp.R
