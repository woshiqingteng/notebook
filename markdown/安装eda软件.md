[toc]

```shell
# AlmaLinux 8.6
su -
mkdir /software
cp -r ./* /software/ # 复制软件安装文件
mkdir -p /software/cadence/ic618
mkdir -p /software/cadence/spectre21
mkdir -p /software/cadence/iscape
mkdir -p /software/cadence/license

mkdir -p /software/mentor/calibre

dnf install xterm csh ksh java-17-openjdk 



alternatives --install /usr/bin/virtuoso virtuoso /software/cadence/ic618/bin/virtuoso 1
alternatives --install /usr/bin/spectre spectre /software/cadence/spectre21/bin/spectre 1
alternatives --list
virtuoso



# WARNING This OS does not appear to be a Cadence supported Linux configuration.
# For more info, please run CheckSysConf in <cdsRoot/tools.lnx86/bin/checkSysConf <productId>
vim /etc/redhat-release
    >CentOS Linux release 7.9.2009 (Core)
    #>AlmaLinux release 8.6 (Sky Tiger)
# IC6.1.8
/software/cadence/ic618/tools/bin/checkSysConf IC6.1.8
./checkSysConf IC6.1.8 -d /software/cadence/ic618/share/patchData
# swap 4g memory 4g
# 需要
dnf install motif libXp glibc-devel gdb xorg-x11-fonts-ISO8859-1-75dpi xorg-x11-server-Xvfb
# 总共
dnf install glibc elfutils-libelf ksh mesa-libGL mesa-libGLU motif libXp libpng libjpeg-turbo expat glibc-devel gdb xorg-x11-fonts-misc xorg-x11-fonts-ISO8859-1-75dpi redhat-lsb libXScrnSaver apr apr-util compat-db47 xorg-x11-server-Xvfb mesa-dri-drivers

# SPECTRE21.1
dnf install glibc.i686


export W3264_NO_HOST_CHECK=1

# WARNING: not possible to detect OS, missing lsb_release command!
dnf install redhat-lsb

# /software/cadence/ic618/tools.lnx86/dfII/bin/64bit/virtuoso: error while loading shared libraries: libcrypto.so.10: cannot open shared object file: No such file or directory
dnf provides libcrypto.so.10
dnf install compat-openssl10
# /software/cadence/ic618/tools.lnx86/dfII/bin/64bit/virtuoso: error while loading shared libraries: libXss.so.1: cannot open shared object file: No such file or directory
dnf provides libXss.so.1
dnf install libXScrnSaver
# /software/cadence/ic618/tools.lnx86/dfII/bin/64bit/virtuoso: error while loading shared libraries: libnsl.so.1: cannot open shared object file: No such file or directory
dnf provides libnsl.so.1
dnf install libnsl
# /software/cadence/ic618/tools.lnx86/dfII/bin/64bit/virtuoso: error while loading shared libraries: libaprutil-1.so.0: cannot open shared object file: No such file or directory
dnf provides libaprutil-1.so.0
dnf install apr-util
# /software/cadence/ic618/tools.lnx86/dfII/bin/64bit/virtuoso: error while loading shared libraries: libdb-4.7.so: cannot open shared object file: No such file or directory
dnf provides libdb-4.7.so
locate libdb
# cp /software/cadence/ic618/tools.lnx86/lib/64bit/SuSE/SLES12/libdb-4.7.so /usr/lib64/
# 链接断开
ln -s /usr/lib64/libdb-5.3.so /usr/lib64/libdb-4.7.so

# dlopen failed to open 'libdl.so'
dnf provides libdl.so
ln -s /usr/lib64/libdl.so.2 /usr/lib64/libdl.so
# ERROR (LMC-01902): License call failed. The license server search path is defined as <none>. Can't find license file.
# Run 'lic_error LMC-01902' for more information.
# License initialization failed, exiting.

cp pubkey_verify /software/cadence/
cd /software/cadence/
./pubkey_verify -y
    >Total search 144871 files.
    >Total 403 file are changed.
export CDS_LIC_FILE=/software/cadence/license/license.dat

# virtuoso 开启界面卡住
vim /etc/hosts
    >127.0.0.1 qingteng
vim /etc/hostname
    >qingteng

# *WARNING* could not load font "-*-courier-medium-r-*-*-12-*", using font "fixed"



# ic5141
# /software/cadence/ic5141/tools.lnx86/dfII/bin/icfb:行17: cds_root: 未找到命令
# Unable to find the Cadence software in your $PATH.
# Please fix this and try again.





# IC618.160 Hotfix + IC618.000 Base
```
