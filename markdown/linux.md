[toc]

# 一、linux网络
## 1. ssh
```shell
ssh-keygen # 本地生成密钥
ssh-copy-id root@65.135.0.36 # 将本地公钥内容id_rsa.pub添加到远程主机的authorized_keys中

vim /etc/ssh/sshd_config
    >PermitRootLogin yes # 允许root账户远程登录
    >PubkeyAuthentication yes # 允许密钥登录
sshd -t # 校验配置

systemctl restart sshd # 重启sshd
systemctl status sshd # 查看sshd状态
systemctl enable sshd # 开机自启动
```
## 2. firewall
```shell
systemctl status firewalld # 查看防火墙状态
firewall-cmd --permanent --add-port=1935/tcp --zone=public # 开放端口
firewall-cmd --reload # 重启防火墙
netstat -ntlp # 查看当前所有tcp端口
```
## 3. 更换镜像源
```shell
# centos7换源
su -
cd /etc/yum.repos.d/
mkdir backup
mv ./* ./backup/
curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
yum clean all
yum makecache
yum update

# fedora换源
su -
cd /etc/yum.repos.d/
mkdir backup
mv ./* ./backup/
wget -O /etc/yum.repos.d/fedora.repo http://mirrors.aliyun.com/repo/fedora.repo # fedora
wget -O /etc/yum.repos.d/fedora-updates.repo http://mirrors.aliyun.com/repo/fedora-updates.repo # fedora updates
dnf clean all
dnf makecache
dnf update

# almalinux换源
su -
sed -e 's|^mirrorlist=|#mirrorlist=|g' \
      -e 's|^# baseurl=https://repo.almalinux.org|baseurl=https://mirrors.aliyun.com|g' \
      -i.bak \
      /etc/yum.repos.d/almalinux*.repo
dnf clean all
dnf makecache
dnf update

# rockylinux换源
sed -e 's|^mirrorlist=|#mirrorlist=|g' \
    -e 's|^#baseurl=http://dl.rockylinux.org/$contentdir|baseurl=https://mirrors.aliyun.com/rockylinux|g' \
    -i.bak \
    /etc/yum.repos.d/Rocky-*.repo
dnf clean all
dnf makecache
dnf update
```
## 4. tigervnc-server安装
```shell
# centos7 老版本安装
yum install tigervnc-server
vncserver :1
vncpasswd
netstat -ntlp | grep 5901
sudo firewall-cmd --permanent --add-service=vnc-server --zone=public
sudo firewall-cmd --reload

# centos7 新版本安装
# /usr/share/doc/tigervnc/HOWTO.md 帮助文档
yum localinstall * # tigervnc-license tigervnc-server tigervnc-selinux tigervnc-server-minimal
sudo vim /etc/tigervnc/vncserver.users # 添加用户
sudo vim /etc/tigervnc/vncserver-config-defaults # 修改设置
sudo firewall-cmd --permanent --add-service=vnc-server --zone=public
sudo firewall-cmd --reload
vncpasswd
systemctl start vncserver@:x # 用户图形界面登录时，无法运行（vnc连接黑屏）
```
## 5. v2ray搭建
[V2Ray完全使用教程](https://yearliny.com/v2ray-complete-tutorial/)
[【新手教程】2022最新V2Ray搭建图文教程，V2Ray一键搭建脚本！](https://www.itblogcn.com/article/1501.html)
## 6. pip换源
```shell
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
pip config list
pip install -U pip # 升级pip
```
## 7. linux v2ray客户端使用
```shell
# 解压安装文件
unzip v2ray-linux-64.zip -d v2ray

# 配置文件
# win客户端导出config.json替换
# socks 10808 http 10809
v2ray -test -config config.json # 检查配置文件

# 启动v2ray
./v2ray
netstat -ntlp # 查看v2ray端口

# 系统设置
# 网络-->网络代理-->手动(和config.json文件对应)
# http 127.0.0.1:10809
# socks 127.0.0.1:10808

# 测试
curl -x socks5://127.0.0.1:10808 https://www.google.com -v # 返回源代码则配置成功
firefox # 使用系统代理或手动配置打开youtube
```
* 参考
[Linux下使用v2ray](https://www.junz.org/post/v2_in_linux/)
[linux下配置V2ray作为客户端来访问GitHub、G*le等服务](https://www.witersen.com/?p=1408)


# 二、linux虚拟机
## 1. 压缩磁盘
```shell
baobab # centos自带磁盘分析工具,查看自己的大文件都哪些，删除无用文件

sudo dd if=/dev/zero of=/zero.file bs=2M # 用二进制为0的文件填充所有磁盘
sudo sync # 把内容都同步到磁盘
sudo rm -rf /zero.file

sudo /usr/bin/vmware-toolbox-cmd disk list # 查看磁盘挂载点
sudo /usr/bin/vmware-toolbox-cmd disk shrink / # 在虚拟机里面收缩根目录
```
## 2. 多个vmdk合成一个vmdk
```shell
# 使用cmd管理员权限进入vmware安装目录,执行以下命令
vmware-vdiskmanager.exe -r "E:\Red Hat Enterprise Linux 6 64 位\Red Hat Enterprise Linux 6 64 位.vmdk" -t 0 "E:\Red Hat Enterprise Linux 6 64 位.vmdk"
```


# 三、linux美化
## 1. 主题
```shell
# 主题位置
/usr/share/themes

# 图标光标位置
/usr/share/icons

# 扩展位置
/usr/share/gnome-shell/extensions

# centos7插件
gnome-tweak-tool
gnome-shell-extension-dash-to-dock
gnome-themes-standard

# fedora36/almalinux8.6插件
gnome-tweaks
gnome-shell-extension-dash-to-dock
gnome-themes-standard
```


# 四、linux软件安装
## 1. 删除旧内核
```shell
uname -a # 查看正在使用内核
rpm -qa | grep kernel # 查看系统中全部内核
yum remove kernel-3.10.0-1160.76.1.el7.x86_64  # 删除多余内核
```
## 2. texlive2022安装
```shell
# 安装图形化组件
sudo dnf install perl-Digest-MD5 perl-Tk tk

# 挂载iso镜像
mkdir /texlive
sudo mount texlive2022-20220321.iso /texlive

# 安装
cd /texlive
sudo ./install-tl # 命令行安装
sudo ./install-tl -gui # 图形化安装

# 卸载镜像
umount /texlive
rm -rf /texlive

# 配置路径
vim ~/.bashrc
    >export MANPATH=$MANPATH:/opt/texlive2022/texmf-dist/doc/man
    >export INFOPATH=$INFOPATH:/opt/texlive2022/texmf-dist/doc/info
    >export PATH=$PATH:/opt/texlive2022/bin/x86_64-linux
source ~/.bashrc

# 更新字体信息
sudo cp /opt/texlive2022/texmf-var/fonts/conf/texlive-fontconfig.conf /etc/fonts/conf.d/09-texlive.conf
cd /etc/fonts/conf.d/
sudo fc-cache -fsv # (执行失败就再执行此命令一次)

# 更新配置源
sudo tlmgr option repository https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet

# 更新宏包
sudo tlmgr update --self --all

# 验证安装结果
tex -v

# 安装texworks
sudo dnf install texworks
# 修改默认路径 编辑->首选项->排版
# Tex及相关程序路径 /opt/texlive2022/bin/x86_64-linux
# 处理工具 XeLaTeX
```


# 五、linux操作
## 1. linux清除历史记录
```shell
sudo rm -rf /home/qingteng/.bash_* /root/.bash_* # 删除.bash_history文件
history -c # 清空命令历史记录
```
## 2. 查看当前桌面环境
```shell
echo $XDG_SESSION_TYPE
    >x11
```
## 3. alternatives命令
```shell
# alternatives [options] --install link name path priority
alternatives --install /usr/bin/java java /tools/jdk/bin/java 3

# alternatives [options] --set name path
# alternatives [options] --remove name path
# alternatives [options] --remove-all name

# alternatives [options] --auto name
# alternatives [options] --display name
# alternatives [options] --list

# alternatives [options] --config name
alternatives --config java
```
## 4. systemd开机自启动
```shell
# 编写脚本
vim /home/qingteng/startup.sh
    >date > /home/qingteng/startup.txt
# 增加可执行权限
chmod +x /home/qingteng/startup.sh
# 编写服务文件
vim /etc/systemd/system/startup.service
    >[Unit]
    >Description=Startup Example
    >ConditionPathExists=/home/qingteng/startup.sh
    >After=network.target
    >
    >[Service]
    >Type=forking
    >ExecStart=/usr/bin/bash /home/qingteng/startup.sh
    >
    >[Install]
    >WantedBy=multi-user.target
# 刷新配置
systemctl daemon-reload
# 启动测试
systemctl start startup.service
# 查看文件是否创建成功
cat /home/qingteng/startup.txt
# 开机自启动
systemctl enable startup.service
# 重启
reboot
# 查看文件是否创建成功
cat /home/qingteng/startup.txt
```


# 六、linux下EDA软件相关
## 1. 开机自启动lmgrd
```shell
/bin/su qingteng -c '/opt/synopsys/scl2018/linux64/bin/lmgrd -c /opt/synopsys/scl2018/admin/license/Synopsys.dat'
```
