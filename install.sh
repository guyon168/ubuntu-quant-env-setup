#!/bin/bash

# 安装 Anaconda
echo "开始安装 miniconda3..."
# 创建miniconda3存储的文件夹
mkdir -p ~/miniconda3
# 下载 Anaconda 安装脚本
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
# 运行安装脚本
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
# 删除安装脚本
rm ~/miniconda3/miniconda.sh
# 激活base环境
source ~/miniconda3/bin/activate
# 初始化
conda init --all
# 配置channel
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r
# 验证 Anaconda 安装
conda --version

# 安装 PM2
echo "开始安装 PM2..."
# 更新环境
sudo apt --fix-broken install
sudo apt update && sudo apt upgrade -y
# 安装 Node.js（PM2 依赖 Node.js）
sudo apt install -y nodejs npm
# 安装 PM2
sudo npm install -g pm2
# 安装 PM2 日志管理工具
pm2 install pm2-logrotate
# 验证 PM2 安装
pm2 --version

# 创建 Python 3.11 的 Alpha 环境
echo "创建 Python 3.11 的 Alpha 环境..."
# 创建新的环境
conda create -n Alpha python=3.11 -y
# 激活环境
conda activate Alpha
# 验证 Python 版本
python --version

# 安装 xbx-py11 库
echo "安装 xbx-py11 库..."
pip install xbx-py11

# 安装Htop
echo "安装 Htop..."
sudo apt install htop

# 安装谷歌
echo "安装谷歌..."
# 下载谷歌
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O ~/google-chrome-stable_current_amd64.deb
# 安装谷歌
sudo dpkg -i ~/google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install -y
# 删除安装包
rm ~/google-chrome-stable_current_amd64.deb
# 验证谷歌
google-chrome --version

# 检查是否存在虚拟内存，Ubuntu 24.04.2 这个版本默认启用了 2G 的虚拟内存
if [ -f "/swap.img" ]; then
    # 停用旧的Swap
    sudo swapoff /swap.img
    # 删除原swap文件
    sudo rm /swap.img
fi
# 开始设置虚拟内存
sudo fallocate -l 8G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# 解决中文乱码
echo "开始安装字体"
cd /usr/share/fonts/
sudo wget https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansSC.zip
sudo apt install unzip
sudo unzip SourceHanSansSC.zip
sudo mv OTF/ SourceHanSans/
sudo fc-cache –fv
rm -rf ~/.cache/matplotlib

# 完成
echo "miniconda3更节省硬盘空间、PM2、PM2日志管理工具、SourceHanSansSC字体、设置虚拟8G虚拟内存、Htop内存和CPU查看工具、谷歌浏览器和 Python 环境安装完成，且安装了 xbx-py11 库。"

# 启动新的交互式 shell，保持在虚拟环境中
exec $SHELL
