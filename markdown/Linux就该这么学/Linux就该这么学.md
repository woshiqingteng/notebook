[TOC]

# 第1章 部署虚拟环境安装Linux系统
*  准备您的工具
*  安装配置VM虚拟机
*  安装您的Linux系统
*  重置root管理员密码
    ```shell
    # 重启Linux系统出现引导界面时，按e进入内核编辑界面
    # 在linux参数这行最后追加rd.break,按下Ctrl+X运行修改过内核,进入紧急救援模式
    # 输入以下命令,重启系统等待
    mount -o remount,rw /sysroot
    chroot /sysroot
    passwd
    touch /.autorelabel # 重启后SELinux自动重新标记所有文件
    exit
    reboot
    ```
*  RPM(红帽软件包管理器)
    ```shell
    rpm -ivh filename.rpm # 安装文件
    rpm -Uvh filename.rpm # 升级软件
    rpm -e filename.rpm # 卸载软件
    ```
*  Yum软件仓库
    ```shell
    yum repolist all # 列出所有仓库
    yum list all # 列出仓库中所有包
    yum install package # 安装软件包
    yum update package # 升级软件包
    yum remove package # 移除软件包
    yum clean all # 清除所有仓库缓存
    yum check-update # 检查可更新软件包
    ```
*  systemd初始化进程
    ```shell
    # RHEL7采用systemd初始化进程服务
    systemctl start foo.service # 启动服务
    systemctl restart foo.service # 重启服务
    systemctl stop foo.service # 停止服务
    systemctl status foo.service # 查看服务状态

    systemctl enable foo.service # 开机自启动
    systemctl disable foo.service # 开机不自启动
    systemctl is-enabled foo.service # 查看特定服务是否为开机自启动
    systemctl list-unit-files --type=service # 查看各个级别下服务的启动与禁用情况
    ```

# 第2章 新手必须掌握的Linux命令
* 强大好用的Shell
* 执行查看帮助命令
  `man`
* 常用系统工作命令
  ```shell
  # echo命令
  echo Linuxprobe.com
  echo $SHELL
  # date命令
  date
  date "+%Y-%m-%d %H:%M:%S" # %Y 年 %m 月 %d 日 %H 小时(00-23) %M 分钟(00-59) %S秒(00-59)
  date -s "20170901 8:30:00" # -s 将系统当前时间设置为
  date
  date  "+%j" # %j 今年中第几天
  # reboot命令
  reboot # 重启系统
  # poweroff命令
  poweroff # 关闭系统
  # wget命令
  wget http://www.linuxprobe.com/docs/LinuxProbe.pdf
  wget -r -p http://www.linuxprobe.com # -r 递归下载 -p 下载到制定目录
  # ps命令
  ps -aux # -a 显示所有进程 -u 用户及其他详细信息 -x 显示没有控制端的进程
  # top命令
  top # 动态监视进程活动与系统负载等信息
  # pidof命令
  pidof sshd # 查询制定服务进程PID
  # kill命令
  kill 2156 # 终止指定PID服务进程
  # killall命令
  pidof httpd
  killall httpd
  pidof httpd # 终止指定名称服务对应的全部进程
  ```
* 系统状态检测命令
  ```shell
  # ifconfig命令
  ifconfig # 获取网卡配置与网络状态等信息
  # uname命令
  uname -a # 查看系统内核与系统版本信息
  cat /etc/redhat-release
  # uptime命令
  uptime # 查看系统的负载信息
  # free命令
  free -h # 显示当前系统中内存的使用量信息
  # who命令
  who # 查看当前登入主机的用户终端信息
  # last命令
  last # 查看所有系统的登录信息
  # history命令
  history # 显示执行过的命令
  cat ~/.bash_history
  history -c # -c 清空所有历史命令
  # sosreport命令
  sosreport # 收集系统配置及架构信息并输出诊断文档 root权限
  ```
* 工作目录切换命令
  ```shell
  # pwd命令
  pwd # 显示用户当前所处的工作目录
  # cd命令
  cd /etv # 切换工作路径
  cd - # 返回到上一次目录
  cd ~ # 切换到用户家目录
  # ls命令
  ls -al # 显示目录中的文件信息 -l 查看文件属性、大小等详细信息 -a查看所有文件(包括隐藏文件)
  ls -ld /etc # -d 查看目录属性信息
  ```
* 文本文件编辑命令
  ```shell
  # cat命令
  cat -n initial-setup-ks.cfg # 查看纯文本文件 -n 显示行号
  # more命令
  more initial-setup-ks.cfg # 百分比查看纯文本文件
  # head命令
  head -n 20 initial-setup-ks.cfg # 查看纯文本文件前N行
  # tail命令
  tail -f /var/log/messages # 查看纯文本文档后N行1 -f 实时查看最新日志文档、
  # tr命令
  cat anaconda-ks.cfg | tr [a-z] [A-Z] # 替换文本中字符
  # wc命令
  wc -l /etc/passwd # 统计文本的行数、字数、字节数 # -l 只显示行数
  # stat命令
  stat anaconda-ks.cfg # 查看文件具体存储信息和时间等信息
  # cut命令
  head -n 2 /etc/passwd
  cut -d: -f1 /etc/passwd # 按列提取文本字符 -d 间隔符号 -f 需要看的列数
  # diff命令
  diff --brief diff_A.txt diff_B.txt # 比较多个文本文件的差异 --brief 显示比较后结果
  diff -c diff_A.txt diff_B.txt # -c 描述文件内容具体的不同
  ```
* 文件目录管理命令
  ```shell
  # touch命令
  ls -l anaconda-ks.cfg
  echo "Visit the LinuxProbe.com to learn linux skills" >> anaconda-ks.cfg
  ls -l anaconda-ks.cfg
  touch -d "2017-05-04 15:44" anaconda-ks.cfg # 创建空白文件或设置文件的时间
  ls -l anaconda-ks.cfg
  # mkdir命令
  mkdir linuxprobe # 创建空白目录
  cd linuxprobe
  mkdir -p a/b/c/d/e
  cd b
  # cp命令
  touch install.log
  cp install.log x.log # 复制文件或目录
  ls
  # mv命令
  mv x.log linux.log # 剪切文件或将文件重命名
  ls
  # rm命令
  rm install.log # 删除文件或目录
  rm -f linux.log # -f 强制删除 -r 递归
  ls
  # dd命令
  dd if=/dev/zero of=560_file count=1 bs=560M # 按照指定大小和个数的数据块来复制文件或转换文件
  # if 输入文件名称 of 输出文件名称 bs 设置每块的大小 count 设置复制块的个数
  dd of=/dev/cdrom of=RHEL-server-7.0-x86_64-LinuxProbe.com.iso # 将光驱设备中光盘制作成iso镜像
  # file命令
  file anaconda-ks.cfg # 查看文件类型
  file /dev/sda
  ```
* 打包压缩与搜索命令
  ```shell
  # tar命令
  tar -czvf etc.tar.gz /etc # 对文件进行打包或解压 -c 创建压缩文件 -z 用Gzip压缩或解压 -v 显示压缩或解压过程 -f 目标文件名
  mkdir /root/etc
  tar -xzvf etc.tar.gz -C /root/etc # -x 解开压缩文件 -C 指定解压到的目录
  # grep命令
  grep /sbin/nologin /etc/passwd # 在文本中执行关键词搜索，并显示匹配的结果 -n 显示搜索到信息的行数 -v 反选信息
  # find命令
  find /etc -name "host*" -print # 按照指定条件查看文件 -name 匹配名称
  find / -perm -4000 -print # -perm 匹配权限
  ```

# 第3章 管道符、重定向与环境变量
* 输入输出重定向
  * 标准输入重定向(STDIN，文件描述符为0):默认从键盘输入，也可从其他文件或命令中输入。
  * 标准输出重定向(STDOUT，文件描述符为1):默认输出到屏幕。
  * 标准错误重定向(STDERR，文件描述符为2):默认输出到屏幕。

  **输入重定向中用到的符号及其作用**
  | 符号                 | 作用                                       |
  | -------------------- | ------------------------------------------ |
  | 命令 < 文件          | 将文件作为命令的标准输入                   |
  | 命令 << 分界符       | 从标准输入读入，直到遇见分界符才停止       |
  | 命令 < 文件1 > 文件2 | 将文件1命令作为标准输入并将标准输出到文件2 |

  **输出重定向中用到的符号及其作用**
  | 符号                               | 作用                                                     |
  | ---------------------------------- | -------------------------------------------------------- |
  | 命令 > 文件                        | 将标准输出重定向到一个文件中(清空原有文件数据)           |
  | 命令 2> 文件                       | 将错误输出重定向到一个文件中(清空原有文件数据)           |
  | 命令 >> 文件                       | 将标准输出重定向到一个文件中(追加到原有内容后面)         |
  | 命令 2>> 文件                      | 将错误输出重定向到一个文件中(追加到原有内容后面)         |
  | 命令 >> 文件 2>&1 或 命令 &>> 文件 | 将标准输出与错误输出共同写入到文件中(追加到原有内容后面) |

  ```shell
  man bash > readme.txt
  cat readme.txt
  echo "Welcome to LinuxProbe.Com" > readme.txt
  echo "Quality linux learning materials" >> readme.txt
  cat readme.txt
  ls -l xxxxxx
  ls -l xxxxxx > /root/stderr.txt
  ls -l xxxxxx 2> /root/stderr.txt
  cat /root/stderr.txt
  wc -l < readme.txt
  ```
* 管道命令符
  ```shell
  grep "/sbin/nologin" /etc/passwd | wc -l # 把前一个命令原本输出到屏幕上的标准正常数据当做后一个命令的标准输入
  ls -l /etc | more
  echo "linuxprobe" | passwd --stdin root # 管道符和passwd命令--stdin结合，一条命令完成重置密码
  echo "Content" | mail -s  "Subject" linuxprobe
  su - linuxprobe
  mail
  ```
* 命令行的通配符
  ```shell
  ls -l /dev/sda*
  ls -l /dev/sda?
  ls -l /dev/sda[0-9]
  ls -l /dev/sda[135]
  ```
* 常用的转义字符
  * 反斜杠（ \ ）：使反斜杠后面一个变量变为单纯的字符串
  * 单引号（ ' ' ）：转义其中所有变量为单纯的字符串
  * 双引号（ " " ）：保留其中的变量属性，不进行转义处理
  * 反引号（ \` ` ）：把其中的命令执行后返回结果
  ```shell
  PRICE=5
  echo "Price is $PRICE"
  echo "Price is \$$PRICE"
  echo `uname -a`
  ```
* 重要的环境变量
  ```shell
  ls
  rm anaconda-ks.cfg
  alias rm # alias 自定义命令名称替换原来命令名称
  unalias rm
  rm initial-setup-ks.cfg
  echo $PATH
  PATH=$PATH:/root/bin
  echo $PATH
  echo $HOME
  su - linuxprobe
  echo $HOME
  mkdir /home/workdir
  WORKDIR=/home/workdir
  cd $WORKDIR
  pwd
  su linuxprobe
  cd $WORKDIR
  echo $WORKDIR
  exit
  export WORKDIR # export将一般变量转换为全局变量
  su linuxprobe
  cd $WORKDIR
  pwd
  ``` 

# 第4章 Vim编辑器与Shell命令脚本
* Vim文本编辑器
  命令模式：控制光标移动，可对文本进行复制、粘贴、删除和查找等工作
  输入模式：正常的文本录入
  末行模式：保存或退出文档。以及设置编辑变量
  ```shell
  # 配置主机名称
  vim /etc/hostname

  # 配置网卡信息
  cd /etc/sysconfig/network-scripts/
  vim ifcfg-eno16777736

  # 配置Yum软件仓库
  cd /etc/yum.repos.d/
  ```
* 编写Shell脚本
  ```shell
  # 编写简单的脚本
  vim example.sh
  #!/bin/bash
  # For Example BY linuxprobe.com
  pwd
  ls -al
  bash example.sh
  chmod u+x example.sh
  ./example.sh

  # 接受用户参数
  vim example.sh
  #!/bin/bash
  echo "当前脚本名称为$0"
  echo "总共有$#个参数，分别是$*。"
  echo "第1个参数为$1，第5个为$5。"
  sh example.sh one two three four five six
  # $0 Shell脚本程序名称 $# 参数个数 $* 所有位置参数 $? 上次命令执行返回值 $1、$2、$3...... 第N个位置参数

  # 判断用户的参数
  [ -d /etc/fstab ] # -d 测试文件是否为目录类型
  echo $? # 条件成立返回数字0
  [ -f /etc/fstab ] # -f 判断是否为一般文件
  echo $?
  [ -e /dev/cdrom ] && echo "Exist" # && 当前面命令执行成功后才会执行后面命令
  [ $USER = root ] || echo "user" # || 前面命令执行失败后才执行后面命令
  [ ! $USER = root ] || echo "administrator" # ! 条件测试判断结果取反
  [ ! $USER = root ] && echo "user" || echo "root"
  [ 10 -gt 10 ]
  echo $?
  [ 10 -eq 10 ]
  echo $?
  FreeMem=`free -m | grep Mem: | awk '{print $4}'`
  echo $FreeMem
  [ $FreeMem -lt 1024 ] && echo "Insufficient Memory"
  [ -z $String ]
  echo $?
  echo $LANG
  [ $LANG != "en.US" ] && echo "Not en.US"
  ```
* 流程控制语句
  ```shell
  # if条件测试语句
  #!/bin/bash
  DIR="/media/cdrom"
  if [ ! -e $DIR ]
  then
  mkdir - p $DIR
  fi
  
  bash mkcdrom.sh
  ls -d /media/cdrom

  #!/bin/bash
  ping -c 3 -i 0.2 -W 3 $1 &> /dev/null # -c 尝试次数 -i 每个数据包发送间隔 -W 等待超时时间
  if [ $? -eq 0 ]
  then
  echo "Host $1 is On-line."
  else
  echo "Host $1 is Off-line."
  fi

  bash chkhost.sh 192.168.10.10
  bash chkhost.sh 192.168.10.20

  #!/bin/bash
  read -p "Enter your score(0-100):" GRADE # read 读取用户输出信息-p 显示提示信息
  if [ $GRADE -ge 85 ] && [ $GRADE -le 100 ] ; then
  echo "$GRADE is Excellent"
  elif [ $GRADE -ge 70 ] && [ $GRADE -le 84 ] ; then
  echo "$GRADE is Pass"
  else
  echo "$GRADE is Fail"
  fi

  bash chkscore.sh

  # for条件循环语句
  #!/bin/bash
  read -p  "Enter The Users Passwd : " PASSWD
  for UNAME in `cat users.txt`
  do
  id $UNAME &> /dev/null
  if [ $? -eq 0 ]
  then
  echo "Already exists"
  else
  useradd $UNAME &> /dev/null
  echo "$PASSWD" | passwd --stdin $UNAME &> /dev/null
  if [ $? -eq 0 ]
  then
  echo "$UNAME , Create success"
  else
  echo "$UNAME , Create failure"
  fi
  fi
  done

  bash Example.sh
  tail -6 /etc/passwd

  #!/bin/bash
  HLIST=$(cat ~/ipadds.txt)
  for IP in $HLIST
  do
  ping -c 3 -i 0.2 -W 3 $IP &> /dev/null
  if [ $? -eq 0 ] ; then
  echo "Host $IP is On-line."
  else
  echo "Host $IP is Off-line."
  fi
  done

  chmod u+x CheckHosts.sh
  ./CheckHosts.sh

  # while条件循环语句
  #!/bin/bash
  PRICE=$(expr $RANDOM % 1000)
  TIMES=0
  echo "商品实际价格为0-999之间，猜猜是多少？"
  while true
  do
  read -p "请输入您猜测的价格数目：" INT
  let TIMES++
  if [ $INT -eq $PRICE ] ; then
  echo "恭喜您答对了；实际价格是$PRICE"
  echo "您总共猜测了$TIMES次"
  exit 0
  elif [ $INT -gt $PRICE ] ; then
  echo "太高了！"
  else
  echo "太低了！"
  fi
  done

  bash Guess.sh

  # case条件测试语句
  #!/bin/bash
  read -p "请输入一个字符，并按Enter键确认：" KEY
  case "$KEY" in
  [a-z]|[A-Z])
  echo "您输入的是 字母。"
  ;;
  [0-9])
  echo "您输入的是 数字。"
  ;;
  *)
  echo "您输入的是 空格、功能键或其他控制字符。"
  esac

  bash Checkkeys.sh
  ```
* 计划任务服务程序
  ```shell
  # 一次性计划任务：今晚11点30分开启网站服务
  at 23:30
  at -l # -l 查看设置好还未执行的一次性任务
  echo "systemctl restart hhtpd" | at 23:30
  at -l
  atrm 3 # 删除任务
  at -l
  # 长期性计划任务：每周一凌晨3点25分把/home/wwwroot目录打包备份为backup.tar.gz
  crontab -e # -e 创建、编辑计划任务
  25 3 * * 1,3,5 /usr/bin/tar -czvf backup.tar.gz /home/wwwroot
  crontab -l # -l 查看当前计划任务 -r 删除某条计划任务 -u 以管理员身份登录时，编辑他人计划任务
  whereis rm
  crontab -e
  0 1 * * 1-5 /usr/bin/rm -rf /tmp/*
  crontab -l
  ```

# 第5章 用户身份与文件权限
* 用户身份与能力
  ```shell
  # useradd命令
  useradd -d /home/linux -u 8888 -s /sbin/nologin linuxprobe # -d 指定家目录位置（默认/home/username）
  # -u 指定用户默认UID -s 指定用户默认Shell解释器
  id linuxprobe

  # groupadd命令
  groupadd ronny # 创建用户组

  # usermod命令
  id linuxprobe
  usermod -G root linuxprobe # 修改用户属性 -G 变更扩展用户组
  id linuxprobe
  usermod -u 8888 linuxprobe # -u 修改用户UID
  id linuxprobe

  # passwd命令
  passwd # 修改用户密码、过期时间、认证信息等
  passwd linuxprobe
  passwd -l linuxprobe # -l 锁定用户，禁止其登录
  passwd -S linuxprobe # -S 显示用户密码是否被锁定，以及密码所采用的加密算法名称
  passwd -u linuxprobe # -u 解除锁定，允许用户登录
  passwd -S linuxprobe

  # userdel命令
  id linuxprobe
  userdel -r linuxprobe # 删除用户 -r 同时删除用户及用户家目录
  id linuxprobe
  ```
* 文件权限与归属
  * \- 普通文件
  * d 目录文件
  * l 链接文件
  * b 块设备文件
  * c 字符设备文件
  * p 管道文件
* 文件的特殊权限
  ```shell
  # SUID
  ls -l /etc/shadow
  ls -l /bin/passwd
  # SGID
  cd /tmp
  mkdir testdir
  ls -ald testdir/
  chmod -Rf 777 testdir/
  chmod -Rf g+s testdir/
  ls -ald testdir/
  su - linuxprobe
  cd /tmp/testdir/
  echo "linuxprobe.com" > test
  ls -al test
  chmod 760 test
  ls -l test
  chown root:bin test
  ls -l test
  # SBIT
  su - linuxprobe
  ls -ald /tmp
  cd /tmp
  ls -ald
  echo "Welcome to linuxprobe.com" > test
  chmod 777 test
  ls -al test
  su - blackshield
  cd /tmp
  rm -f test
  exit
  cd ~
  mkdir linux
  chmod -R o+t linux/
  ls -ld linux/
  ```
* 文件的隐藏属性
  ```shell
  # chattr命令
  echo "for Test" > linuxprobe
  rm linuxprobe
  echo "for Test" > linuxprobe
  chattr +a linuxprobe # 设置文件隐藏权限 -a 仅允许补充内容，无法覆盖/删除内容（Append Only）
  rm linuxprobe

  # lsattr命令
  ls -al linuxprobe
  lsattr linuxprobe
  chattr -a linuxprobe
  lsattr linuxprobe
  rm linuxprobe
  ```
* 文件访问控制列表
  ```shell
  # setfacl命令
  setfacl -Rm u:linuxprobe:rwx /root # 管理文件ACL规则
  su - linuxprobe
  cd /root
  ls
  cat anaconda-ks.cfg
  exit
  ls -ld /root # 文件已设置ACL，文件权限最后一个点变成加号
  # getfacl命令
  getfacl /root # 显示文件上设置的ACL信息
  ```
* su命令与sudo服务
  ```shell
  id
  su - linuxprobe # - 完全切换到新的用户，环境变量信息也变更为新用户的相应信息
  id
  visudo # 配置用户权限
  sudo -l # -l 列出当前用户可执行命令
  ls /root
  sudo ls /root
  whereis cat
  visudo
  su - linuxprobe
  cat /etc/shadow
  sudo cat /etc/shadow
  whereis poweroff
  visudo # NOPASSWD sudo命令不需要密码验证
  su - linuxprobe
  poweroff
  sudo poweroff
  ```

# 第6章 存储结构与磁盘划分
* 一切从“/”开始
* 物理设备的命名规则
* 文件系统与数据资料
* 挂载硬件设备
  ```shell
  # mount命令
  mount /dev/sdb2 /backup # 挂载文件系统 -a 挂载所有在/etc/fstab中定义的文件系统 -t 指定文件系统
  vim /etc/fstab
  # umount命令
  umount /dev/sdb2 # 撤销已经挂载的设备文件 
  ``` 
* 添加硬盘设备
  ```shell
  # fdisk命令
  fdisk /dev/sdb # 管理磁盘分区，交互式
  >p # 查看分区信息
  >n # 添加新的分区
    >p # 创建主分区
    >1 # 主分区编号
    >  # 默认按回车
    >+2G # 创建容量2GB硬盘分区
  >p
  >w # 保存并退出
  file /dev/sdb1
  partprobe # 分区信息同步到内核
  partprobe
  file /dev/sdb1
  mkfs.xfs /dev/sdb1 # mkfs双击tab显示文件系统
  mkdir /newFS
  mount /dev/sdb1 /newFS/
  df -h # 查看挂载状态和磁盘使用量信息 -h 常见格式显示大小
  # du命令
  cp -rf /etc/* /newFS/
  ls /newFS
  du -sh /newFS/ # 查看文件数据占用量 -s 每个参数只显示总和 -h 常见格式显示大小
  vim /etc/fstab # 设备文件挂载永久有效，把挂载信息写入到配置文件中
  ```
* 添加交换分区
  ```shell
  fdisk /dev/sdb
  >n
    >p
    >
    >
    >+5G
  >p
  >w
  mkswap /dev/sdb2 # SWAP分区格式化命令
  free -m
  swapon /dev/sdb2 # 将SWAP分区设备挂载到系统中
  free -m # 显示系统已用和未用内存空间总和 -m MB
  vim /etc/fstab # 挂载信息写入到配置文件
  ```
* 磁盘容量配额
  ```shell
  vim /etc/fstab # uquota参数
  useradd tom
  chmod -Rf o+w /root
  # xfs_quota命令
  xfs_quota -x -c 'limit bsoft=3m bhard=6m isoft=3 ihard=6 tom' /boot # 针对XFS文件系统管理quota磁盘容配额服务
  # -c 以参数形式设置要执行的命令 -x 专家模式
  xfs_quota -x -c report /boot
  su - tom
  dd if=/dev/zero of=/boot/tom bs=5M count=1
  dd if=/dev/zero of=/boot/tom bs=8M count=1
  # edquota命令
  edquota -u tom # 编辑用户quota配额限制 -u 指定用户
  su - tom
  dd if=/dev/zero of=/boot/tom bs=8M count=1
  dd if=/dev/zero of=/boot/tom bs=10M count=1
  ```
* 软硬方式链接
  ```shell
  echo "Welcom to linuxprobe.com" > readme.txt
  ln -s readme.txt readit.txt # 创建链接文件 -s 符号链接
  cat readme.txt
  ls -l readme.txt
  rm -f readme.txt
  cat readit.txt
  echo "Welcom to linuxprobe.com" > readme.txt
  ln readme.txt readit.txt # 默认创建硬链接
  cat readme.txt
  ls -l readme.txt
  rm -f readme.txt
  cat readit.txt
  ```

# 第7章 使用RAID和LVM磁盘阵列技术
* RAID（独立冗余磁盘阵列）
  ```shell
  # RAID 0

  # RAID 1

  # RAID 5

  # RAID 10

  # 部署磁盘阵列
  mdadm -Cv /dev/md0 -a yes -n 4 -l 10 /dev/sdb /dev/sdc /dev/sdd /dev/sde # 管理Linux系统中RAID磁盘阵列
  # -C 创建一个RAID阵列卡 -v 显示创建过程 -a yes 自动创建设备文件 -n 4 4块硬盘部署RAID磁盘阵列 -l 10 RAID 10方案
  mkfs.ext4 /dev/md0
  mkdir /RAID
  mount /dev/md0 /RAID
  df -h
  mdadm -D /dev/md0 # -D 查看详细信息
  echo "/dev/md0 /RAID ext4 defaults 0 0" >> /etc/fstab # 挂载信息写入配置文件

  # 损坏磁盘阵列及修复
  mdadm /dev/md0 -f /dev/sdb # -f 模拟设备损坏
  mdadm -D /dev/md0
  umount /RAID
  mdadm /dev/md0 -a /dev/sdb # -a 检测设备名称
  mdadm -D /dev/md0
  mount -a

  # 磁盘阵列+备份盘
  mdadm -Cv /dev/md0 -n 3 -l 5 -x 1 /dev/sdb /dev/sdc /dev/sdd /dev/sde # -x 1 一块备份盘
  mdadm -D /dev/md0
  mkfs.ext4 /dev/md0
  echo "/dev/md0 /RAID ext4 defaults 0 0" >> /etc/fstab
  mkdir /RAID
  mount -a
  mdadm /dev/md0 -f /dev/sdb
  mdadm -D /dev/md0
  ```
* LVM（逻辑卷管理器）
  ```shell
  
  # 部署逻辑卷
  pvcreate /dev/sdb /dev/sdc # 添加两块磁盘支持LVM
  vgcreate storage /dev/sdb /dev/sdc
  vgdisplay
  lvcreate -n vo -l 37 storage # -l 37 基本单元默认大小为4MB，生成大小37x4MB=148MB逻辑卷 -L 150M 生成大小150MB逻辑卷
  lvdisplay
  mkfs.ext4 /dev/storage/vo
  mkdir /linuxprobe
  mount /dev/storage/vo /linuxprobe
  df -h
  echo "/dev/storage/vo /linuxprobe ext4 defaults 0 0" >> /etc/fstab
  # 扩容逻辑卷
  umount /linuxprobe
  lvextend -L 290M /dev/storage/vo
  e2fsck -f /dev/storage/vo # 检查磁盘完整性
  resize2fs /dev/storage/vo # 重置磁盘容量
  mount -a
  df -h
  # 缩小逻辑卷
  umount /linuxprobe
  e2fsck -f /dev/storage/vo
  resize2fs /dev/storage/vo 120M
  lvreduce -L 120M /dev/storage/vo
  mount -a
  df -h
  # 逻辑卷快照
  vgdisplay
  echo "Welcome to Linuxprobe.com" > /linuxprobe/readme.txt
  ls -l /linuxprobe
  lvcreate -L 120M -s -n SNAP /dev/storage/vo # -s 生成快照卷
  lvdisplay
  dd if=/dev/zero of=/linuxprobe/files count=1 bs=100M
  lvdisplay
  umount /linuxprobe
  lvconvert --merge /dev/storage/SNAP
  mount -a
  ls /linuxprobe
  # 删除逻辑卷
  umount /linuxprobe
  vim /etc/fstab
  lvremove /dev/storage/vo
  vgremove storage
  pvremove /dev/sdb /dev/sdc
  ```

# 第8章 iptables与firewalld防火墙
* 防火墙管理工具
* iptables
  ```shell
  # 策略与规则链
  
  # iptables中基本的命令参数
  iptables -L # -L 查看规则链
  iptables -F # -F 清空规则链
  iptables -L
  iptables -P INPUT DROP # INPUT规则链默认策略设置为拒绝 -P 设置默认策略
  iptables -L
  iptables -I INPUT -p icmp -j ACCEPT # -I 在规则链的头部加入新规则 -p 匹配协议，如tcp，udp，icmp
  ping -c 4 192.168.10.10
  iptables -D INPUT 1 # -D 删除某一条规则
  iptables -P INPUT ACCEPT
  iptables -L
  iptables -I INPUT -s 192.168.10.0/24 -p tcp --dport 22 -j ACCEPT # -s 匹配来源地址IP/MASK，加感叹号！表示除这个IP外
  iptables -A INPUT -p tcp --dport 22 -j REJECT # --dport 匹配目标端口号
  iptables -L
  ssh 192.168.10.10
  ssh 192.168.10.10
  iptables -I INPUT -p tcp --dport 12345 -j REJECT
  iptables -I INPUT -p udp --dport 12345 -j REJECT
  iptables -L
  iptables -I INPUT -p tcp -s 192.168.10.5 --dport 80 -j REJECT
  iptables -L
  iptables -A INPUT -p tcp --dport 1000:1024 -j REJECT
  iptables -A INPUT -p udp --dport 1000:1024 -j REJECT
  iptables -L
  service iptables save # 配置防火墙策略永久生效，执行保存命令
  ```
* firewalld
  ```shell
  firewall-cmd --get-default-zone # --get-default-zone 查询默认区域名称
  firewall-cmd --get-zone-of-interface=eno16777736 # --get-zone-of-interface 查询网卡在firewalld服务中区域
  firewall-cmd --permanent --zone=external --change-interface=eno16777736 # --change-interface 将某个网卡与区域关联
  firewall-cmd --get-zone-of-interface=eno16777736
  firewall-cmd --permanent --get-zone-of-interface=eno16777736 # --permanent 永久生效
  firewall-cmd --set-default-zone=public # --set-default-zone 设置默认区域，并使其永久生效
  firewall-cmd --get-default-zone
  firewall-cmd --panic-on # --panic-on 开启应急状况模式
  firewall-cmd --panic-off # --panic-off 关闭应急状态模式
  firewall-cmd --zone=public --query-service=ssh
  firewall-cmd --zone=public --query-service=https
  firewall-cmd --zone=public --add-service=https # --add-service设置默认区域允许该服务的
  firewall-cmd --permanent --zone=public --add-service=https
  firewall-cmd --reload # --reload 让永久模式配置规则立即生效并覆盖当前配置规则
  firewall-cmd --permanent --zone=public --remove-service=http # --remove-service 设置默认区域不再允许该服务的流量
  firewall-cmd --reload
  firewall-cmd --zone=public --add-port=8080-8081/tcp # --add-port 设置默认区域允许该端口的流量
  firewall-cmd --zone=public --list-ports # --list-ports 
  firewall-cmd --permanent --zone=public --add-forward-port=port=888:proto=tcp:toport=22:toaddr=192.168.10.10
  # 将访问本机888端口的流量转发到22端口
  firewall-cmd --reload
  ssh -p 888 192.168.10.10
  firewall-cmd --permanent --zone=public --add-rich-rule="rule family="ipv4" source address="192.168.10.0/24" service name="ssh" reject" 
  # 富规则，拒绝192.168.10.0/24网段所有用户访问本机ssh服务
  firewall-cmd --reload
  ssh 192.168.10.10
  
  # 图形化管理工具
  # firewall-config
  ```
* 服务的访问控制
  ```shell
  vim /etc/hosts.deny
    >sshd:*
  vim /etc/hosts.allow
    >sshd:192.168.10.
  ssh 192.168.10.10
  ```

# 第9章 使用ssh服务管理远程主机
* 配置网络服务
  ```shell
  # 配置网络参数
  nmtui
  vim /etc/sysconfig/network-scripts/ifcfg-eno16777736
  systemctl restart network
  ping -c 4 192.168.10.10
  # 创建网络会话
  nmcli connection show
  nmcli con show eno16777736
  nmcli connection add con-name company ifname eno16777736 autoconnect no type ethernet ip4 192.168.10.10/24 gw4 192.168.10.1
  nmcli connection add con-name house type ethernet ifname eno16777736
  nmcli connection show
  nmcli connection up house
  ifconfig
  # 绑定两块网卡 ？存在问题

  # 网上方法 https://www.cnblogs.com/hukey/p/12931673.html
  nmcli dev
  nmcli con
  nmcli con add type bond ifname bond0 con-name bond0 mode 1 ipv4.method manual ipv4.address 192.168.52.10/24 ipv4.gateway 192.168.52.1 ipv4.dns 114.114.114.114
  # IP前三个字段要相同
  nmcli con add type bond-slave ifname ens33 con-name bond1-port1 master bond0
  nmcli con add type bond-slave ifname ens36 con-name bond1-port2 master bond0
  ll /etc/sysconfig/network-scripts/ifcfg-*
  nmcli con
  cd /etc/sysconfig/network-scripts/	
  sed -i '/BONDING_OPTS/d' ifcfg-bond0
  echo 'BONDING_OPTS="miimon=100 mode=1 fail_over_mac=1"' >> ifcfg-bond0
  # 如果是虚拟机，fail_over_mac=1 是必须要带上的，否则vmware会出现告警信息，配置起来能正常用，但是在进行准备切换时，是无法进行的。
  # 在vmware 虚拟机环境中，常用的三种方式（mode-0 mode-1 mode-6） 只有 mode 1 实现了故障切换。
  systemctl restart network
  cat /proc/net/bonding/bond0
  # 在物理主机上 ping -t 192.168.52.10 
  ifdown ens33
  cat /proc/net/bonding/bond0
  ```
* 远程控制服务
  ```shell
  # 配置sshd服务
  vim /etc/ssh/sshd_config # sshd服务配置信息
  ssh 192.168.10.10 # 客户端登录服务器
  exit # 客户端登录服务器
  vim /etc/ssh/sshd_config
    >PermitRootLogin no
  systemctl restart sshd
  systemctl enable sshd
  ssh 192.168.10.10 # 客户端登录服务器

  # 安全密钥验证
  ssh-keygen # 客户端生成密钥对
  ssh-copy-id 192.168.10.10 # 把客户端主机生成的公钥文件传输到远程主机
  vim /etc/ssh/sshd_config # 对服务器进行配置，只允许密钥验证，拒绝传统的口令验证
    >PasswordAuthentication no
  systemctl restart sshd
  ssh 192.168.10.10 # 客户端登录服务器

  # 远程传输命令
  echo "Welcome to LinuxProbe.Com" > readme.txt
  scp /root/readme.txt 192.168.10.20:/home # 传输文件 -v 显示详细的连接进度 -r 传送文件夹 -P 指定远程主机的sshd端口号
  scp 192.168.10.20:/etc/redhat-release /root # 下载文件
  cat redhat-release
  ```
* 不间断回话服务
  ```shell
   # 管理远程会话
  screen -S backup # -S 创建会话窗口/指定作业名称 -d 指定会话离线处理 -r 恢复指定会话 -x 一次性恢复所有会话 
  screen -ls # -ls 显示当前已有会话 -wipe 把目前无法使用的会话删除
  exit # 退出会话
  screen vim memo.txt
  screen -S linux
  tail -f /var/log/messages
  screen -ls
  screen -r linux
  tail -f /var/log/messages
  # 不再使用某个会话窗口，设置为临时断开（detach）模式，随后在需要时再重新连接（attach）回来即可。这段时间内，会话窗口运行的程序会继续执行
  screen -S name -X quit # 删除会话 -X 在指定会话中作为屏幕命令执行

  # 会话共享功能
  ssh 192.168.10.10 # 终端A
  screen -S linuxprobe # 终端A
  ssh 192.168.10.10 # 终端B
  screen -x # 终端B
  ```

# 第10章 使用Apache服务部署静态网站
* 网站服务程序
  ```shell
  yum install httpd
  systemctl start httpd
  systemctl enable httpd
  firefox # 地址栏输入 http://127.0.0.1
  ```
* 配置服务文件参数
  ```shell
  /etc/httpd # 服务目录
  /etc/httpd/conf/httpd.conf # 主配置文件
  /var/www/html # 网站数据目录
  /var/log/httpd/access_log # 访问日志
  /var/log/httpd/error_log # 错误日志
  echo "Welcome to LinuxProbe.Com" > /var/www/html/index.html
  firefox # 地址栏输入 http://127.0.0.1
  mkdir /home/wwwroot
  echo "The New Web Directory" > /home/wwwroot/index.html
  vim /etc/httpd/conf/httpd.conf
    >DocumentRoot "/home/wwwroot"
    ><Directory "/home/wwwroot">
  systemctl restart httpd
  firefox # 地址栏输入 http://127.0.0.1 默认首页
  ```
* SELinux安全子系统
  ```shell
  vim /etc/selinux/config
    >SELINUX=enforcing
  getenforce # 获取当前SELinux服务运行状态
  setenforce 0 # 修改SELinux运行模式 0为禁用 1为启用
  getenforce
  firefox # 地址栏输入 http://127.0.0.1 正常网页内容
  setenforce 1
  ls -Zd /var/www/html # -Z 显示文件安全上下文
  ls -Zd /home/wwwroot
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot # 管理SELinux策略 -a 添加
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot/*
  restorecon -Rv /home/wwwroot/
  firefox # 地址栏输入 http://127.0.0.1 正常网页内容
  ```
* 个人用户主页功能
  ```shell
  vim /etc/httpd/conf.d/userdir.conf
    ># UserDir disabled
    >  UserDir public_html
  su - linuxprobe
  mkdir public_html
  echo "This is linuxprobe's website" > public_html/index.html
  chmod -Rf 755 /home/linuxprobe
  systemctl restart httpd
  firefox # 地址栏输入 http://127.0.0.1/~qingteng 报错
  getsebool -a | grep http
    >httpd_enable_homedirs-->off
  setsebool -P httpd_enable_homedirs=on # -P 修改后的SELinux策略规则永久生效且立即生效
  firefox # 地址栏输入 http://127.0.0.1/~qingteng 正常访问
  htpasswd -c /etc/httpd/passwd linuxprobe # 生成密码数据库 -c 第一次生成
  vim /etc/httpd/conf.d/userdir.conf
    # 刚刚生成出来的密码验证文件保存路径
    >authuserfile "/etc/httpd/passwd"
    # 当用户尝试访问个人用户网站时的提示信息
    >authname "My privately website"
    >authtype basic
    # 用户进行账户密码登录时需要验证的用户名称
    >require user linuxprobe
  systemctl restart httpd
  firefox # 地址栏输入 http://127.0.0.1/~qingteng 加密访问
  ```
* 虚拟主机功能
  ```shell
  # 基于IP地址
  nmtui
    >192.168.10.10/24
    >192.168.10.20/24
    >192.168.10.30/24
  systemctl restart network
  ping 192.168.10.10
  ping 192.168.10.20
  ping 192.168.10.30
  mkdir -p /home/wwwroot/10
  mkdir -p /home/wwwroot/20
  mkdir -p /home/wwwroot/30
  echo "IP:192.168.10.10" > /home/wwwroot/10/index.html
  echo "IP:192.168.10.20" > /home/wwwroot/20/index.html
  echo "IP:192.168.10.30" > /home/wwwroot/30/index.html
  vim /etc/httpd/conf/httpd.conf
    ><VirtualHost 192.168.10.10>
    >DocumentRoot /home/wwwroot/10
    >ServerName www.linuxprobe.com
    ><Directory /home/wwwroot/10 >
    >AllowOverride None
    >Require all granted
    ></Directory>
    ></VirtualHost>
    ><VirtualHost 192.168.10.20>
    >DocumentRoot /home/wwwroot/20
    >ServerName www.linuxprobe.com
    ><Directory /home/wwwroot/20 >
    >AllowOverride None
    >Require all granted
    ></Directory>
    ></VirtualHost>
    ><VirtualHost 192.168.10.30>
    >DocumentRoot /home/wwwroot/30
    >ServerName www.linuxprobe.com
    ><Directory /home/wwwroot/30 >
    >AllowOverride None
    >Require all granted
    ></Directory>
    ></VirtualHost>
  systemctl restart httpd
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot/10
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot/10/*
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot/20
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot/20/*
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot/30
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot/30/*
  restorecon -Rv /home/wwwroot
  firefox # 地址栏输入 192.168.10.10/192.168.10.20/192.168.10.30

  # 基于主机域名
  vim /etc/hosts
    >192.168.10.10 www.linuxprobe.com bbs.linuxprobe.com tech.linuxprobe.com
  ping -c 4 www.linuxprobe.com
  mkdir -p /home/wwwroot/www
  mkdir -p /home/wwwroot/bbs
  mkdir -p /home/wwwroot/tech
  echo "WWW.linuxprobe.com" > /home/wwwroot/www/index.html
  echo "BBS.linuxprobe.com" > /home/wwwroot/bbs/index.html
  echo "TECH.linuxprobe.com" > /home/wwwroot/tech/index.html
  vim /etc/httpd/conf/httpd.conf
    ><VirtualHost 192.168.10.10>
    >DocumentRoot "/home/wwwroot/www"
    >ServerName "www.linuxprobe.com"
    ><Directory "/home/wwwroot/www">
    >AllowOverride None
    >Require all granted
    ></Directory>
    ></VirtualHost>
    ><VirtualHost 192.168.10.10>
    >DocumentRoot "/home/wwwroot/bbs"
    >ServerName "bbs.linuxprobe.com"
    ><Directory "/home/wwwroot/bbs">
    >AllowOverride None
    >Require all granted
    ></Directory>
    ></VirtualHost>
    ><VirtualHost 192.168.10.10>
    >DocumentRoot "/home/wwwroot/tech"
    >ServerName "tech.linuxprobe.com"
    ><Directory "/home/wwwroot/tech">
    >AllowOverride None
    >Require all granted
    ></Directory>
    ></VirtualHost>
  systemctl restart httpd
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot/www
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot/www/*
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot/bbs
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot/bbs/*
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot/tech
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot/tech/*
  restorecon -Rv /home/wwwroot
  firefox # 地址栏输入 www.linuxprobe.com/bbs.linuxprobe.com/tech.linuxprobe.com

  # 基于端口号
  mkdir -p /home/wwwroot/6111
  mkdir -p /home/wwwroot/6222
  echo "port:6111" > /home/wwwroot/6111/index.html
  echo "port:6222" > /home/wwwroot/6222/index.html
  vim /etc/httpd/conf/httpd.conf
    >Listen 6111
    >Listen 6222

    ><VirtualHost 192.168.10.10:6111>
    >DocumentRoot "/home/wwwroot/6111"
    >ServerName www.linuxprobe.com
    ><Directory "/home/wwwroot/6111">
    >AllowOverride None
    >Require all granted
    ></Directory>
    ></VirtualHost>
    ><VirtualHost 192.168.10.10:6222>
    >DocumentRoot "/home/wwwroot/6222"
    >ServerName bbs.linuxprobe.com
    ><Directory "/home/wwwroot/6222">
    >AllowOverride None
    >Require all granted
    ></Directory>
    ></VirtualHost>
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot/6111
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot/6111/*
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot/6222
  semanage fcontext -a -t httpd_sys_content_t /home/wwwroot/6222/*
  restorecon -Rv /home/wwwroot
  systemctl restart httpd # 报错
  semanage port -l | grep http
  semanage port -a -t http_port_t -p tcp 6111
  semanage port -a -t http_port_t -p tcp 6222
  semanage port -l | grep http
  systemctl restart httpd
  firefox # 地址栏输入 192.168.10.10:6111/192.168.10.10:6222
  ```
* Apache的访问控制
  ```shell
  mkdir /var/www/html/server
  echo "Successful" > /var/www/html/server/index.html
  vim /etc/httpd/conf/httpd.conf
    ><Directory "/var/www/html/server">
    >Order allow,deny
    >Allow from 192.168.10.20
    ></Directory>
  systemctl restart httpd
  firefox # 地址栏输入 192.168.10.10/server/ 被拒绝
  ```

# 第11章 使用vsftpd服务传输文件
* 文件传输协议
  ```shell
  yum install vsftpd
  iptables -F
  iptables-save
  firewall-cmd --permanent --zone=public --add-service=ftp
  firewall-cmd --reload
  mv /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf_bak
  grep -v "#" /etc/vsftpd/vsftpd.conf_bak > /etc/vsftpd/vsftpd.conf
  cat /etc/vsftpd/vsftpd.conf
  ```
* vsftpd服务程序
  ```shell
  # 匿名开放模式
  vim /etc/vsftpd/vsftpd.conf
    >anonymous_enable=YES
    >anon_umask=022
    >anon_upload_enable=YES
    >anon_mkdir_write_enable=YES
    >anon_other_write_enable=YES
  systemctl restart vsftpd
  systemctl enable vsftpd
  ftp 192.168.10.10 # 客户端
    >anonymous
    > # 密码按回车
    ftp>cd pub
    ftp>mkdir files # 拒绝创建
  ls -ld /var/ftp/pub
  chown -Rf ftp /var/ftp/pub
  ls -ld /var/ftp/pub
  ftp 192.168.10.10 # 客户端
    >anonymous
    > # 密码按回车
    ftp>cd pub
    ftp>mkdir files # 创建失败
  getsebool -a | grep ftp
    >ftpd_full_access-->off
  setsebool -P ftpd_full_access=on
  ftp 192.168.10.10 # 客户端
    >anonymous
    > # 密码按回车
    ftp>cd pub
    ftp>mkdir files
    ftp>rename files database
    ftp>rmdir database
    ftp>exit
  
  # 本地用户模式
  vim /etc/vsftpd/vsftpd.conf
    >anonymous_enable=NO
    >local_enable=YES
    >write_enable=YES
    >local_umask=022
  systemctl restart vsftpd
  systemctl enable vsftpd
  ftp 192.168.10.10 # 客户端
    >root # 登陆失败
  vim /etc/vsftpd/user_list
    ># root
  vim /etc/vsftpd/ftpusers
    ># root
  ftp 192.168.10.10 # 客户端
    >linuxprobe
    >
    ftp>mkdir files
  getsebool -a | grep ftp
    >ftpd_full_access-->off
  setsebool -P ftpd_full_access=on
  ftp 192.168.10.10 # 客户端
    >linuxprobe
    >
    ftp>cd pub
    ftp>mkdir files
    ftp>rename files database
    ftp>rmdir database
    ftp>exit
  
  # 虚拟用户模式
  cd /etc/vsftpd
  vim vuser.list # 奇数账号 偶数密码
    >zhangsan
    >redhat
    >lisi
    >redhat
  db_load -T -t hash -f vuser.list vuser.db # 生成数据库文件 -T 允许应用程序将文本文件转译载入进数据库 -t 使用hash码加密
  file vuser.db
  chmod 600 vuser.db
  rm -f vuser.list
  useradd -d /var/ftproot -s /sbin/nologin virtual
  ls -ld /var/ftproot
  chmod -Rf 755 /var/ftproot
  vim /etc/pam.d/vsftpd.vu
    >auth required pam_userdb.so db=/etc/vsftpd/vuser
    >account required pam_userdb.so db=/etc/vsftpd/vuser
  vim /etc/vsftpd/vsftpd.conf
    >anonymous_enable=NO
    >local_enable=YES
    >guest_enable=YES
    >guest_username=virtual
    >allow_writeable_chroot=YES
    >pam_service_name=vsftpd.vu
  mkdir /etc/vsftpd/vusers_dir/
  cd /etc/vsftpd/vusers_dir/
  touch lisi
  vim zhangsan
    >anon_upload_enable=YES
    >anon_mkdir_write_enable=YES
    >anon_other_write_enable=YES
  vim /etc/vsftpd/vsftpd.conf
    >user_config_dir=/etc/vsftpd/vusers_dir
  systemctl restart vsftpd
  systemctl enable vsftpd
  getsebool -a | grep ftp
    >ftpd_full_access-->off
  setsebool -P ftpd_full_access=on
  ftp 192.168.10.10 # 客户端
    >lisi
    >redhat
    ftp>mkdir files # 拒绝
    ftp>exit
  ftp 192.168.10.10 # 客户端
    >zhangsan
    >redhat
    ftp>mkdir files
    ftp>rename files database
    ftp>rmdir database
    ftp>exit
  ```
* 简单文件传输协议
  ```shell
  yum install tftp-server tftp
  vim /etc/xinetd.d/tftp
    >disable = no
  systemctl restart tftp
  systemctl enable tftp
  yum install xinetd
  systemctl restart xinetd
  systemctl enable xinetd
  firewall-cmd --permanent --add-port=69/udp
  firewall-cmd --reload
  echo "i love linux" > /var/lib/tftpboot/readme.txt
  tftp 192.168.10.10 # 客户端
    tftp>get readme.txt
    tftp>quit
  ls
  cat readme.txt 
  ```

# 第12章 使用Samba或NFS实现文件共享
* Samba文件共享服务
  ```shell
  yum install samba
  cat /etc/samba/smb.conf
  mv /etc/samba/smb.conf /etc/samba/smb.conf.bak
  cat /etc/samba/smb.conf.bak | grep -v "#" | grep -v ";" | grep -v "^$" > /etc/samba/smb.conf
  cat /etc/samba/smb.conf

  # 配置共享资源
  id linuxprobe
  pdbedit -a -u linuxprobe # 管理SMB服务程序的账户信息数据库 -a 建立Samba账户
  mkdir /home/database
  chown -Rf linuxprobe:linuxprobe /home/database
  semanage fcontext -a -t samba_share_t /home/database
  restorecon -Rv /home/database
  getsebool -a | grep samba
    >samba_enable_home_dirs-->off
  setsebool -P samba_enable_home_dirs on
  vim /etc/samba/smb.conf
    >[global]
    >workgroup = MYGROUP
    >server string = Samba Server Version %v
    >log file = /var/log/samba/log.%m
    >max log size = 50
    >security = user
    >passdb backend = tdbsam
    >load printers = yes
    >cups options = raw
    >[database]
    >comment = Do not arbitrarily modify the database file
    >path = /home/database
    >public = no
    >writable = yes
  systemctl restart smb
  systemctl enable smb
  iptables -F
  iptables-save

  # Windows访问文件共享服务
  \\192.168.10.10 # Windows运行命令框输入
  # 问题解决办法
  firewall-cmd --permanent --zone=public --add-service=samba
  firewall-cmd --reload

  # Linux访问文件共享服务
  yum install cifs-utils # Linux客户端
  mkdir /database
  mount -t cifs -o username=linuxprobe,password=redhat //192.168.10.10/database /database
  df -h
  vim auth.smb
    >username=linuxprobe
    >password=redhat
    >domain=MYGROUP
  chmod 600 auth.smb
  vim /etc/fstab # Linux客户端
    >//192.168.10.10/database /database cifs credentials=/root/auth.smb 0 0
  mount -a
  cat /database/Memo.txt
  ```
* NFS（网络文件系统）
  ```shell
  yum install nfs-utils
  iptables -F # 服务器
  iptables-save
  mkdir /nfsfile
  chmod -Rf 777 /nfsfile
  echo "welcome to linuxprobe.com" > /nfsfile/readme
  vim /etc/exports
    >/nfsfile 192.168.10.*(rw,sync,root_squash)
  systemctl restart rpcbind
  systemctl enable rpcbind
  systemctl restart nfs-server
  systemctl enable nfs-server
  showmount -e 192.168.10.10 # 客户端 showmount 查询NFS服务器远程信息 -e 显示NFS服务器共享列表
  mkdir /nfsfile
  mount -t nfs 192.168.10.10:/nfsfile /nfsfile
  cat /nfsfile/readme
  vim /etc/fstab
    >192.168.10.10:/nfsfile /nfsfile nfs defaults 0 0
  ```
* autofs自动挂载服务
  ```shell
  yum install autofs # 客户端
  vim /etc/auto.master
    >/media /etc/iso.misc
  vim /etc/iso.misc
    >iso -fstype=iso9660,ro,nosuid,nodev :/dev/cdrom
  systemctl start autofs
  systemctl enable autofs
  df -h
  cd /media
  ls
  cd iso
  ls -l
  df -h
  ```

# 第13章 使用BIND提供域名解析服务
* DNS域名解析服务
* 安装bind服务程序
  ```shell
  yum install bind-chroot
  vim /etc/named.conf
    11>listen-on port 53 { any; };
    17>allow-query { any; };
  named-checkconf # 检查主配置文件中语法或参数错误
  named-checkzone # 检查数据配置文件中语法或参数错误

  # 正向解析实验
  vim /etc/named.rfc1912.zones
    >zone "linuxprobe.com" IN {
    >type master;
    >file "linuxprobe.com.zone";
    >allow-update {none;};
    >};
  cd /var/named/
  ls -al named.localhost
  cp -a named.localhost linuxprobe.com.zone # -a保留原始文件所有者、所属组、权限属性等信息
  vim linuxprobe.com.zone # 注意后面加点.
  systemctl restart named
  # DNS地址改为本地地址
  systemctl restart network
  nslookup
    >www.linuxprobe.com
    >bbs.linuxprobe.com

  # 反向解析实验
  vim /etc/named.rfc1912.zones
    >zone "linuxprobe.com" IN {
    >type master;
    >file "linuxprobe.com.zone";
    >allow-update {none;};
    >};
    >zone "10.168.192.in-addr.arpa" IN {
    >type master;
    >file "192.168.10.arpa";
    >};
  cp -a named.loopback 192.168.10.arpa
  vim 192.168.10.arpa
  systemctl restart named
  nslookup
    >192.168.10.10
    >192.168.10.20
  ```
* 部署从服务器
  ```shell
  vim /etc/named.rfc1912.zones # 主服务器
    >zone "linuxprobe.com" IN {
    >type master;
    >file "linuxprobe.com.zone";
    >allow-update { 192.168.10.20; };
    >};
    >zone "10.168.192.in-addr.arpa" IN {
    >type master;
    >file "192.168.10.arpa";
    >allow-update { 192.168.10.20; };
    >};
  systemctl restart named
  iptables -F
  firewall-cmd --permanent --zone=public --add-service=dns
  firewall-cmd --reload
  vim /etc/named.rfc1912.zones # 从服务器
    >zone "linuxprobe.com" IN {
    >type slave;
    >masters { 192.168.10.10; };
    >file "slaves/linuxprobe.com.zone";
    >};
    >zone "10.168.192.in-addr.arpa" IN {
    >type slave;
    >masters { 192.168.10.10; };
    >file "slaves/192.168.10.arpa";
    >};
  systemctl restart named
  # 从服务器DNS地址改为本地地址 nmtui/nmcli connection up ens33/systemctl restart network
  cd /var/named/slaves
  ls
  nslookup
    >www.linuxprobe.com
    >192.168.10.10
  ```
* 安全的加密传输
  ```shell
   ls -al /var/named/slaves/ # 从服务器
   dnssec-keygen -a HMAC-MD5 -b 128 -n HOST master-slave # 生成DNS服务密钥 -a 指定加密算法 -b 密钥长度 -n 密钥类型
   ls -al Kmaster-slave.+157+46845.*
   cat Kmaster-slave.+157+46845.private
    >Key: NI6icnb74FxHx2gK+0MVOg==
  cd /var/named/chroot/etc/ # 主服务器
  vim transfer.key
    >key "master-slave" {
    >algorithm hmac-md5;
    >secret "NI6icnb74FxHx2gK+0MVOg=="; # Ge6laOJM2nLVqcdTJ1sKIQ==
    >};
  chown root:named transfer.key
  chmod 640 transfer.key
  ln transfer.key /etc/transfer.key
  vim /etc/named.conf
    9>include "/etc/transfer.key";
    18>allow-transfer { key master-slave; };
  systemctl restart named
  rm -rf /var/named/slaves/* # 从服务器
  systemctl restart named
  ls /var/named/slaves/
  cd /var/named/chroot/etc
  vim transfer.key
    >key "master-slave" {
    >algorithm hmac-md5;
    >secret "NI6icnb74FxHx2gK+0MVOg==";
    >};
  chown root:named transfer.key
  chmod 640 transfer.key
  ln transfer.key /etc/transfer.key
  vim /etc/named.conf
    9>include "/etc/transfer.key";
    43>server 192.168.10.10
    44>{
    45>keys { master-slave; };
    46>};
  systemctl restart named
  ls /var/named/slaves/
  ```
* 部署缓存服务器
  ```shell
  vim /etc/named.conf # 缓存服务器
    17>forwarders { 210.73.64.1; }; # 180.76.76.76
  systemctl restart named
  iptables -F
  iptables-save
  firewall-cmd --permanent --zone=public --add-service=dns
  firewall-cmd --reload
  # 客户端DNS服务器地址参数修改为DNS缓存服务器IP地址192.168.10.10
  nmcli connection up ens160
  nslookup
    >www.linuxprobe.com
    >8.8.8.8
  ```
* 分离解析技术
  ```shell
  # 服务端配置两块仅主机模式的网卡，IP地址分别设为122.71.115.10与106.185.25.10
  vim /etc/named.conf
    51>zone "." IN { # 删除
    52>type hint;
    53>file "named.ea";
    54>};
  vim /etc/named.rfc1912.zones
    >acl "china" { 122.71.115.0/24; };
    >acl "american" { 106.185.25.0/24; };
    >view "china"{
    >    match-clients { "china"; };
    >    zone "linuxprobe.com" {
    >    type master;
    >    file "linuxprobe.com.china";
    >    };
    >};
    >view "american" {
    >    match-clients { "american"; };
    >    zone "linuxprobe.com" {
    >    type master;
    >    file "linuxprobe.com.american";
    >    };
    >};
  cd /var/named
  cp -a named.localhost linuxprobe.com.china
  cp -a named.localhost linuxprobe.com.american
  vim linuxprobe.com.china
  vim linuxprobe.com.american
  systemctl restart named
  # 客户端主机IP地址分别设为122.71.115.1与106.185.25.1,DNS地址分设为服务器主机的两个IP地址
  nslookup www.linuxprobe.com # 客户端 模拟中国用户
  nslookup www.linuxprobe.com # 客户端 模拟美国用户
  ```

# 第14章 使用DHCP动态管理主机地址
* 动态主机配置协议
* 部署dhcpd服务程序
  ```shell
  yum install dhcp
  cat /etc/dhcp/dhcpd.conf
  ```
* 自动管理IP地址
  ```shell
  # 将虚拟机自带的DHCP功能关闭 客户端与服务器处在同一网络模式-仅主机模式
  vim /etc/dhcp/dhcpd.conf # 服务器
    >ddns-update-style none;
    >ignore client-updates;
    >subnet 192.168.10.0 netmask 255.255.255.0 {
    >    range 192.168.10.50 192.168.10.150;
    >    option subnet-mask 255.255.255.0;
    >    option routers 192.168.10.1;
    >    option domain-name "linuxprobe.com";
    >    option domain-name-servers 192.168.10.1;
    >    default-lease-time 21600;
    >    max-lease-time 43200;
    >}
  systemctl start dhcpd
  systemctl enable dhcpd
  firewall-cmd --zone=public --permanent --add-service=dhcp
  firewall-cmd --reload
  systemctl restart network # 客户端
  ifconfig
    >192.168.10.50
  ```
* 分配固定IP地址
  ```shell
  tail -f /var/log/messages # 服务器 查看日志文件，获取主机MAC地址
  vim /etc/dhcp/dhcpd.conf
    >ddns-update-style none;
    >ignore client-updates;
    >subnet 192.168.10.0 netmask 255.255.255.0 {
    >    range 192.168.10.50 192.168.10.150;
    >    option subnet-mask 255.255.255.0;
    >    option routers 192.168.10.1;
    >    option domain-name "linuxprobe.com";
    >    option domain-name-servers 192.168.10.1;
    >    default-lease-time 21600;
    >    max-lease-time 43200;
    >host linuxprobe {
    >hardware ethernet 00:0c:29:dd:f2:22;
    >fixed-address 192.168.10.88;
    >}
    >}
  systemctl restart dhcpd
  systemctl restart network # 客户端
  ifconfig
    >192.168.10.88
  ```

# 第15章 使用Postfix与Dovecot部署邮件系统
* 电子邮件系统
* 部署基本的电子邮件系统
  ```shell
  vim /etc/hostname
    >mail.linuxprobe.com
  hostnamectl set-hostname mail.linuxprobe.com
  hostname
  iptables -F
  iptables-save
  firewall-cmd --permanent --zone=public --add-service=dns
  firewall-cmd --reload
  vim /etc/named.conf
    11>listen-on port 53 { any; };
    17>allow-query { any; };
  vim /etc/named.rfc1912.zones
    >zone "linuxprobe.com" IN {
    >type master;
    >file "linuxprobe.com.zone";
    >allow-update {none;};
    >};
  cp -a /var/named/named.localhost /var/named/linuxprobe.com.zone
  vim /var/named/linuxprobe.com.zone
  systemctl restart named
  systemctl enable named
  # 服务器DNS改为本地IP IP 192168.10.10/24 DNS 192.168.10.10
  nmcli connection up ens160
  ping -c 4 mail.linuxprobe.com 

  # 配置Postfix服务程序
  yum install postfix
  vim /etc/postfix/main.cf
    76>myhostname = mail.linuxprobe.com
    83>mydomain = linuxprobe.com
    99>myorigin = $mydomain
    116>inet_interfaces = all
    164>mydestination = $myhostname , $mydomain
  useradd boss
  echo "linuxprobe" | passwd --stdin boss
  systemctl restart postfix
  systemctl enable postfix

  # 配置Dovecot服务程序
  yum install dovecot
  vim /etc/dovecot/dovecot.conf
    24>protocols = imap pop3 lmtp
    25>disable_plaintext_auth = no
    48>login_trusted_networks = 192.168.10.0/24
  vim /etc/dovecot/conf.d/10-mail.conf
    24>mail_location = mbox:~/mail:INBOX=/var/mail/%u
  su - boss
  mkdir -p mail/.imap/INBOX
  exit
  systemctl restart dovecot
  systemctl enable dovecot
  firewall-cmd --permanent --zone=public --add-service=imap
  firewall-cmd --permanent --zone=public --add-service=pop3
  firewall-cmd --permanent --zone=public --add-service=smtp
  firewall-cmd --reload

  # 测试电子邮件系统
  # 客户端 Linux下安装Thunderbird yum install thunderbird
  mail
    &>3
    &>quit
  ```
* 设置用户别名信箱
  ```shell
  su - bin
  mail
    &>4
    &>quit
  cat /etc/aliases
  vim /etc/aliases
    >xxoo: root
  newaliases
  mail
    &>5
  ```

# 第16章 使用Squid部署代理缓存服务
* 代理缓存服务
* 配置Squid服务程序
  ```shell
  ping www.linuxprobe.com # 服务器
  yum install squid
  ```
* 正向代理
  ```shell
  # 标准正向代理
  systemctl restart squid # 服务器
  systemctl enable squid
  # 客户端浏览器设置代理 192.168.10.10 3128
  vim /etc/squid/squid.conf # 服务器
    59>http_port 10000
  systemctl restart squid
  systemctl enable squid
  semanage port -l | grep squid_port_t
  semanage port -a -t squid_port_t -p tcp 10000
  semanage port -l | grep squid_port_t
  # 客户端浏览器设置代理 192.168.10.10 10000

  # ACL访问控制
  # 只允许192.168.10.20客户端使用服务器上Squid服务程序提供的代理服务，禁止其他所有主机代理请求
  vim /etc/squid/squid.conf
    26>acl client src 192.168.10.20
    31>http_access allow client
    32>http_access deny all
  systemctl restart squid
  # 禁止所有客户端访问包含linux关键词的网站
  vim /etc/squid/squid.conf
    26>acl deny_keyword url_regex -i linux
    31>http_access deny deny_keyword
  systemctl restart squid
  # 禁止所有客户端访问某个特定的网站
  vim /etc/squid/squid.conf
    26>acl deny_url url_regex www.linuxcool.com
    31>http_access deny deny_url
  systemctl restart squid
  # 禁止员工在企业内网内部下载带有某些后缀的文件
  vim /etc/squid/squid.conf
    26>acl badfile urlpath_regex -i \.rar$ \.avi$ # https无法限制
    31>http_access deny badfile
  systemctl restart squid

  # 透明正向代理
  # 配置客户端网卡参数 清除代理信息 客户端不可以访问网络
  ping www.linuxprobe.com
  iptables -F # 服务器
  iptables -t nat -A POSTROUTING -p udp --dport 53 -o ens36 -j MASQUERADE # 内网卡
  echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
  sysctl -p
  ping www.linuxprobe.com # 客户端
  vim /etc/squid/squid.conf # 服务器
    59>http_port 3128 transparent
    62>cache_dir ufs /var/spool/squid 100 16 256
  squid -k parse # 检查主配置文件是否有错误
  squid -z # 透明代理技术初始化
  systemctl restart squid
  iptables -t nat -A PREROUTING -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 3128
  iptables -t nat -A POSTROUTING -s 192.168.20.0/24 -o ens36 -j SNAT --to 192.168.3.17
  iptables-save
  # 客户端可以访问网络 ？ACL不生效
  ```
* 反向代理
  ```shell
  vim /etc/squid/squid.conf # ?未成功
    59>http_port 桥接网卡IP地址:80 vhost
    60>cache_peer 网站源服务器IP地址 parent 80 0 originserver
  systemctl restart squid
  ```

# 第17章 使用iSCSI部署网络存储
* iSCSI技术概览
* 创建RAID磁盘阵列
  ```shell
  # 虚拟机添加4块新磁盘，创建RAID5磁盘阵列和备份盘
  mdadm -Cv /dev/md0 -n 3 -l 5 -x 1 /dev/sdb /dev/sdc /dev/sdd /dev/sde
  mdadm -D /dev/md0
    >UUID:fdd4f45b:2a168a96:c9ed323e:711c5835
  ```
* 配置iSCSI服务器
  ```shell
  yum -y install targetd targetcli # 服务端
  systemctl restart targetd
  systemctl enable targetd
  targetcli
    >ls
    >cd /backstores/block
    >create disk0 /dev/md0
    >cd /
    >ls
    >cd iscsi
    >create
    >ls
    >cd iqn.2003-01.org.linux-iscsi.qingteng.x8664:sn.f0ae48c0ac2d/
    >ls
    >cd tpg1/luns
    >create /backstores/block/disk0 
    >cd ..
    >cd acls
    >create iqn.2003-01.org.linux-iscsi.qingteng.x8664:sn.f0ae48c0ac2d:client
    >cd ..
    >cd portals
    >ls
    >delete 0.0.0.0 3260
    >create 192.168.20.10
    >cd /
    >ls
    >exit
  systemctl restart targetd
  iptables -F
  iptables-save
  firewall-cmd --permanent --add-port=3260/tcp
  firewall-cmd --reload
  ```
* 配置Linux客户端
  ```shell
  yum install iscsi-initiator-utils
  vim /etc/iscsi/initiatorname.iscsi
    >InitiatorName=iqn.2003-01.org.linux-iscsi.qingteng.x8664:sn.f0ae48c0ac2d:client
  systemctl restart iscsid
  systemctl enable iscsid
  iscsiadm -m discovery -t st -p 192.168.20.10
    >192.168.20.10:3260,1 iqn.2003-01.org.linux-iscsi.qingteng.x8664:sn.f0ae48c0ac2d
  iscsiadm -m node -T iqn.2003-01.org.linux-iscsi.qingteng.x8664:sn.f0ae48c0ac2d -p 192.168.20.10 --login
  ls -l /dev/sdb
  file /dev/sdb
  mkfs.xfs /dev/sdb
  mkdir /iscsi
  mount /dev/sdb /iscsi/
  df -h
  blkid | grep /dev/sdb
    >/dev/sdb: UUID="525d2ea1-49fb-4c38-81ad-4f029d46b337" TYPE="xfs"
  vim /etc/fstab
    >UUID="525d2ea1-49fb-4c38-81ad-4f029d46b337" /iscsi xfs defaults,_netdev 0 0
  iscsiadm -m node -T iqn.2003-01.org.linux-iscsi.qingteng.x8664:sn.f0ae48c0ac2d -u
  ```
* 配置Windows客户端
  ```shell
  # 控制面板->系统与安全->Windows工具->iSCSI发起程序
  ```

# 第18章 使用MariaDB数据库管理系统
* 数据库管理系统
* 初始化MariaDB服务
  ```shell
  yum install -y mariadb mariadb-server
  systemctl start mariadb
  systemctl enable mariadb
  mysql_secure_installation
    > # 当前数据库密码为空，直接按回车
    >y
    > # 输入密码
    > # 再次输入密码
    >y # 删除匿名账号
    >y # 禁止root管理员远程登录
    >y # 删除test数据库并取消对它的访问权限
    >y # 刷新授权表，让初始化后的设定立即生效
  firewall-cmd --permanent --add-service=mysql
  firewall-cmd --reload
  mysql -u root -p
    > # 输入root管理员在数据库中密码
    >help
    >SHOW databases;
    >SET password = PASSWORD('linuxprobe');
    >exit
  mysql -u root -p
    > # 此处输入管理员在数据库中的新密码
  ```
* 管理账户以及授权
  ```shell
  mysql -u root -p
    >CREATE USER luke@localhost IDENTIFIED BY 'linuxprobe';
    >use mysql;
    >SELECT HOST,USER,PASSWORD FROM user WHERE USER="luke";
    >exit
  mysql -u luke -p
    > # 输入luke用户的数据库密码
    >SHOW databases;
  mysql -u root -p
    > # 输入root管理员在数据库中密码
    >use mysql;
    >GRANT SELECT,UPDATE,DELETE,INSERT ON mysql.user TO luke@localhost;
    >SHOW GRANTS FOR luke@localhost;
  mysql -u luke -p
    > # 输入luke用户的数据库密码
    >SHOW databases;
    >use mysql;
    >SHOW tables;
    >exit
  mysql -u root -p
    > # 输入root管理员在数据库中密码
    >use mysql;
    >REVOKE SELECT,UPDATE,DELETE,INSERT ON mysql.user FROM luke@localhost;
    >SHOW GRANTS FOR luke@localhost;
    >DROP user luke@localhost;
  ```
* 创建数据库与表单
  ```shell
    >CREATE DATABASE linuxprobe;
    >SHOW databases;
    >use linuxprobe;
    >CREATE TABLE mybook (name char(15),price int,pages int);
    >DESCRIBE mybook;
  ```
* 管理表单及数据
  ```shell
    >INSERT INTO mybook(name,price,pages) VALUES('linuxprobe','60', '518');
    >SELECT * from mybook;
    >UPDATE mybook SET price=55 ;
    >SELECT name,price FROM mybook;
    >INSERT INTO mybook(name,price,pages) VALUES('linuxcool','85', '300');
    >INSERT INTO mybook(name,price,pages) VALUES('linuxdown','105', '500');
    >UPDATE mybook SET price=60 where name='linuxcool';
    >select * from mybook;
    >DELETE FROM mybook;
    >SELECT * FROM mybook;
    >INSERT INTO mybook(name,price,pages) VALUES('linuxprobe1','30','518');
    >INSERT INTO mybook(name,price,pages) VALUES('linuxprobe2','50','518');
    >INSERT INTO mybook(name,price,pages) VALUES('linuxprobe3','80','518');
    >INSERT INTO mybook(name,price,pages) VALUES('linuxprobe4','100','518');
    >SELECT * FROM mybook WHERE price>75;
    >SELECT * FROM mybook WHERE price!=80;
    >SELECT * from mybook WHERE price=30 AND pages=518 ;
    >exit
  ```
* 数据库的备份及恢复
  ```shell
  mysqldump -u root -p linuxprobe > /root/linuxprobeDB.dump
    > # 输入管理员的数据库密码
  mysql -u root -p
    > # 输入root管理员在数据库中密码
    >DROP DATABASE linuxprobe;
    >SHOW databases;
    >CREATE DATABASE linuxprobe;
  mysql -u root -p linuxprobe < /root/linuxprobeDB.dump
    > # 输入管理员的数据库密码
  mysql -u root -p
    > # 输入root管理员在数据库中密码
    >use linuxprobe;
    >SHOW tables;
    >describe mybook;
  ```

# 第19章 使用PXE+Kickstart无人值守安装服务
* 无人值守安装程序
* 部署相关服务程序
  ```shell
  # 配置DHCP服务程序
  # 无人值守系统关闭虚拟机自带的DHCP
  iptables -F
  systemctl stop firewalld
  yum install -y dhcp
  vim /etc/dhcp/dhcpd.conf
    >allow booting;
    >allow bootp;
    >ddns-update-style none;
    >ignore client-updates;
    >subnet 192.168.10.0 netmask 255.255.255.0 {
    >    option subnet-mask                 255.255.255.0;
    >    option domain-name-servers         192.168.10.10;
    >    range dynamic-bootp 192.168.10.100 192.168.10.200;
    >    default-lease-time                 21600;
    >    max-lease-time                     43200;
    >    next-server                        192.168.10.10;
    >    filename                           "pxelinux.0";
    >}
  systemctl restart dhcpd
  systemctl enable  dhcpd

  # 配置TFTP服务程序
  yum install -y tftp-server xinetd
  vim /etc/xinetd.d/tftp
    >service tftp
    >{
    >    socket_type             = dgram
    >    protocol                = udp
    >    wait                    = yes
    >    user                    = root
    >    server                  = /usr/sbin/in.tftpd
    >    server_args             = -s /var/lib/tftpboot
    >    disable                 = no #
    >    per_source              = 11
    >    cps                     = 100 2
    >    flags                   = IPv4
    >}
  systemctl restart xinetd
  systemctl enable  xinetd

  # 配置SYSLinux服务程序
  yum install -y syslinux
  cd /var/lib/tftpboot
  cp /usr/share/syslinux/pxelinux.0 .
  cp /media/cdrom/images/pxeboot/* . # 挂载镜像到/media/cdrom
  cp /media/cdrom/isolinux/* .
  mkdir pxelinux.cfg
  cp /media/cdrom/isolinux/isolinux.cfg pxelinux.cfg/default
  vim pxelinux.cfg/default
    1>default linux
    64>append initrd=initrd.img inst.stage2=ftp://192.168.10.10 ks=ftp://192.168.10.10/pub/ks.cfg quiet

  # 配置VSFtpd服务程序
  yum install -y vsftpd
  vim /etc/vsftpd/vsftpd.conf
    >anonymous_enable=YES
  systemctl restart vsftpd
  systemctl enable vsftpd
  cp -r /media/cdrom/* /var/ftp
  # firewall-cmd --permanent --add-service=ftp
  # firewall-cmd --reload
  setsebool -P ftpd_connect_all_unreserved=on

  # 创建KickStart应答文件
  cp ~/anaconda-ks.cfg /var/ftp/pub/ks.cfg
  chmod +r /var/ftp/pub/ks.cfg
  vim /var/ftp/pub/ks.cfg
    6>url --url=ftp://192.168.10.10
    21>timezone Asia/Shanghai --isUtc
    29>clearpart --all --initlabel
  ```
* 自动部署客户端主机
  客户机内存大于2G
  

# 第20章 使用LNMP架构部署动态网站环境
* 源码包程序
  ```shell
  # 下载及解压源码包文件
  tar xzvf FileName.tar.gz
  cd FileDirectory
  # 编译源码包代码
  ./configure --prefix=/usr/local/program # --prefix 指定源码包程序安装路径
  # 生成二进制安装程序
  make
  # 运行二进制的服务程序安装包
  make install
  # 清理源码包临时文件
  make clean
  ```
* LNMP动态网站架构
  ```shell
  yum -y install apr* autoconf automake numactl bison bzip2-devel cpp curl-devel fontconfig-devel freetype-devel gcc gcc-c++ gd-devel gettext-devel kernel-headers keyutils-libs-devel krb5-devel libcom_err-devel  libpng-devel  libjpeg* libsepol-devel libselinux-devel libstdc++-devel libtool* libxml2-devel libXpm* libxml* libXaw-devel libXmu-devel libtiff* make openssl-devel patch pcre-devel perl php-common php-gd telnet zlib-devel libtirpc-devel gtk* ntpstat na* bison* lrzsz cmake ncurses-devel libzip-devel libxslt-devel gdbm-devel readline-devel gmp-devel
  ping -c 4 www.linuxprobe.com
  mkdir /lnmp
  cd /lnmp
  wget https://www.linuxprobe.com/Software/rpcsvc-proto-1.4.tar.gz
  wget https://www.linuxprobe.com/Software/nginx-1.16.0.tar.gz
  wget https://www.linuxprobe.com/Software/mysql-8.0.18.tar.xz
  wget https://www.linuxprobe.com/Software/php-7.3.5.tar.gz
  wget https://www.linuxprobe.com/Software/wordpress.tar.gz
  ls
  tar xzvf rpcsvc-proto-1.4.tar.gz
  cd rpcsvc-proto-1.4/
  ./configure
  make
  make install
  cd ..

  # 配置Nginx服务
  useradd nginx -M -s /sbin/nologin # -M 不创建对应的家目录 -s 指定登录后的Shell解释器为/sbin/nologin
  id nginx
  tar zxvf nginx-1.16.0.tar.gz
  cd nginx-1.16.0/
  ./configure --prefix=/usr/local/nginx --with-http_ssl_module #? yum install openssl
  make
  make install
  cd ..
  vim /usr/local/nginx/conf/nginx.conf
    2>user  nginx nginx;
    45>index  index.php index.html index.htm;
    65>location ~ \.php$ {
    66>         root           html;
    67>         fastcgi_pass   127.0.0.1:9000;
    68>         fastcgi_index  index.php;
    69>         fastcgi_param  SCRIPT_FILENAME  /usr/local/nginx/html$fastcgi_script_name;
    70>         include        fastcgi_params;
    71>}
  vim ~/.bashrc #?
    >PATH=$PATH:$HOME/bin:/usr/local/nginx/sbin
    >export PATH
  source ~/.bashrc #?
  nginx # 浏览器输入127.0.0.1

  # 配置Mysql服务
  useradd mysql -M -s /sbin/nologin
  tar xvf mysql-8.0.18.tar.xz
  mv mysql-8.0.18-linux-glibc2.12-x86_64 mysql
  mv mysql /usr/local
  cd /usr/local/mysql
  mkdir data
  chown -R mysql:mysql /usr/local/mysql
  cd bin
  ./mysqld --initialize --user=mysql --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data
    >A temporary password is generated for root@localhost: jrCScyxuI5,4
  vim ~/.bashrc #?
    >PATH=$PATH:$HOME/bin:/usr/local/nginx/sbin:/usr/local/mysql/bin
    >export PATH
  source ~/.bashrc #?
  cd /usr/local/mysql
  cp -a support-files/mysql.server /etc/init.d/
  chmod a+x /etc/init.d/mysql.server
  ln -s /usr/lib64/libtinfo.so.6.1 /usr/lib64/libtinfo.so.5 #?
  /etc/init.d/mysql.server start #? selinux
  mysql -u root -p
    > # 输入初始化时给的原始密码
    >alter user 'root'@'localhost' identified by '19990608';
    >use mysql;
    >show tables;
    >ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '19990608';
    >create database linuxcool;
    >exit
  
  # 配置php服务
  cd /lnmp
  tar xvf php-7.3.5.tar.gz
  cd php-7.3.5/
  ./configure --prefix=/usr/local/php --enable-fpm --with-mysqli --with-curl --with-pdo_mysql --with-pdo_sqlite --enable-mysqlnd --enable-mbstring --with-gd
  make
  make install
  cp php.ini-development /usr/local/php/lib/php.ini
  cd /usr/local/php/etc/
  mv php-fpm.conf.default php-fpm.conf
  mv php-fpm.d/www.conf.default php-fpm.d/www.conf
  cd /lnmp/php-7.3.5
  cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
  chmod 755 /etc/init.d/php-fpm
  vim /usr/local/php/lib/php.ini
    310>disable_functions = passthru,exec,system,chroot,chgrp,chown,shell_exec,proc_open,proc_get_status,popen,ini_alter,ini_restore,dl,openlog,syslog,readlink,symlink,popepassthru,stream_socket_server
  /etc/init.d/php-fpm start
  ```
* 搭建Wordpress博客
  ```shell
  cd ..
  rm -f /usr/local/nginx/html/*
  tar xzvf wordpress.tar.gz
  mv wordpress/* /usr/local/nginx/html/
  chown -Rf nginx:nginx /usr/local/nginx/html
  chmod -Rf 777 /usr/local/nginx/html
  ```
* 选购服务器主机
