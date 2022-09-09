[toc]

# 1 简介
* TEX Live 的基本安装
    * 装脚本的名称是 install-tl。它可以在指定了 -gui 选项的情况下“GUI”模式 (Windows 和Mac OS X 下的默认模式) 工作，或指定 -gui=text 选项以文本模式 (其它系统下默认模式) 工作。在 Unix 平台上如果安装了 Perl/Tk，以前的 Perl/Tk 和向导模式还可以通过 -gui=perltk 选项启用

# 2 TEX live 概览
* TEX Live 的顶层目录
    * bin TEX 系统程序，按平台组织。
    * readme.html 网页，提供了多种语言的简介和有用的链接。
    * readme-*.dir TEX Live 多种语言的简介和有用的链接，同时有 HTML 和纯文本版本。
    * source 所有程序的源代码，包括主要的基于 Web2C 的 TEX 发行版。texmf-dist 最主要的文件树，见下文的 TEXMFDIST。
    * tlpkg 用来维护安装程序所用到的脚本，程序和数据，以及对 Windows 的特殊支持。
* 至于文档，顶层目录下的 doc.html 文件中提供的完整的链接会有帮助。几乎所有内容的文档 (宏包、格式文件、字体、程序手册，man page, Info 文件等) 在 texmf-dist/doc 目录下，因为这些程序本身是属于 texmf 目录的。TEX 宏包与格式文件的文档则放在 texmf-dist/doc 目录。但不管放在哪个地方，你都可以使用 texdoc 程序来寻找这些文档
* 预定义的 texmf 目录树概览
    * 系统中用于指定 texmf 目录的所有预定义变量及其用途，以及 TEX Live 的默认布局。tlmgr conf 命令可以列出这些变量的值
    * TEXMFDIST 这个目录树包含几乎所有原有发行版本的文件——配置文件、脚本、宏包、字体等等。唯一的例外是每个平台的可执行文件，存储在与它同级的 bin/ 目录下。
    * TEXMFSYSVAR 给 texconfig-sys、updmap-sys 和 fmtutil-sys 还有 tlmgr 这几个命令存储、缓存运行时使用的格式文件和生成的 map 文件，对整个系统都有效。
    * TEXMFSYSCONFIG 给 texconfig-sys、updmap-sys 和 fmtutil-sys 这些程序存储修改过的全局文件.
    * TEXMFLOCAL 系统管理员用来安装供整个系统使用的额外的或更新过的宏包、字体的目录。
    * TEXMFHOME 给用户存放它们自己独立安装的的宏包、字体等等。这个变量根据不同的用户选择不同的主目录。
    * TEXMFVAR 这个目录是给 texconfig、updmap-user 和 fmtutil-user 存储 (缓存) 格式文件、生成 map 文件这类运行时个人数据的。
    * TEXMFCONFIG 给 texconfig、updmap-sys、和 fmtutil-sys 这些程序存储个人修改过的配置文件。
    * TEXMFCACHE ConTEXt MkIV 和 LuaLATEX 用 来 保 存 (缓 存 的) 运 行 时 数 据 的 目 录 树； 缺 省 为
    * TEXMFSYSVAR，如果该目录不可写，则使用 TEXMFVAR。
* 默认的目录结构：
* 全系统根目录 可以包含多个 TEX Live 版本: (在 Unix 下默认是 /usr/local/texlive)
    * 2019 上一个版本。
    * 2020 当前版本。
        * bin
            * i386-linux GNU/Linux 二进制文件 (32 位)
            * ...
            * x86_64-darwin Mac OS X 二进制文件
            * x86_64-linux GNU/Linux 二进制文件 (64 位)
            * win32 Windows 二进制文件
        * texmf-dist TEXMFDIST 和 TEXMFMAIN
        * texmf-var TEXMFSYSVAR, TEXMFCACHE
        * texmf-config TEXMFSYSCONFIG
    * texmf-local TEXMFLOCAL 用来存放在不同版本间共享的数据。
* 用户主 (home) 目录 ($HOME 或 %USERPROFILE%)
    * .texlive2019 给上个版本的，个人生成和配置的数据。
    * .texlive2020 给这个版本的，个人生成和配置的数据。
        * texmf-var
        * TEXMFVAR, TEXMFCACHE
        * texmf-config TEXMFCONFIG
    * texmf TEXMFHOME 个人的宏包文件，等等。等等。
* TEX 的扩展版本
    * XeTEX 通过第三方库，增加对 Unicode 输入文本和 OpenType 字体的支持，能够直接使用系统字体。
* TEX Live 中其他值得一提的程序
    * bibtex, biber 参考文献支持。
    * makeindex, xindy 索引支持。
    * pdfjam, pdfjoin, … PDF 实用程序。
    * htlatex, … tex4ht: (LA)TEX 到 HTML (还有 XML 等其他格式) 的转换器。

# 3 安装
* Unix
    * `perl install-tl`
    * 要在 GUI 模式下安装，你需要安装 Tcl/Tk。`perl install-tl -gui`
    * `perl install-tl -help`
* 选项
    * create symlinks in standard directories: 这个选项 (只对 Unix 有效的) 可以省下设定环境变量的步骤。如果没有选择它，就必须把 TEX Live 的对应目录添加到 PATH, MANPATH 和 INFOPATH 中。如果要创建符号链接，你需要对这些目标目录的写权限。这个选项是为了在用户已知的标准目录中创建符号链接设计的，比如 /usr/local/bin, 这些目录并不包含任何 TEX 文件。不要用这个选项来覆盖系统中现有的文件，比如给它指定系统目录。最保险和推荐的做法还是不要选择这个选项。
* Unix 下的环境变量
    * 修改的文件是 $HOME/.profile 
    ```shell
    PATH=/usr/local/texlive/2020/bin/i386-linux:$PATH; export PATH
    MANPATH=/usr/local/texlive/2020/texmf-dist/doc/man:$MANPATH; export MANPATH
    INFOPATH=/usr/local/texlive/2020/texmf-dist/doc/info:$INFOPATH; export INFOPATH
    ```
* DVD 安装后的网络更新
    * `tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet`  tlmgr 从就近的 CTAN 镜像获取未来更新
* XeTEX 的系统字体配置
    * 将 texlive-fontconfig.conf 文件复制到 /etc/fonts/conf.d/09-texlive.conf
    * 运行 fc-cache -fsv
    * 运行 fc-list 来查看系统字体的名称。
* 测试安装是否成功
    * `tex --version`
* 面向 TEX 的编辑器
    * Texmaker
    * TeXstudio 是 Texmaker 的一个 fork，引入了额外的功能
    * TeXworks


# 4 特殊安装

# 5 tlmgr：管理你的安装
* tlmgr
    * `tlmgr update -all`
    * `tlmgr update -list`
    * `tlmgr show collection-latexextra`
    * `tlmgr -help`

# 6 有关 Windows 平台的说明

# 7 Web2C 用户指南

# 8 致谢

# 9 发行历史

# 10 翻译说明