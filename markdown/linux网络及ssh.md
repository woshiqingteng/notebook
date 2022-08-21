* ssh
  ```shell
  # 在Linux上配置不要再Windows上配置(ssh功能不全)
  ssh-keygen # 本地生成密钥
  ssh-copy-id root@65.135.0.36 # 将本地公钥内容id_rsa.pub添加到远程主机的authorized_keys中

  # SSH免密不生效解决办法
  vim /etc/ssh/sshd_config

  PermitRootLogin yes # 允许root账户远程登录
  PubkeyAuthentication yes # 允许密钥登录

  sshd -t # 校验配置

  systemctl restart sshd # 重启sshd
  systemctl status sshd # 查看sshd状态
  systemctl enable sshd #  开机自启动
  ```
* 美化
  ```shell
  # 主题
  sudo yum install gnome-tweak-tool # 安装优化，注销掉当前图形界面的Session，然后再次登入
  /usr/share/themes # 主题位置

  /usr/share/gnome-shell/extensions # 扩展位置
  ```
* 防火墙
  ```shell
  systemctl status firewalld # 查看防火墙状态
  firewall-cmd --zone=public --add-port=1935/tcp --permanent
  # --zone 作用域
  # --add-port=1935/tcp 添加端口,格式:端口/通讯协议
  # -permanent 永久生效
  firewall-cmd --reload # 重启防火墙
  netstat -ntlp # 查看当前所有tcp端口,没有此命令安装net-tools
  # -n,--numeric 显示数字形式地址而不是去解析主机、端口或用户名
  # -t,--tcp 仅显示TCP相关
  # -l,--listening 只显示正在侦听的套接字(这是默认的选项)
  # -p,--programs 显示套接字所属进程的PID和名称
  ```
* 删除多余内核
  ```shell
  # 查看正在使用内核
  uname -a 
  
  # 查看系统中全部内核
  rpm -qa | grep kernel # rpm -q[query-options] -a,--all查询所有安装包
  yum list installed *kernel*

  # 删除多余内核
  yum remove kernel-3.10.0-1160.62.1.el7.x86_64
  ```
* 软件源
  ```shell
  # fastestmirror
  yum-plugin-fastestmirror

  # RPM Fusion RHEL or compatible like CentOS
  sudo dnf install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm

  #
  sudo dnf clean all
  sudo dnf makecache
  sudo dnf update 
  ```

  