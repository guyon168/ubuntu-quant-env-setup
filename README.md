# ubuntu-quant-env-setup
A one-click install script to build a quantitative trading environment on Ubuntu


# install.sh
该脚本适用于 ubuntu 系统专用的批量下载脚本，会安装 pm2 等包。
在服务器中一键执行脚本安装命令为：（先下载脚本然后执行安装命令）

~~~
wget -N --no-check-certificate https://raw.githubusercontent.com/guyon168/ubuntu-quant-env-setup/main/install.sh && bash install.sh
~~~

# deploy-qronos.sh
该脚本是量化交易框架（Qronos）的 Docker 一键部署脚本，主要用于在 Linux（优先 Ubuntu/Debian）系统上自动化安装 Docker、拉取量化交易框架镜像并启动容器，同时处理内存配置、权限管理等关键环节，降低量化交易环境的部署门槛。

在服务器中一键执行脚本安装命令为
```
wget -N --no-check-certificate https://raw.githubusercontent.com/guyon168/ubuntu-quant-env-setup/main/deploy-qronos.sh && bash deploy-qronos.sh
```
