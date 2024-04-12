#!/bin/bash

# 检查是否已安装 Docker
if ! command -v docker &> /dev/null; then
    echo "正在安装 Docker..."
    sudo apt-get update
    sudo apt-get install -y docker.io
fi

# 检查是否已安装 Screen
if ! command -v screen &> /dev/null; then
    echo "正在安装 Screen..."
    sudo apt-get update
    sudo apt-get install -y screen
fi

# 下载 PINGPONG
echo "正在下载 PINGPONG..."
wget -O PINGPONG https://pingpong-build.s3.ap-southeast-1.amazonaws.com/linux/v0.1.5/PINGPONG

# 提示用户输入设备ID，并等待用户输入
read -p "请输入您的设备ID：" device_id

# 创建一个名为pingpong_session的screen会话，并在其中执行启动指令
screen -dmS pingpong_session bash -c "chmod +x ./PINGPONG && ./PINGPONG --key $device_id"

echo ""
echo "PINGPONG 已经在后台运行。要查看运行情况，请执行以下命令："
echo "screen -r pingpong_session"
echo "按下 Ctrl+A 然后按下 D 键可以退出 Screen 会话，但不会停止 PINGPONG 的运行。"
