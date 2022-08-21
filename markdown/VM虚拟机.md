[TOC]

# 一、VM虚拟机压缩磁盘
1. 命令行输入baobab,centos自带磁盘分析工具,查看自己的大文件都哪些，删除无用文件
```shell
baobab
```
2. 用二进制为0的文件填充所有磁盘，删除这个文件：
```shell
sudo dd if=/dev/zero of=/zero.file bs=2M  
sudo sync # 把内容都同步到磁盘
sudo rm -rf /zero.file
```
3. 在虚拟机里面收缩根目录
```shell
sudo /usr/bin/vmware-toolbox-cmd disk list # 查看磁盘挂载点
sudo /usr/bin/vmware-toolbox-cmd disk shrink /
```

# 二、Linux清除历史记录
1. 删除.bash_history文件
```shell
rm -rf ~/.bash_history
sudo rm -rf /home/qingteng/.bash_* /root/.bash_*
```
2. 清空命令历史记录
```shell
history -c
```

# 三、Linux测试硬盘读取速度
1. 安装hdparm 
```shell
sudo yum install hdparm
```
2. 查看磁盘挂载点
```shell
df -h
```  
3. 测试硬盘的读取速度
```shell
sudo hdparm -t /dev/centos/root
```
4. 测试硬盘缓存的读取速度
```shell
sudo hdparm -T /dev/centos/root
```

# 四、开机自启动lmgrd
* bash中添加
```shell
/bin/su qingteng -c '/opt/synopsys/scl2018/linux64/bin/lmgrd -c /opt/synopsys/scl2018/admin/license/Synopsys.dat'
```

# 五、多个vmdk合成一个vmdk
* 使用cmd管理员权限进入vmware安装目录,执行以下命令：
```shell
vmware-vdiskmanager.exe -r "E:\Red Hat Enterprise Linux 6 64 位\Red Hat Enterprise Linux 6 64 位.vmdk" -t 0 "E:\Red Hat Enterprise Linux 6 64 位.vmdk"
```

# 六、CentOS动删除旧内核
1. 查看系统当前内核版本:
```shell
uname -a
```
2. 查看系统中全部的内核RPM包:
```shell
rpm -qa | grep kernel
```
3. 删除旧内核的RPM包:
```shell
yum remove kernel-3.10.0-229.14.1.el7
yum remove kernel-3.10.0-229.el7
```

