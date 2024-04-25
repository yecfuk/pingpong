#!/bin/bash

# 检查是否已安装 Docker
if ! command -v docker &> /dev/null; then
    echo "正在安装 Docker..."
    # 更新 apt 软件包索引
    sudo apt-get update
    # 下载 Docker 安装脚本
    curl -fsSL https://get.docker.com -o get-docker.sh
    # 执行 Docker 安装脚本
    sudo sh get-docker.sh
else
    echo "Docker 已经安装"
fi


# 检查是否已安装 Screen
if ! command -v screen &> /dev/null; then
    echo "正在安装 Screen..."
    sudo apt-get update
    sudo apt-get install -y screen
fi

# 下载 PINGPONG
echo "正在下载 PINGPONG..."
wget -O PINGPONG https://pingpong-build.s3.ap-southeast-1.amazonaws.com/linux/latest/PINGPONG

# 提示用户输入设备ID，并验证输入
read -p "请输入您的设备ID：" device_id
if [[ -z "$device_id" ]]; then
    echo "错误：设备ID不能为空"
    exit 1
fi

# 增加一些提示信息
echo "正在启动 PINGPONG..."

# 创建一个名为 pingpong_session 的 screen 会话，并在其中执行启动指令
screen -dmS pingpong_session bash -c "chmod +x ./PINGPONG && ./PINGPONG --key $device_id"
if [ $? -ne 0 ]; then
    echo "错误：启动 PINGPONG 失败"
    exit 1
fi

echo "PINGPONG 已经在后台运行，请使用 'screen -r pingpong_session' 查看运行情况。"
