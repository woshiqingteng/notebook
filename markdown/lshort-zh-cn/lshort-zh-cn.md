[TOC]

# 第一章 $\LaTeX$的基本概念
## 1.1 概述
### 1.1.1 $\TeX$
### 1.1.2 $\LaTeX$
### 1.1.3 $\LaTeX$的优缺点
### 1.1.4 命令行基础
## 1.2 第一次使用$\LaTeX$
```tex
\documentclass{article}
\begin{document}

``Hello world!'' from \LaTeX.
\end{document}

```
```tex
\documentclass{ctexart}
\begin{document}

“你好，世界！” 来自 \LaTeX{}的问候。

\end{document}
```
## 1.3 $\LaTeX$命令和代码结构
### 1.3.1 $\LaTeX$命令和环境
```tex
\documentclass{article}
\begin{document}

Shall we call ourselves
\TeX users % \TeX 忽略其后所有空格，加花括号阻止忽略空格

or \TeX{} users?

\end{document}
```
### 1.3.2 $\LaTeX$源代码结构
```tex
\documentclass{...} % ... 为某文档类
% 导言区,常使用\usepackage命令调用宏包
\begin{document}
% 正文内容
\end{document}
% 此后内容会被忽略
```
## 1.4 $\LaTeX$宏包和文档类
### 1.4.1 文档类
`\documentclass[⟨options⟩]{⟨class-name⟩}`
* ⟨class-name⟩为文档类的名称article,report,book,ctexart,ctexrep,ctexbook,beamer
* 可选参数⟨options⟩为文档类指定选项

`\documentclass[11pt,twoside,a4paper]{article}`
调用article文档类排版文章，指定纸张为A4大小，基本字号为11pt，双面排版
### 1.5.2 宏包
`\usepackage[⟨options⟩]{⟨package-name⟩}`
* \usepackage可以一次性调用多个宏包，在⟨package-name⟩中用逗号隔开
  * `\usepackage{tabularx, makecell, multirow}`一次性调用三个排版表格常用的宏包
* `texdoc ⟨pkg-name⟩`查阅相应文档，其中⟨pkg-name⟩是宏包或者文档类的名称
## 1.5 $\LaTeX$用到的文件一览
* .sty 宏包文件
* .bib BIBTEX参考文献数据库文件
## 1.6 文件的组织方式
`\include{⟨filename⟩}`在源代码里插入文件
* ⟨filename⟩为文件名（不带.tex扩展名）LATEX 2020-10-01 版本之后允许添加扩展名
* 如果和要编译的主文件不在一个目录中
  ```tex
	\include{chapters/file} % 相对路径
	\include{/home/Bob/file} % *nix（包含 Linux、macOS）绝对路径
	\include{D:/file} % Windows 绝对路径，用正斜线
	```
* \include在读入⟨filename⟩之前会另起一页

`\input{⟨filename⟩}`纯粹是把文件里的内容插入

`\includeonly{⟨filename1⟩,⟨filename2⟩,…}`用于导言区，指定只载入某些文件

```tex
\usepackage{syntonly}
\syntaxonly % LATEX编译后不生成DVI或者PDF文档想生成文档，则用%注释掉\syntaxonly
```
## 1.7 $\LaTeX$和$\TeX$相关的术语和概念

# 第二章 用$\LaTeX$排版文字
## 2.1 语言文字和编码
### 2.1.1 ASCII 编码
### 2.1.2 扩展编码
### 2.1.3 UTF-8 编码
## 2.2 排版中文
```tex
\documentclass{ctexart}
\begin{document}

在\LaTeX{}中排版中文。
汉字和English单词混排，通常不需要在中英文之间添加额外的空格。
当然，为了代码的可读性，加上汉字和 English 之间的空格也无妨。
汉字换行时不会引入多余的空格。

\end{document}
```
## 2.3 $\LaTeX$中的字符
### 2.3.1 空格和分段
空格键和 Tab 键输入的空白字符视为“空格”。连续的若干个空白字符视为一个空格。一行开头的空格忽略不计。
行末的换行符视为一个空格；但连续两个换行符，也就是空行，会将文字分段。多个空行被视为一个空行。也可以在行末使用 \par 命令分段。
```tex
\documentclass{article}
\begin{document}

Several spaces		equal one.
	Front spaces are ignored.

An empty line starts a new
paragraph.\par
A \verb|\par| command does
the same.

\end{document}
```
### 2.3.2 注释
% 字符作为注释。在这个字符之后直到行末，所有的字符都被忽略，行末的换行符也不引入空格。
```tex
\documentclass{article}
\begin{document}

This is an % short comment
% ---
% Long and organized
% comments
% ---
example: Comments do not bre%
ak a word.

\end{document}
```
### 2.3.3 特殊字符
```tex
\documentclass{article}
\begin{document}

\# \$ \% \& \{ \} \_
\^{} \~{} \textbackslash % \\ 被直接定义成了手动换行的命令，输入反斜线就需要用 \textbackslash

\end{document}
```
### 2.3.4 连字
```tex
\documentclass{article}
\begin{document}

It's difficult to find \ldots\\
It's dif{}f{}icult to f{}ind \ldots % pdflatex编译无连字 xelatex编译有连字

\end{document}
```
### 2.3.5 标点符号
中文标点符号直接输入，西文标点符号需注意
* 引号
```tex
\documentclass{article}
\begin{document}

``Please press the `x' key.''

\end{document}
```
* 连字号和破折号
```tex
\documentclass{article}
\begin{document}

daughter-in-law, X-rated\\
pages 13--67\\
yes---or no?

\end{document}
```
* 省略号
```tex
\documentclass{article}
\begin{document}

one, two, three, \ldots one hundred.

\end{document}
```
* 波浪号
### 2.3.6 拉丁文扩展与重音
```tex
\documentclass{article}
\begin{document}

H\^otel, na\"\i ve, \'el\`eve,\\
sm\o rrebr\o d, !`Se\ norita!,\\
Sch\"onbrunner Schlo\ss{}
Stra\ss e

\end{document}
```
### 2.3.7 其他符号
```tex
\documentclass{article}
\begin{document}

\P{} \S{} \dag{} \ddag{}
\copyright{} \pounds{}
\textasteriskcentered
\textperiodcentered
\textbullet
\textregistered{} \texttrademark

\end{document}
```
### 2.3.8 $\LaTeX$标志
```tex
\documentclass{article}
\begin{document}

\TeX
\LaTeX
\LaTeXe

\end{document}
```
## 2.4 断行和短页
### 2.4.1 单词间距
```tex
\documentclass{article}
\begin{document}

Fig.~2a \\
Donald~E. Knuth

\end{document}
```
### 2.4.2 手动断行和断页
`\\[⟨length⟩] \\*[⟨length⟩]	\newline` 断行
* 一是 \\\ 可以带可选参数 ⟨length⟩，用于在断行处向下增加垂直间距，而 \newline 不带可选参数
* 二是 \\\ 也在表格、公式等地方用于换行，而 \newline 只用于文本段落中
* 带星号的 \\\ 表示禁止在断行处分页

`\newpage \clearpage` 断页
* 第一，在双栏排版模式中 \newpage 起到另起一栏的作用，\clearpage 则能够另起一页
* 第二，在涉及浮动体的排版上行为不同

`\linebreak[⟨n⟩] \nolinebreak[⟨n⟩] \pagebreak[⟨n⟩] \nopagebreak[⟨n⟩]`
* 用数字 ⟨n⟩ 代表适合/不适合的程度，取值范围为 0–4，不带可选参数时，缺省为 4

```tex
\documentclass{ctexart}
\begin{document}

使用 \verb|\newline| 断行的效果
\newline
与使用 \verb|\linebreak| 断行的效果
\linebreak
进行对比。

\end{document}
```
### 2.4.3 断词
```tex
\documentclass{article}
\begin{document}

I think this is: su\-per\-cal\-%
i\-frag\-i\-lis\-tic\-ex\-pi\-%
al\-i\-do\-cious.

\end{document}
```

# 第三章 文档元素
## 3.1 章节和目录
### 3.1.1 章节标题
`\chapter{⟨title⟩} \section{⟨title⟩} \subsection{⟨title⟩} \subsubsection{⟨title⟩} \paragraph{⟨title⟩} \subparagraph{⟨title⟩}` 生成章节标题，并能够自动编号
* \chapter 只在 report 和 book 文档类有定义
* \part 命令，用来将整个文档分割为大的分块

`\section[⟨short title⟩]{⟨title⟩}` 带可选参数的变体
* 标题使用 ⟨title⟩ 参数，在目录和页眉页脚中使用 ⟨short title⟩ 参数

`\section*{⟨title⟩}` 带星号的变体
* 题不带编号，也不生成目录项和页眉页脚

article 文档类带编号的层级为 \section / \subsection / \subsubsection 三级

report / book 文档类带编号的层级为 \chapter / \section / \subsection 三级

titlesec宏包定制格式
### 3.1.2 目录
`\tableofcontents` 生成目录
* 生成单独的一章（report / book）或一节（article），标题默认为“Contents”
* \tableofcontents 生成的章节默认不写入目录（\section* 或 \chapter*），可使用 tocbibind 等宏包修改设置

`\addcontentsline{toc}{⟨level⟩}{⟨title⟩}`
* 使用了 \chapter* 或 \section* 这样不生成目录项的章节标题命令，而又想手动生成该章节的目录项
* ⟨level⟩ 为章节层次 chapter 或 section 等，⟨title⟩ 为出现于目录项的章节标题
### 3.1.3 文档结构的划分
`\appendix`
* 正文和附录分开，使用 \appendix 后，最高一级章节改为使用拉丁字母编号，从 A 开始

book 文档类还提供了前言、正文、后记结构的划分命令:
* `\frontmatter` 前言部分，页码使用小写罗马数字；其后的 \chapter 不编号
* `\mainmatter` 正文部分，页码使用阿拉伯数字，从 1 开始计数；其后的章节编号正常
* `\backmatter` 后记部分，页码格式不变，继续正常计数；其后的 \chapter 不编号
## 3.2 标题页
`\title{⟨title⟩} \author{⟨author⟩} \date{⟨date⟩}`
* 前两个命令是必须的（不用 \title 会报错；不用 \author 会警告），\date 命令可选
* \today 命令自动生成当前日期，\date 默认使用 \today
* 在 \title、\author 等命令内可以使用 \thanks 命令生成标题页的脚注，用 \and 隔开多个人名
* 信息给定后，就可以使用 \maketitle 命令生成一个简单的标题页
* article 文档类的标题默认不单独成页，而 report 和 book 默认单独成页。可在 \documentclass 命令调用文档类时指定 titlepage / notitlepage 选项以修改默认的行为
* titlepage 环境重新定义 \maketitle
```tex
\renewcommand{\maketitle}{\begin{titlepage}
... % 用户自定义命令
\end{titlepage}}
```
源代码 3.1: book 文档类的文档结构示例
```tex
\documentclass{book}

% 导言区，加载宏包和各项设置，包括参考文献、索引等
\usepackage{makeidx}		% 调用 makeidx 宏包，用来处理索引
\makeindex					% 开启索引的收集
\bibliographystyle{plain}	% 指定参考文献样式为 plain

\begin{document}

\frontmatter		% 前言部分
\maketitle			% 标题页
\include{preface}	% 前言章节 preface.tex
\tableofcontents

\mainmatter			% 正文部分
\include{chapter1}	% 第一章 chapter1.tex
\include{chapter2}	% 第二章 chapter2.tex
...
\appendix			% 附录
\include{appendixA}	% 附录 A appendixA.tex
...

\backmatter				% 后记部分
\include{epilogue}		% 后记 epilogue.tex
\bibliography{books} 	% 利用 BibTeX 工具从数据库文件 books.bib 生成参考文献
\printindex				% 利用 makeindex 工具生成索引

\end{document}
```
源代码 3.2: LATEX 默认的标题页示例
```tex
\title{Test title}
\author{ Mary\thanks{E-mail:*****@***.com}
\and Ted\thanks{Corresponding author}
\and Louis}
\date{\today}
```
## 3.3 交叉引用
`\label{⟨label-name⟩}`
* 在能够被交叉引用的地方，如章节、公式、图表、定理等位置使用 \label 命令

`\ref{⟨label-name⟩} \pageref{⟨label-name⟩}`
* 在别处使用 \ref 或 \pageref 命令，分别生成交叉引用的编号和页码

```tex
\documentclass{article}
\begin{document}

A reference to this subsection
\label{sec:this} looks like:
``see section~\ref{sec:this} on
page~\pageref{sec:this}.''

\end{document}
```
在使用不记编号的命令形式（\section*、\caption*、带可选参数的 \item 命令等）时不要使用 \label 命令，否则生成的引用编号不正确
## 3.4 脚注和边注
`\footnote{⟨footnote⟩}` 在页面底部生成一个脚注
```tex
\documentclass{ctexart}
\begin{document}

\begin{tabular}{l}
\hline
“天地玄黄，宇宙洪荒。日月盈昃，辰宿列张。”\footnotemark \\
\hline
\end{tabular}
\footnotetext{表格里的名句出自《千字文》。}

\end{document}
```
`\marginpar[⟨left-margin⟩]{⟨right-margin⟩}`
* 边栏位置生成边注
* 如果只给定了 ⟨right-margin⟩，那么边注在奇偶数页文字相同；如果同时给定 ⟨left-margin⟩，则偶数页使用 ⟨left-margin⟩ 的文字

```tex
\documentclass{article}

\begin{document}
\marginpar{\footnotesize 边注较窄，不要写过多文字，最好设置较小的字号。}

\end{document}
```
## 3.5 特殊环境
### 3.5.1 列表
有序和无序列表环境 enumerate 和 itemize
```tex
\begin{enumerate}
\item …
\end{enumerate}
```
```tex
\documentclass{article}
\begin{document}

\begin{enumerate}
\item An item.
\begin{enumerate}
\item A nested item.\label{itref}
\item[*] A starred item.
\end{enumerate}
\item Reference(\ref{itref}).
\end{enumerate}

\end{document}
```
```tex
\documentclass{article}
\begin{document}

\begin{itemize}
\item An item.
\begin{itemize}
\item A nested item.
\item[+] A `plus' item.
\item Another item.
\end{itemize}
\item Go back to upper level.
\end{itemize}

\end{document}
```
关键字环境 description ，\item 后的可选参数用来写关键字，以粗体显示
```tex
\documentclass{article}
\begin{document}
\begin{description}
\item[⟨item title⟩] …
\end{description}
\end{document}
```
```tex
\documentclass{article}
\begin{document}

\begin{description}
\item[Enumerate] Numbered list.
\item[Itemize] Non-numbered list.
\end{description}

\end{document}
```
各级无序列表的符号由命令 \labelitemi 到 \labelitemiv 定义
```tex
\documentclass{article}
\begin{document}

\renewcommand{\labelitemi}{\ddag}
\renewcommand{\labelitemii}{\dag}
\begin{itemize}
\item First item
\begin{itemize}
\item Subitem
\item Subitem
\end{itemize}
\item Second item
\end{itemize}

\end{document}
```
有序列表的符号由命令 \labelenumi 到 \labelenumiv 定义
```tex
\documentclass{article}
\begin{document}

\renewcommand{\labelenumi}{\Alph{enumi}>}
\begin{enumerate}
\item First item
\item Second item
\end{enumerate}

\end{document}
```
### 3.5.2 对齐环境
center、flushleft 和 flushright 环境分别用于生成居中、左对齐和右对齐的文本环境
`\begin{center} … \end{center}`
`\begin{flushleft} … \end{flushleft}`
`\begin{flushright} … \end{flushright}`
```tex
\documentclass{article}
\begin{document}

\begin{center}
Centered text using a
\verb|center| environment.
\end{center}
\begin{flushleft}
Left-aligned text using a
\verb|flushleft| environment.
\end{flushleft}
\begin{flushright}
Right-aligned text using a
\verb|flushright| environment.
\end{flushright}

\end{document}
```
`\centering \raggedright \raggedleft` 直接改变文字的对齐方式
```tex
\documentclass{article}
\begin{document}

\centering
Centered text paragraph.

\raggedright
Left-aligned text paragraph.

\raggedleft
Right-aligned text paragraph.

\end{document}
```
### 3.5.3 引用环境
quote 用于引用较短的文字，首行不缩进；quotation 用于引用若干段文字，首行缩进
引用环境较一般文字有额外的左右缩进
```tex
\documentclass{ctexart}
\begin{document}

Francis Bacon says:
\begin{quote}
Knowledge is power.
\end{quote}

《木兰诗》：
\begin{quotation}
万里赴戎机，关山度若飞。
朔气传金柝，寒光照铁衣。
将军百战死，壮士十年归。

归来见天子，天子坐明堂。
策勋十二转，赏赐百千强。··· ···
\end{quotation}

\end{document}
```
verse 用于排版诗歌，与 quotation 恰好相反，verse 是首行悬挂缩进的
```tex
\documentclass{article}
\begin{document}

Rabindranath Tagore's short poem:
\begin{verse}
Beauty is truth's smile
when she beholds her own face in
a perfect mirror.
\end{verse}

\end{document}
```
### 3.5.4 摘要环境
摘要环境 abstract 默认只在标准文档类中的 article 和 report 文档类可用
### 3.5.5 代码环境
代码环境 verbatim ，将一段代码原样转义输出
* 等宽字体排版代码，回车和空格也分别起到换行和空位的作用
* 带星号的版本更进一步将空格显示成“␣”
```tex
\documentclass{article}
\begin{document}

\begin{verbatim}
#include <iostream>
int main()
{
	std::cout << "Hello, world!"
		  	  << std::endl;
	return 0;
}
\end{verbatim}

\begin{verbatim*}
for (int i=0; i<4; ++i)
	printf("Number %d\n",i);
\end{verbatim*}

\end{document}
```
`\verb⟨delim⟩⟨code⟩⟨delim⟩`
* 排版简短的代码或关键字
* ⟨delim⟩ 标明代码的分界位置，前后必须一致，除字母、空格或星号外，可任意选择使得不与代码本身冲突，习惯上使用 | 符号
* \verb 后也可以带一个星号，以显示空格
```tex
\documentclass{article}
\begin{document}

\verb|\LaTeX| \\
\verb+(a || b)+ \verb*+(a || b)+

\end{document}
```
相关宏包：verbatim、fancyvrb、listings
## 3.6 表格
tabular 环境用法
* ⟨column-spec⟩ 是列格式标记
* & 用来分隔单元格
* \\\ 用来换行
* \hline 用来在行与行之间绘制横线
* ⟨align⟩ 控制垂直对齐：t 和 b 分别表示按表格顶部、底部对齐，其他参数或省略不写（默认）表示居中对齐
```tex
\begin{tabular}[⟨align⟩]{⟨column-spec⟩}
⟨item1⟩ & ⟨item2⟩ & … \\
\hline
⟨item1⟩ & ⟨item2⟩ & … \\
\end{tabular}
```
```tex
\documentclass{article}
\begin{document}

\begin{tabular}{|c|}
center-\\ aligned \\
\end{tabular},
\begin{tabular}[t]{|c|}
top-\\ aligned \\
\end{tabular},
\begin{tabular}[b]{|c|}
bottom-\\ aligned\\
\end{tabular} tabulars.

\end{document}
```
### 3.6.1 列格式
```tex
\documentclass{article}
\begin{document}

\begin{tabular}{lcr|p{6em}}
\hline
left & center & right & par box with fixed width\\
L & C & R & P \\
\hline
\end{tabular}

\end{document}
```
```tex
\documentclass{article}
\begin{document}

\begin{tabular}{@{} r@{:}lr @{}}
\hline
1 & 1 & one \\
11 & 3 & eleven \\
\hline
\end{tabular}

\end{document}
```
格式参数重复的写法 *{⟨n⟩}{⟨column-spec⟩}
* `\begin{tabular}{|c|c|c|c|c|p{4em}|p{4em}|}`
* `\begin{tabular}{|*{5}{c|}*{2}{p{4em}|}}`

array 宏包提供了辅助格式 > 和 <，用于给列格式前后加上修饰命令
```tex
\documentclass{article}
\usepackage{array}
\begin{document}

\begin{tabular}{>{\itshape}r<{*}l}
\hline
italic & normal \\
column & column \\
\hline
\end{tabular}

\end{document}
```
辅助格式支持插入 \centering 等命令改变 p 列格式的对齐方式，一般还要加额外的命令 \arraybackslash 以免出错
```tex
\documentclass{article}
\usepackage{array}
\begin{document}

\begin{tabular}%
{>{\centering\arraybackslash}p{9em}}
\hline
Some center-aligned long text. \\
\hline
\end{tabular}

\end{document}
```
array 宏包还提供了类似 p 格式的 m 格式和 b 格式，三者分别在垂直方向上靠顶端对齐、居中以及底端对齐
```tex
\documentclass{article}
\usepackage{array}
\begin{document}

\newcommand\txt{a b c d e f g h i}
\begin{tabular}{cp{2em}m{2em}b{2em}}
\hline
pos & \txt & \txt & \txt \\
\hline
\end{tabular}

\end{document}
```
### 3.6.2 列宽
```tex
\documentclass{article}
\begin{document}

\begin{tabular*}{14em}%
{@{\extracolsep{\fill}}|c|c|c|c|}
\hline
A & B & C & D \\ \hline
a & b & c & d \\ \hline
\end{tabular*}

\end{document}
```
tabularx 宏包
```tex
\documentclass{article}
\usepackage{array,tabularx}
\begin{document}

\begin{tabularx}{14em}%
{|*{4}{>{\centering\arraybackslash}X|}}
\hline
A & B & C & D \\ \hline
a & b & c & d \\ \hline
\end{tabularx}

\end{document}
```
### 3.6.3 横线
\cline{⟨i⟩-⟨j⟩} 用来绘制跨越部分单元格的横线
```tex
\documentclass{article}
\begin{document}

\begin{tabular}{|c|c|c|}
\hline
4 & 9 & 2 \\ \cline{2-3}
3 & 5 & 7 \\ \cline{1-1}
8 & 1 & 6 \\ \hline
\end{tabular}

\end{document}
```
三线表由 booktabs 宏包支持
*  \toprule、\midrule 和 \bottomrule 命令用以排版三线表的三条线，以及和 \cline 对应的 \cmidrule

```tex
\documentclass{article}
\usepackage{booktabs}
\begin{document}

\begin{tabular}{cccc}
\toprule
& \multicolumn{3}{c}{Numbers} \\
\cmidrule{2-4}
& 1 & 2 & 3 \\
\midrule
Alphabet & A & B & C \\
Roman
& I & II& III \\
\bottomrule
\end{tabular}

\end{document}
```
### 3.6.4 合并单元格
`\multicolumn{⟨n⟩}{⟨column-spec⟩}{⟨item⟩}` 横向合并单元格
*  ⟨n⟩ 为要合并的列数，⟨column-spec⟩ 为合并单元格后的列格式，只允许出现一个 l/c/r 或
p 格式
```tex
\documentclass{article}
\begin{document}

\begin{tabular}{|c|c|c|}
\hline
1 & 2 & Center \\ \hline
\multicolumn{2}{|c|}{3} &
\multicolumn{1}{r|}{Right} \\ \hline
4 & \multicolumn{2}{c|}{C} \\ \hline
\end{tabular}

\end{document}
```
`\multirow{⟨n⟩}{⟨width⟩}{⟨item⟩}` 纵向合并单元格
* multirow 宏包提供的 \multirow 命令
* ⟨width⟩ 为合并后单元格的宽度，可以填 * 以使用自然宽度
```tex
\documentclass{article}
\usepackage{multirow}
\begin{document}

\begin{tabular}{ccc}
\hline
\multirow{2}{*}{Item} &
\multicolumn{2}{c}{Value} \\
\cline{2-3}
& First & Second \\ \hline
A & 1
& 2 \\ \hline
\end{tabular}

\end{document}
```
### 3.6.5 嵌套表格
```tex
\documentclass{article}
\begin{document}

\begin{tabular}{|c|c|c|}
\hline
a & b & c \\ \hline
a & \multicolumn{1}{@{}c@{}|}
{\begin{tabular}{c|c}
e & f \\ \hline
e & f \\
\end{tabular}}
& c \\ \hline
a & b & c \\ \hline
\end{tabular}

\end{document}
```
makecell 宏包
```tex
\documentclass{article}
\usepackage{makecell}
\begin{document}

\begin{tabular}{|c|c|}
\hline
a & \makecell{d1 \\ d2} \\
\hline
b & c \\
\hline
\end{tabular}

\end{document}
```
### 3.6.6 行距控制
修改参数 \arraystretch 可以得到行距更加宽松的表格
```tex
\documentclass{article}
\begin{document}

\renewcommand\arraystretch{1.8}
\begin{tabular}{|c|}
\hline
Really loose \\ \hline
tabular rows.\\ \hline
\end{tabular}

\end{document}
```
\\\\ 添加可选参数，在这一行下面加额外的间距，适合用于在行间不加横线的表格
* 从第二行开始，表格的首个单元格不能直接使用中括号 []
* 使用中括号，应当放在花括号 {} 里面，或者也可以选择将换行命令写成 \\\\[0pt]
```tex
\documentclass{article}
\begin{document}

\begin{tabular}{c}
\hline
Head lines \\[6pt]
tabular lines \\
tabular lines \\ \hline
\end{tabular}

\end{document}
```
## 3.7 图片
调用 graphicx 宏包，使用 \includegraphics 命令加载图片
`\includegraphics[⟨options⟩]{⟨filename⟩}`
* ⟨filename⟩ 为图片文件名，文件名可用相对路径或绝对路径表示
* 图片文件的扩展名一般可不写
* 文件名里既不要有空格（类似 \include），也不要有多余的英文点号
*  graphicx 宏包还提供了 \graphicspath 命令，用于声明一个或多个图片文件存放的目录，使用这些目录里的图片时可不用写路径
```tex
% 假设主要的图片放在 figures 子目录下，标志放在 logo 子目录下
\graphicspath{{figures/}{logo/}}
```
* 可选参数 ⟨options⟩ 中可以使用 ⟨key⟩=⟨value⟩ 的形式
* graphicx 宏包也支持 draft/final 选项。当 graphicx 宏包或文档类指定 draft 选项时，图片将不会被实际插入，取而代之的是一个包含文件名的与原图片等大的方框
## 3.8 盒子
### 3.8.1 水平盒子
* \mbox 生成一个基本的水平盒子，内容只有一行，不允许分段
* \makebox 可选参数用于控制盒子的宽度 ⟨width⟩，以及内容的对齐方式⟨align⟩，可选居中 c（默认值）、左对齐 l、右对齐 r 和分散对齐 s
```tex
\mbox{…}
\makebox[⟨width⟩][⟨align⟩]{…}
```
```tex
\documentclass{article}
\begin{document}

|\mbox{Test some words.}|\\
|\makebox[10em]{Test some words.}|\\
|\makebox[10em][l]{Test some words.}|\\
|\makebox[10em][r]{Test some words.}|\\
|\makebox[10em][s]{Test some words.}|

\end{document}
```
### 3.8.2 带框的水平盒子
```tex
\fbox{…}
\framebox[⟨width⟩][⟨align⟩]{…}
```
```tex
\documentclass{article}
\begin{document}

\fbox{Test some words.}\\
\framebox[10em][r]{Test some words.}

\end{document}
```
\setlength 命令调节边框的宽度 \fboxrule 和内边距 \fboxsep
```tex
\documentclass{article}
\begin{document}

\framebox[10em][r]{Test box}\\[1ex]
\setlength{\fboxrule}{1.6pt}
\setlength{\fboxsep}{1em}
\framebox[10em][r]{Test box}

\end{document}
```
### 3.8.3 垂直盒子
```tex
\parbox[⟨align⟩][⟨height⟩][⟨inner-align⟩]{⟨width⟩}{…}
\begin{minipage}[⟨align⟩][⟨height⟩][⟨inner-align⟩]{⟨width⟩}
…
\end{minipage}
```
* ⟨align⟩ 为盒子和周围文字的对齐情况
* ⟨height⟩ 和 ⟨inner-align⟩设置盒子的高度和内容的对齐方式，⟨inner-align⟩ 接受的参数是顶部 t、底部 b、居中 c 和分散对齐 s
```tex
\documentclass{ctexart}
\begin{document}

三字经：\parbox[t]{3em}%
{人之初 性本善 性相近 习相远}
\quad
千字文：
\begin{minipage}[b][8ex][t]{4em}
天地玄黄 宇宙洪荒
\end{minipage}

\end{document}
```
* 在 minipage 里使用 \footnote 命令，生成的脚注会出现在盒子底部，编号是独立的，并且使用小写字母编号。而在 \parbox 里无法正常使用 \footnote 命令，只能在盒子里使用 \footnotemark，在盒子外使用
\footnotetext
```tex
\documentclass{ctexart}
\begin{document}

\fbox{\begin{minipage}{15em}%
这是一个垂直盒子的测试。
\footnote{脚注来自 minipage。}
\end{minipage}}

\end{document}
```
### 3.8.4 标尺盒子
`\rule[⟨raise⟩]{⟨width⟩}{⟨height⟩}`
* \rule 命令用来画一个实心的矩形盒子，也可适当调整以用来画线
```tex
\documentclass{article}
\begin{document}

Black \rule{12pt}{4pt} box.

Upper \rule[4pt]{6pt}{8pt} and
lower \rule[-4pt]{6pt}{8pt} box.

A \rule[-.4pt]{3em}{.4pt} line.

\end{document}
```
## 3.9 浮动体
两类浮动体环境 figure 和 table
* 习惯上 figure 里放图片，table 里放表格，但并没有严格限制，可以在任何一个浮动体里放置文字、公式、表格、图片等等任意内容
```tex
\begin{table}[⟨placement⟩]
…
\end{table}
```
* ⟨placement⟩ 参数提供了一些符号用来表示浮动体允许排版的位置，如 hbp 允许浮动体排版在当前位置、底部或者单独成页。table 和 figure 浮动体的默认设置为 tbp
* 排版位置的选取与参数里符号的顺序无关，LATEX 总是以 h-t-b-p 的优先级顺序决定浮动体位置。
* 限制包括浮动体个数（除单独成页外，默认每页不超过 3 个浮动体，其中顶部不超过 2 个，底部不超过 1 个）以及浮动体空间占页面的百分比（默认顶部不超过 70%，底部不超过 30%）
* 双栏排版环境下，LATEX 提供了 table* 和 figure* 环境用来排版跨栏的浮动体。双栏的 ⟨placement⟩ 参数只能用 tp 两个位置
* 浮动体的位置选取受到先后顺序的限制
* float 宏包为浮动体提供了 H 位置参数，不与 htbp 及 ! 混用。使用 H 位置参数时，会取消浮动机制，将浮动体视为一般的盒子插入当前位置
### 3.9.1 浮动体的标题

`\caption{…}`
* \caption 命令加标题，并且自动给浮动体编号
* 可以用带星号的命令 \caption* (需加载相关宏包，如 caption)生成不带编号的标题，\caption命令之后还可以紧跟 \label 命令标记交叉引用
* 修改 \figurename 和 \tablename 的内容来修改标题的前缀
* 标题样式的定制功能由 caption 宏包提供

table 和 figure 两种浮动体分别有各自的生成目录的命令
```tex
\listoftables
\listoffigures
```
### 3.9.2 并排和子图表
```tex
\begin{figure}[htbp]
\centering
\includegraphics[width=...]{...}
\qquad
\includegraphics[width=...]{...} \\[...pt]
\includegraphics[width=...]{...}
\caption{...}
\end{figure}
```
```tex
\begin{figure}[htbp]
\centering
\begin{minipage}{...}
\centering
\includegraphics[width=...]{...}
\caption{...}
\end{minipage}
\qquad
\begin{minipage}{...}
\centering
\includegraphics[width=...]{...}
\caption{...}
\end{minipage}
\end{figure}
```
给每个图片定义小标题时，用到 subcaption 宏包
```tex
\begin{figure}[htbp]
\centering
\begin{subfigure}{...}
\centering
\includegraphics[width=...]{...}
\caption{...}
\end{subfigure}
\qquad
\begin{subfigure}{...}
\centering
\includegraphics[width=...]{...}
\caption{...}
\end{subfigure}
\end{figure}
```
并排子图表的功能也可通过 subfig 宏包的 \subfloat 命令实现

# 第四章 排版数学公式
## 4.1 AMS宏集
## 4.2 公式排版基础
### 4.2.1 行内和行间公式
行内公式由一对 $ 符号包裹
```tex
\documentclass{article}
\begin{document}

The Pythagorean theorem is
$a^2 + b^2 = c^2$.

\end{document}
```
行间公式由 equation 环境包裹
* quation 环境为公式自动生成一个编号，这个编号可以用 \label 和 \ref 生成交叉引用
```tex
\documentclass{article}
\usepackage{amsmath}
\begin{document}

The Pythagorean theorem is:
\begin{equation}
a^2 + b^2 = c^2 \label{pythagorean}
\end{equation}
Equation \eqref{pythagorean} is
called `Gougu theorem' in Chinese.

\end{document}
```
* amsmath 的 \eqref 命令为引用自动加上圆括号；还可以用 \tag 命令手动修改公式的编号，或者用 \notag 命令取消为公式编号（与之基本等效的命令是 \nonumber）
```tex
\documentclass{article}
\usepackage{amsmath}
\begin{document}

It's wrong to say
\begin{equation}
1 + 1 = 3 \tag{dumb}
\end{equation}
or
\begin{equation}
1 + 1 = 4 \notag
\end{equation}

\end{document}
```
* 如果需要直接使用不带编号的行间公式，则将公式用命令 \\[ 和 \\] 包裹，与之等效的是displaymath 环境，equation* 环境，体现了带星号和不带星号的环境之间的区别
```tex
\documentclass{article}
\usepackage{amsmath}
\begin{document}

\begin{equation*}
a^2 + b^2 = c^2
\end{equation*}
For short:
\[ a^2 + b^2 = c^2 \]
Or if you like the long one:
\begin{displaymath}
a^2 + b^2 = c^2
\end{displaymath}

\end{document}
```
```tex
\documentclass{article}
\begin{document}

In text:
$\lim_{n \to \infty}
\sum_{k=1}^n \frac{1}{k^2}
= \frac{\pi^2}{6}$.

In display:
\[
\lim_{n \to \infty}
\sum_{k=1}^n \frac{1}{k^2}
= \frac{\pi^2}{6}
\]

\end{document}
```
文档类的 fleqn 选项令行间公式左对齐；leqno 选项令编号放在公式左边
### 4.2.2 数学模式
* 输入的空格被忽略。需要人为引入间距时，使用 \quad 和 \qquad 等命令
* 不允许有空行（分段）。行间公式中也无法用 \\ 命令手动换行。
* 所有的字母被当作数学公式中的变量处理，字母间距与文本模式不一致，也无法生成单词之间的空格。如果想在数学公式中输入正体的文本，可用 \mathrm 命令。或者用 amsmath 提供的 \text 命令
```tex
\documentclass{article}
\usepackage{amssymb}
\begin{document}

$x^{2} \geq 0 \qquad
\text{for \textbf{all} }
x\in\mathbb{R}$

\end{document}
```
## 4.3 数学符号
### 4.3.1 一般符号
希腊字母符号的名称就是其英文名称，如 α (\alpha)、β (\beta) 等等。大写的希腊字母为首字母大写的命令，如 Γ (\Gamma)、∆ (\Delta) 等等。无穷大符号为 ∞ (\infty)
```tex
\documentclass{article}
\begin{document}

$a_1, a_2, \dots, a_n$ \\
$a_1 + a_2 + \cdots + a_n$

\end{document}
```
### 4.3.2 指数、上下标和导数
用 ^ 和 _ 标明上下标。注意上下标的内容（子公式）一般需要用花括号包裹
```tex
\documentclass{article}
\begin{document}

$p^3_{ij} \qquad
m_\mathrm{Knuth}\qquad
\sum_{k=1}^3 k $\\[5pt]
$a^x+y \neq a^{x+y}\qquad
e^{x^2} \neq {e^x}^2$

\end{document}
```
导数符号'(′)可连用表示多阶导数，也可以在其后连用上标
```tex
\documentclass{article}
\begin{document}

$f(x) = x^2 \quad f'(x)
= 2x \quad f''^{2}(x) = 4$

\end{document}
```
### 3.3.3 分式和根式
分式使用 \frac{分子}{分母} 来书写。分式的大小在行间公式中是正常大小，而在行内被极度压缩。amsmath 提供了方便的命令 \dfrac 和 \tfrac，令用户能够在行内使用正常大小的分式，或是反过来。
```tex
\documentclass{article}
\usepackage{amsmath}
\begin{document}

In display style:
\[
3/8 \qquad \frac{3}{8}
\qquad \tfrac{3}{8}
\]
In text style:
$1\frac{1}{2}$~hours \qquad
$1\dfrac{1}{2}$~hours

\end{document}
```
一般的根式使用 \sqrt{...}；表示 n 次方根时写成 \sqrt[n]{...}
```tex
\documentclass{article}
\begin{document}

$\sqrt{x} \Leftrightarrow x^{1/2}
\quad \sqrt[3]{2}
\quad \sqrt{x^{2} + \sqrt{y}}$

\end{document}
```
特殊的分式形式，如二项式结构，由 amsmath 宏包的 \binom 命令生成
```tex
\documentclass{article}
\usepackage{amsmath}
\begin{document}

Pascal's rule is
\[
\binom{n}{k} =\binom{n-1}{k}
+ \binom{n-1}{k-1}
\]

\end{document}
```
### 4.3.4 关系符
* 常见的关系符号除了可以直接输入的 =，>，<，其它符号用命令输入，常用的有不等号 ̸̸= (\ne)、大于等于号 ≥ (\ge) 和小于等于号 ≤ (\le)、约等号 ≈ (\approx)、等价 ≡ (\equiv)、正比 ∝ (\propto)、相似 ∼ (\sim) 等等。
* 倾斜的关系符号 ⩽ (\leqslant) 和 ⩾ (\geqslant) 由 amssymb 提供
* 自定义二元关系符的命令 \stackrel，用于将一个符号叠加在原有的二元关系符之上
```tex
\documentclass{article}
\begin{document}

\[
f_n(x) \stackrel{*}{\approx} 1
\]

\end{document}
```
### 4.3.5 算符
* 算符大多数是二元算符，除了直接用键盘可以输入的 +、−、∗、/，其它符号用命令输入，常用的有乘号 × (\times)、除号 ÷ (\div)、点乘 · (\cdot)、加减号 ± (\pm) / ∓ (\mp) 等等。
* ∇ (\nabla) 和 ∂ (\partial)
```tex
\documentclass{article}
\begin{document}

\[
\lim_{x \rightarrow 0}
\frac{\sin x}{x}=1
\]

\end{document}
```
amsmath 允许用户在导言区用 \DeclareMathOperator 定义自己的算符，其中带星号的命令定义带上下限的算符
```tex
\documentclass{article}
\DeclareMathOperator{\argh}{argh}
\DeclareMathOperator*{\nut}{Nut}
\begin{document}

\[\argh 3 = \nut_{x=1} 4x\]

\end{document}
```
### 4.3.6 巨算符
积分号$\int$(\int)、求和号$\sum$(\sum) 等符号称为巨算符
```tex
\documentclass{article}
\begin{document}

In text:
$\sum_{i=1}^n \quad
\int_0^{\frac{\pi}{2}} \quad
\oint_0^{\frac{\pi}{2}} \quad
\prod_\epsilon $ \\
In display:
\[\sum_{i=1}^n \quad
\int_0^{\frac{\pi}{2}} \quad
\oint_0^{\frac{\pi}{2}} \quad
\prod_\epsilon \]

\end{document}
```
巨算符的上下标位置可由 \limits 和 \nolimits 调整，前者令巨算符类似 lim 或求和算符$\sum$，上下标位于上下方；后者令巨算符类似积分号，上下标位于右上方和右下方
```tex
\documentclass{article}
\begin{document}

In text:
$\sum\limits_{i=1}^n \quad
\int\limits_0^{\frac{\pi}{2}} \quad
\prod\limits_\epsilon $ \\
In display:
\[\sum\nolimits_{i=1}^n \quad
\int\limits_0^{\frac{\pi}{2}} \quad
\prod\nolimits_\epsilon \]

\end{document}
```
amsmath 宏包还提供了 \substack，能够在下限位置书写多行表达式；subarray 环境更进一步，令多行表达式可选择居中 (c) 或左对齐 (l)
```tex
\documentclass{article}
\usepackage{amssymb}
\begin{document}

\[
\sum_{\substack{0\le i\le n \\
j\in \mathbb{R}}}
P(i,j) = Q(n)
\]
\[
\sum_{\begin{subarray}{l}
0\le i\le n \\
j\in \mathbb{R}
\end{subarray}}
P(i,j) = Q(n)
\]

\end{document}
```
### 4.3.7 数学重音和上下括号
* 数学符号可以像文字一样加重音，比如求导符号 $\dot{r}$ (\dot{r})、$\ddot{r}$ (\ddot{r})、表示向量的箭头 $\vec{r}$ (\vec{r}) 、表示单位向量的符号 $\hat{\mathbf{e}}$ (\hat{\mathbf{e}}) 等
* 使用时要注意重音符号的作用区域，一般应当对某个符号而不是“符号加下标”使用重音
```tex
\documentclass{article}
\begin{document}

$\bar{x_0} \quad \bar{x}_0$\\[5pt]
$\vec{x_0} \quad \vec{x}_0$\\[5pt]
$\hat{\mathbf{e}_x} \quad
\hat{\mathbf{e}}_x$

\end{document}
```
* 为多个字符加重音，包括直接画线的 \overline 和 \underline 命令（可叠加使用）、宽重音符号 \widehat、表示向量的箭头 \overrightarrow 等
```tex
\documentclass{article}
\begin{document}

$0.\overline{3} =
\underline{\underline{1/3}}$ \\[5pt]
$\hat{XY} \qquad \widehat{XY}$\\[5pt]
$\vec{AB} \qquad
\overrightarrow{AB}$

\end{document}
```
* \overbrace 和 \underbrace 命令用来生成上/下括号，各自可带一个上/下标公式
```tex
\documentclass{article}
\begin{document}

$\underbrace{\overbrace{(a+b+c)}^6
\cdot \overbrace{(d+e+f)}^7}
_\text{meaning of life} = 42$

\end{document}
```
### 4.3.8 箭头
* 常用的箭头包括 \rightarrow (→，或 \to)、\leftarrow（←，或 \gets）
* amsmath 的 \xleftarrow 和 \xrightarrow 命令提供了长度可以伸展的箭头，并且可以为箭头增加上下标
```tex
\documentclass{article}
\usepackage{amsmath}
\begin{document}

\[ a\xleftarrow{x+y+z} b \]
\[ c\xrightarrow[x<y]{a*b*c}d \]

\end{document}
```
### 4.3.9 括号和定界符
* 小括号 ()、中括号 []、大括号 {}（\{\}）、尖括号 ⟨⟩（\langle \rangle）
```tex
\documentclass{article}
\begin{document}

${a,b,c} \neq \{a,b,c\}$

\end{document}
```
* 使用 \left 和 \right 命令可令括号（定界符）的大小可变，在行间公式中常用。LATEX 会自动根据括号内的公式大小决定定界符大小。
* \left 和 \right 必须成对使用。需要使用单个定界符时，另一个定界符写成 \left. 或 \right.
```tex
\documentclass{article}
\begin{document}

\[1 + \left(\frac{1}{1-x^{2}}
\right)^3 \qquad
\left.\frac{\partial f}{\partial t}
\right|_{t=0}\]

\end{document}
```
* \big、\bigg等命令生成固定大小的定界符。更常用的形式是类似 \left 的 \bigl、\biggl 等，以及类 \right 的 \bigr、\biggr 等（\bigl 和 \bigr 不必成对出现）
```tex
\documentclass{article}
\begin{document}

$\Bigl((x+1)(x-1)\Bigr)^{2}$\\
$\bigl( \Bigl( \biggl( \Biggl( \quad
\bigr\} \Bigr\} \biggr\} \Biggr\} \quad
\big\| \Big\| \bigg\| \Bigg\| \quad
\big\Downarrow \Big\Downarrow
\bigg\Downarrow \Bigg\Downarrow$

\end{document}
```
* 用 \left 和 \right 分界符包裹的公式块不允许断行，不允许在多行公式里跨行使用，而 \big 和 \bigg 等命令不受限制
## 4.4 多行公式
### 4.4.1 长公式折行
* amsmath 宏包的 multline 环境提供了书写折行长公式的方便环境。它允许用 \\\ 折行，将公式编号放在最后一行。多行公式的首行左对齐，末行右对齐，其余行居中
```tex
\documentclass{article}
\usepackage{amsmath}
\begin{document}

\begin{multline}
a + b + c + d + e + f
+ g + h + i \\
= j + k + l + m + n\\
= o + p + q + r + s\\
= t + u + v + x + z
\end{multline}

\end{document}
```
* 类似 equation*，multline* 环境排版不带编号的折行长公式
### 4.4.2 多行公式
* align 环境，它将公式用 & 隔为两部分并对齐。分隔符通常放在等号左边
```tex
\documentclass{article}
\usepackage{amsmath}
\begin{document}

\begin{align}
a & = b + c \\
& = d + e
\end{align}

\end{document}
```
* align 环境会给每行公式都编号。可以用 \notag 去掉某行的编号
```tex
\documentclass{article}
\usepackage{amsmath}
\begin{document}

\begin{align}
a ={} & b + c \\
={} & d + e + f + g + h + i
+ j + k + l \notag \\
& + m + n + o \\
={} & p + q + r + s
\end{align}

\end{document}
```
* 在等号后添加一对括号 {} 以产生正常的间距
* align 还能够对齐多组公式，除等号前的 & 之外，公式之间也用 & 分隔
```tex
\documentclass{article}
\usepackage{amsmath}
\begin{document}

\begin{align}
a &=1 & b &=2 & c &=3 \\
d &=-1 & e &=-2 & f &=-5
\end{align}

\end{document}
```
* 不需要按等号对齐，只需罗列数个公式，gather 
```tex
\documentclass{article}
\usepackage{amsmath}
\begin{document}

\begin{gather}
a = b + c \\
d = e + f + g \\
h + i = j + k \notag \\
l + m = n
\end{gather}

\end{document}
```
* align 和 gather 有对应的不带编号的版本 align* 和 gather*
### 4.4.3 公用编号的多行公式
* 将多个公式组在一起公用一个编号，编号位于公式的居中位置。aligned、gathered 等环境，与 equation 环境套用
```tex
\documentclass{article}
\usepackage{amsmath}
\begin{document}

\begin{equation}
\begin{aligned}
a &= b + c \\
d &= e + f + g \\
h + i &= j + k \\
l + m &= n
\end{aligned}
\end{equation}

\end{document}
```
## 4.5 数组和矩阵
* array 环境，用法与 tabular 环境极为类似，也需要定义列格式，并用 \\\ 换行。数组可作为一个公式块，在外套用 \left、\right 等定界符
```tex
\documentclass{article}
\begin{document}

\[ \mathbf{X} = \left(
\begin{array}{cccc}
x_{11} & x_{12} & \ldots & x_{1n}\\
x_{21} & x_{22} & \ldots & x_{2n}\\
\vdots & \vdots & \ddots & \vdots\\
x_{n1} & x_{n2} & \ldots & x_{nn}\\
\end{array} \right) \]

\end{document}
```
```tex
\documentclass{article}
\usepackage{amsmath}
\begin{document}

\[ |x| = \left\{
\begin{array}{rl}
-x & \text{if } x < 0,\\
0 & \text{if } x = 0,\\
x & \text{if } x > 0.
\end{array} \right. \]

\end{document}
```
* amsmath 提供的 cases环境
```tex
\documentclass{article}
\usepackage{amsmath}
\begin{document}

\[ |x| =
\begin{cases}
-x & \text{if } x < 0,\\
0 & \text{if } x = 0,\\
x & \text{if } x > 0.
\end{cases} \]

\end{document}
```
* amsmath 宏包还直接提供了多种排版矩阵的环境，包括不带定界符的 matrix，以及带各种定界符的矩阵 pmatrix(()、bmatrix([)、Bmatrix({)、vmatrix(|)、Vmatrix(||)。使用这些环境时，无需给定列格式
```tex
\documentclass{article}
\usepackage{amsmath}
\begin{document}

\[
\begin{matrix}
1 & 2 \\ 3 & 4
\end{matrix} \qquad
\begin{bmatrix}
x_{11} & x_{12} & \ldots & x_{1n}\\
x_{21} & x_{22} & \ldots & x_{2n}\\
\vdots & \vdots & \ddots & \vdots\\
x_{n1} & x_{n2} & \ldots & x_{nn}\\
\end{bmatrix}
\]

\end{document}
```
* 在矩阵中的元素里排版分式时，一来要用到 \dfrac 等命令，二来行与行之间有可能紧贴着，这时要调节间距
```tex
\documentclass{article}
\usepackage{amsmath}
\begin{document}

\[
\mathbf{H}=
\begin{bmatrix}
\dfrac{\partial^2 f}{\partial x^2} &
\dfrac{\partial^2 f}
{\partial x \partial y} \\[8pt]
\dfrac{\partial^2 f}
{\partial x \partial y} &
\dfrac{\partial^2 f}{\partial y^2}
\end{bmatrix}
\]

\end{document}
```
## 4.6 公式中的间距
* 修正积分的被积函数 f(x) 和微元 dx 之间的距离。注意微元里的 d 用的是直立体
```tex
\documentclass{article}
\begin{document}

\[
\int_a^b f(x)\mathrm{d}x
\qquad
\int_a^b f(x)\,\mathrm{d}x
\]

\end{document}
```
* 另一个用途是生成多重积分号。如果我们直接连写两个 \int，之间的间距将会过宽，此时可以使用负间距 \! 修正之。不过 amsmath 提供了更方便的多重积分号，如二重积分 \iint、三重积分 \iiint 等
```tex
\documentclass{article}
\usepackage{amsmath}
\begin{document}

\newcommand\diff{\,\mathrm{d}}
\begin{gather*}
\int\int f(x)g(y)
\diff x \diff y \\
\int\!\!\!\int
f(x)g(y) \diff x \diff y \\
\iint f(x)g(y) \diff x \diff y \\
\iint\quad \iiint\quad \idotsint
\end{gather*}

\end{document}
```
## 4.7 数学符号的字体控制
### 4.7.1 数学字母字体
```tex
\documentclass{article}
\usepackage{amssymb}
\begin{document}

$\mathcal{R} \quad \mathfrak{R}
\quad \mathbb{R}$
\[\mathcal{L}
= -\frac{1}{4}F_{\mu\nu}F^{\mu\nu}\]
$\mathfrak{su}(2)$ and
$\mathfrak{so}(3)$ Lie algebra

\end{document}
```
### 4.7.3 加粗的数学符号
* 果想得到粗斜体，可以使用 amsmath 宏包提供的 \boldsymbol 命令
* 也可以使用 bm 宏包提供的 \bm 命令
```tex
\documentclass{article}
\usepackage{amssymb}
\usepackage{bm}
\begin{document}

$\mu, M \qquad
\boldsymbol{\mu}, \boldsymbol{M}$

$\mu, M \qquad \bm{\mu}, \bm{M}$

\end{document}
```
### 4.7.3 数学符号对的尺寸
* 从大到小包括行间公式尺寸\displaystyle、行内公式尺寸\textstyle、上下标尺寸\scriptstyle、次级上下标尺寸\scriptscriptstyle
```tex
\documentclass{article}
\begin{document}

\[
r = \frac
{\sum_{i=1}^n (x_i- x)(y_i- y)}
{\displaystyle \left[
\sum_{i=1}^n (x_i-x)^2
\sum_{i=1}^n (y_i-y)^2
\right]^{1/2} }
\]

\end{document}
```
## 4.8 定理环境
### 4.8.1 LATEX原始的定理环境
```tex
\newtheorem{⟨theorem environment⟩}{⟨title⟩}[⟨section-level⟩]
\newtheorem{⟨theorem environment⟩}[⟨counter⟩]{⟨title⟩}
```
* ⟨theorem environment⟩ 为定理环境的名称。
* ⟨title⟩ 是定理环境的标题（“定理”，“公理”等）
* 定理的序号由两个可选参数之一决定，它们不能同时使用：⟨section level⟩ 为章节级别，如 chapter、section 等，定理序号成为章节的下一级序号；⟨counter⟩ 为用 \newcounter 自定义的计数器名称，定理序号由这个计数器管理。
* 两个可选参数都不用的话，则使用默认的与定理环境同名的计数器
```tex
\documentclass{article}
\begin{document}

\newtheorem{mythm}{My Theorem}[section]
\begin{mythm}\label{thm:light}
The light speed in vacuum
is $299,792,458\,\mathrm{m/s}$.
\end{mythm}
\begin{mythm}[Energy-momentum relation]
The relationship of energy,
momentum and mass is
\[E^2 = m_0^2 c^4 + p^2 c^2\]
where $c$ is the light speed
described in theorem \ref{thm:light}.
\end{mythm}

\end{document}
```
### 4.8.2 amsthrm宏包
* amsthm 预定义了三种格式用于 \theoremstyle：plain 和 LATEX 原始的格式一致；definition 使用粗体标签、正体内容；remark 使用斜体标签、正体内容。
* amsthm 还支持用带星号的 \newtheorem* 定义不带序号的定理环境
```tex
\theoremstyle{definition} \newtheorem{law}{Law}
\theoremstyle{plain} \newtheorem{jury}[law]{Jury}
\theoremstyle{remark} \newtheorem*{mar}{Margaret}
```
```tex
\documentclass{article}
\usepackage{amsthm}
\begin{document}

\begin{law}\label{law:box}
Don't hide in the witness box.
\end{law}
\begin{jury}[The Twelve]
It could be you! So beware and
see law~\ref{law:box}.\end{jury}
\begin{jury}
You will disregard the last
statement.\end{jury}
\begin{mar}No, No, No\end{mar}
\begin{mar}Denis!\end{mar}

\end{document}
```
amsthm 还支持使用 \newtheoremstyle 命令自定义定理格式，更为方便使用的是 ntheorem宏包
### 4.8.3 证明环境和证毕符号
* amsthm 还提供了一个 proof 环境用于排版定理的证明过程。proof 环境末尾自动加上一个证毕符号
```tex
\documentclass{article}
\usepackage{amsthm}
\begin{document}

\begin{proof}
For simplicity, we use
\[
E=mc^2
\]
That's it.
\end{proof}

\end{document}
```
* 如果行末是一个不带编号的公式，符号会另起一行，这时可使用 \qedhere 命令将符号放在公式末尾
```tex
\documentclass{article}
\usepackage{amsthm}
\begin{document}

\begin{proof}
For simplicity, we use
\[
E=mc^2 \qedhere
\]
\end{proof}

\end{document}
```
* \qedhere 对于 align* 等环境也有效
```tex
\documentclass{article}
\usepackage{amsmath}
\usepackage{amsthm}
\begin{document}

\begin{proof}
Assuming $\gamma
= 1/\sqrt{1-v^2/c^2}$, then
\begin{align*}
E &= \gamma m_0 c^2 \\
p &= \gamma m_0v \qedhere
\end{align*}
\end{proof}

\end{document}
```
* 在使用带编号的公式时，建议最好不要在公式末尾使用 \qedhere 命令
```tex
\documentclass{article}
\usepackage{amsthm}
\begin{document}

\begin{proof}
For simplicity, we use
\begin{equation}
E=mc^2.\qedhere
\end{equation}
\end{proof}

\end{document}
```
* 证毕符号本身被定义在命令 \qedsymbol 中，如果有使用实心符号作为证毕符号的需求，需要自行用 \renewcommand 命令修改
```tex
\documentclass{article}
\usepackage{amsthm}
\begin{document}

\renewcommand{\qedsymbol}%
{\rule{1ex}{1.5ex}}
\begin{proof}
For simplicity, we use
\[
E=mc^2 \qedhere
\]
\end{proof}

\end{document}
```
## 4.9 符号表
### 4.9.1 LaTeX普通符号
### 4.9.2 AMS符号

# 第五章 排版样式设定
## 5.1 字体和字号
```tex
\documentclass{article}
\begin{document}

{\small The small and
\textbf{bold} Romans ruled}
{\Large all of great big
{\itshape Italy}.}

\end{document}
```
### 5.1.1 字体样式
### 5.1.2 字号
```tex
\documentclass{article}
\begin{document}

He likes {\LARGE large and
{\small small} letters}.

\end{document}
```
`\fontsize{⟨size⟩}{⟨base line-skip⟩}`
* ⟨size⟩ 为字号，⟨base line-skip⟩ 为基础行距
* 如果不是在导言区，\fontsize 的设定需要 \selectfont 命令才能立即生效
### 5.1.3 选用字体宏包
### 5.1.4 字体编码
`\usepackage[T1]{fontenc}` 切换字体编码
### 5.1.5 使用fontspec宏包更改字体
```tex
\setmainfont{⟨font name⟩}[⟨font features⟩]
\setsansfont{⟨font name⟩}[⟨font features⟩]
\setmonofont{⟨font name⟩}[⟨font features⟩]
```
* ⟨font name⟩ 使用字体的文件名（带扩展名）或者字体的英文名称。
* ⟨font features⟩ 用来手动配置对应的粗体或斜体，比如为 Windows 下的无衬线字体 Arial 配置粗体和斜体（通常情况下自动检测并设置对应的粗体和斜体，无需手动指定）
`\setsansfont{Arial}[BoldFont={Arial Bold}, ItalicFont={Arial Italic}]`
* fontspec 宏包会覆盖数学字体设置。需要调用一些数学字体宏包时，应当在调用 fontspec 宏包时指定 no-math 选项。fontspec 宏包可能被其它宏包或文档类（如 ctex 文档类）自动调用时，则在文档开头的 \documentclass 命令里指定 no-math 选项
### 5.1.6 在ctex宏包或文档类中更改中文字体
```tex
\setCJKmainfont{⟨font name⟩}[⟨font features⟩]
\setCJKsansfont{⟨font name⟩}[⟨font features⟩]
\setCJKmonofont{⟨font name⟩}[⟨font features⟩]
```
* 由于中文字体少有对应的粗体或斜体，⟨font features⟩ 里多用其他字体来配置，比如在 Windows 中设定基本字体为宋体，并设定对应的 BoldFont 为黑体，ItalicFont 为楷体
`\setCJKmainfont{SimSun}[BoldFont=SimHei, ItalicFont=KaiTi]`
### 5.1.7 使用unicode-math宏包配置Unicode数学字体
* 在导言区使用 \usepackage{unicode-math} 后，使用 \setmathfont 命令即可
`\setmathfont{⟨font name⟩}[⟨font features⟩]`
## 5.2 文字装饰和强调
* \underline 命令用来为文字添加下划线
```tex
\documentclass{article}
\begin{document}

An \underline{underlined} text.

\end{document}
```
* ulem 宏包提供了更灵活的解决方案，它提供的 \uline 命令能够轻松生成自动换行的下划线
```tex
\documentclass{article}
\usepackage{ulem}
\begin{document}

An example of \uline{some
long and underlined words.}

\end{document}
```
* \emph 命令，将文字变为斜体以示强调，而如果在已强调的文字中嵌套使用 \emph 命令，命令内则使用直立体文字
```tex
\documentclass{article}
\begin{document}

Some \emph{emphasized words,
including \emph{double-emphasized}
words}, are shown here.

\end{document}
```
## 5.3 段落格式和间距
### 5.3.1 长度和长度变量
`\newlength{\⟨length command⟩}` 自定义长度变量
```tex
\setlength{\⟨length command⟩}{⟨length⟩}
\addtolength{\⟨length command⟩}{⟨length⟩}
```
### 5.3.2 行距
`\linespread{⟨factor⟩}`
* 其中 ⟨factor⟩ 作用于基础行距而不是字号。缺省的基础行距是 1.2 倍字号大小（参考 \fontsize 命令），因此使用 \linespread{1.5} 意味着最终行距为 1.8 倍的字号大小
* 如果不是在导言区全局修改，而想要局部地改变某个段落的行距，需要用 \selectfont 命令使 \linespread 命令的改动立即生效
```tex
\documentclass{article}
\begin{document}

{\linespread{2.0}\selectfont
The baseline skip is set to be
twice the normal baseline skip.
Pay attention to the \verb|\par|
command at the end. \par}

In comparison, after the
curly brace has been closed,
everything is back to normal.

\end{document}
```
```tex
\documentclass{article}
\begin{document}

{\Large Don't read this!
It is not true.
You can believe me!\par}

{\Large This is not true either.
But remember I am a liar.}\par

\end{document}
```
### 5.3.3 段落格式
* 段落的左缩进、右缩进和首行缩进
```tex
\setlength{\leftskip}{⟨length⟩}
\setlength{\rightskip}{⟨length⟩}
\setlength{\parindent}{⟨length⟩}
```
* 控制段落缩进
```tex
\indent
\noindent
```
* 段落间的垂直间距为 \parskip，如设置段落间距在 0.8ex 到 1.5ex 变动
`\setlength{\parskip}{1ex plus 0.5ex minus 0.2ex}`
### 5.3.4 水平间距
```tex
This\hspace{1.5cm}is a space
of 1.5 cm.
```
* 使用 \hspace* 命令代替 \hspace 命令得到不会因断行而消失的水平间距
* 命令 \stretch{⟨n⟩} 生成一个特殊弹性长度，参数 ⟨n⟩ 为权重。它的基础长度为 0pt，但可以无限延伸，直到占满可用的空间。如果同一行内出现多个 \stretch{⟨n⟩}，这一行的所有可用空间将按每个 \stretch 命令给定的权重 ⟨n⟩ 进行分配
* 命令 \fill 相当于 \stretch{1}
```tex
\documentclass{article}
\begin{document}

x\hspace{\stretch{1}}
x\hspace{\stretch{3}}
x\hspace{\fill}x

\end{document}
```
* 在正文中用 \hspace 命令生成水平间距时，往往使用 em 作为单位，生成的间距随字号大小而变。我们在数学公式中见过 \quad 和 \qquad 命令，它们也可以用于文本中，分别相当于 \hspace{1em} 和 \hspace{2em}
```tex
\documentclass{article}
\begin{document}

{\Large big\hspace{1em}y}\\
{\Large big\quad y}\\
nor\hspace{2em}mal\\
nor\qquad mal\\
{\tiny tin\hspace{1em}y}\\
{\tiny tin\quad y}

\end{document}
```
### 5.3.5 垂直间距
```tex
\documentclass{article}
\begin{document}

A paragraph.

\vspace{2ex}
Another paragraph.

\end{document}
```
* \vspace* 命令产生不会因断页而消失的垂直间距。
* \vspace 也可用 \stretch 设置无限延伸的垂直长度。
* 段落内的两行之间增加垂直间距，一般通过给断行命令 \\\\ 加可选参数，如 \\\\[6pt] 或 \\\\*[6pt]。\vspace 也可以在段落内使用，区别在于 \vspace 只引入垂直间距而不断行
```tex
\documentclass{article}
\begin{document}

Use command \verb|\vspace{12pt}|
to add \vspace{12pt} some spaces
between lines in a paragraph.

Or you can use \verb|\\[12pt]|
to \\[12pt] add vertical space,
but it also breaks the line.

\end{document}
```
* \bigskip, \medskip, \smallskip 来增加预定义长度的垂直间距
```tex
\documentclass{article}
\begin{document}

\parbox[t]{3em}{TeX\par TeX}
\parbox[t]{3em}{TeX\par\smallskip TeX}
\parbox[t]{3em}{TeX\par\medskip TeX}
\parbox[t]{3em}{TeX\par\bigskip TeX}

\end{document}
```
## 5.4 页面和分栏
### 5.4.1 利用geometry宏包设置页面参数
* 调用 geometry 宏包，然后用其提供的 \geometry 命令设置页面参数
```tex
\usepackage{geometry}
\geometry{⟨geometry-settings⟩}
```
* 直接在宏包选项中设置
```tex
\usepackage[⟨geometry-settings⟩]{geometry}
```
* ⟨geometry-settings⟩ 多以 ⟨key⟩=⟨value⟩ 的形式组织
* 符合 Microsoft Word 习惯的页面设定是 A4 纸张，上下边距 1 英寸，左右边距 1.25 英寸，于是我们可以通过如下两种等效的方式之一设定页边距
```tex
\geometry{a4paper,left=1.25in,right=1.25in,top=1in,bottom=1in}
% or like this:
\geometry{a4paper,hmargin=1.25in,vmargin=1in}
```
* 设定周围的边距一致为 1.25 英寸
```tex
\geometry{margin=1.25in}
```
* 对于书籍等双面文档，习惯上奇数页右边、偶数页左边留出较大的页边距，而靠近书脊一侧
的奇数页左边、偶数页右边页边距较小
```tex
\geometry{inner=1in,outer=1.25in}
```
### 5.4.2 页面内容的垂直对齐
* 以下命令分别令页面在垂直方向向顶部对齐/分散对齐
```tex
\raggedbottom
\flushbottom
```
### 5.4.3 分栏
* 标准文档类的全局选项 onecolumn、twocolumn 可控制全文分单栏或双栏排版
```tex
\onecolumn
\twocolumn[⟨one-column top material⟩]
```
* \twocolumn 支持带一个可选参数，用于排版双栏之上的一部分单栏内容。
* 切换单/双栏排版时总是会另起一页（\clearpage）。在双栏模式下使用 \newpage 会换栏而
不是换页；\clearpage 则能够换页
* multicol，它提供了简单的 multicols 环境自动产生分栏，如以下环境将内容分为 3 栏
```tex
\begin{multicols}{3}
...
\end{multicols}
```
* 在 multicols 环境中无法正常使用 table 和 figure 等浮动体环境，它会直接让浮动体丢失。multicols 环境中只能用跨栏的 table* 和 figure* 环境，或者用 float 宏包提供的 H 参数固定浮动体的位置
## 5.5 页眉页脚
### 5.5.1 基本的页眉页脚样式
* 修改页眉页脚的样式
`\pagestyle{⟨page-style⟩}`
* 只影响当页的页眉页脚样式
`\thispagestyle{⟨page-style⟩}`
* \pagenumbering 命令令我们能够改变页眉页脚中的页码样式
`\pagenumbering{⟨style⟩}`
* ⟨style⟩ 为页码样式，默认为 arabic（阿拉伯数字），还可修改为 roman（小写罗马数字）、Roman（大写罗马数字）等。
* 注意使用 \pagenumbering 命令后会将页码重置为 1。book 文档类的 \frontmatter 和 \mainmatter 内部就使用了 \pagenumbering 命令切换页码样式
### 5.5.2 手动更改页眉页脚的内容
```tex
\markright{⟨right-mark⟩}
\markboth{⟨left-mark⟩}{⟨right-mark⟩}
```
* left-mark⟩ 和 ⟨right-mark⟩ 的内容分别预期出现在左页（偶数页）和右页（奇数页）。
* \chapter 和 \section 等章节命令内部也使用 \markboth 或者 \markright 生成页眉。
* LATEX 默认将页眉的内容都转为大写字母。如果需要保持字母的大小写，可以尝试以下代码
```tex
\renewcommand\chaptermark[1]{%
\markboth{Chapter \thechapter\quad #1}{}}
\renewcommand\sectionmark[1]{%
\markright{\thesection\quad #1}}
```
* 其中 \thechapter、\thesection 等命令为章节计数器的数值。以上代码适用于 report / book 文档类。对于 article 文档类，与两个页眉相关的命令分别为 \sectionmark和 \subsectionmark。
### 5.5.3 fancyhdr宏包
```tex
\fancyhf[⟨position⟩]{…}
\fancyhead[⟨position⟩]{…}
\fancyfoot[⟨position⟩]{…}
```
*  ⟨position⟩ 为 L（左）/C（中）/R（右）以及与 O（奇数页）/E（偶数页）字母的组合。
* \fancyhf 用于同时定义页眉和页脚，习惯上使用 \fancyhf{} 来清空页眉页脚的设置
* 将章节标题放在和 headings 一致的位置，但使用加粗格式；页码都放在页脚正中；修改横线宽度，“去掉”页脚的横线
```tex
% 在导言区使用此代码
\usepackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\fancyhf{}
\fancyfoot[C]{\bfseries\thepage}
\fancyhead[LO]{\bfseries\rightmark}
\fancyhead[RE]{\bfseries\leftmark}
\renewcommand{\headrulewidth}{0.4pt} % 注意不用 \setlength
\renewcommand{\footrulewidth}{0pt}
```
* fancyhdr 还支持用 \fancypagestyle 为自定义的页眉页脚样式命名，或者重新定义已有的样式如 plain 等
```tex
% 自定义 myfancy 样式
\fancypagestyle{myfancy}{%
\fancyhf{}
\fancyhead{...}
\fancyfoot{...}
}
% 使用样式
\pagestyle{myfancy}
```

# 第六章 特色工具和功能
## 6.1 参考文献和BIBTEX工具
### 6.1.1 基本的参考文献和引用
`\cite{⟨citation⟩}` 在正文中引用参考文献
* ⟨citation⟩ 为引用的参考文献的标签，类似 \ref 里的参数；\cite 带一个可选参数，为引用的编号后加上额外的内容，如 \cite[page 22]{Paper2013} 可能得到形如 [13, page 22] 这样的引用。
* 参考文献由 thebibliography 环境包裹。每条参考文献由 \bibitem 开头，其后是参考文献本身的内容
```tex
\begin{thebibliography}{⟨widest label⟩}
\bibitem[⟨item number⟩]{⟨citation⟩} ...
\end{thebibliography}
```
* ⟨citation⟩ 是 \cite 使用的文献标签，⟨item number⟩ 自定义参考文献的序号，如果省略，则按自然排序给定序号。⟨widest label⟩ 用以限制参考文献序号的宽度，如 99 意味着不超过两位数字。通常设定为与参考文献的数目一致
* thebibliography 环境自动生成不带编号的一节（article 文档类）或一 （report / book 文档类）。在 article 文档类的节标题默认为“References”，而在 report / book 文档类的章标题默认为“Bibliography”。
```tex
\documentclass{article}
\begin{document}

\section{Introduction}
Partl~\cite{germenTeX} has proposed that \ldots

\begin{thebibliography}{99}
\bibitem{germenTeX} H.~Partl: \emph{German \TeX},
TUGboat Volume~9, Issue~1 (1988)
\end{thebibliography}

\end{document}
```
### 6.1.2 BIBTEX数据库
* BIBTEX 数据库以 .bib 作为扩展名，其内容是若干个文献条目，每个条目的格式为
```tex
@⟨type⟩{⟨citation⟩,
⟨key1⟩ = {⟨value1⟩},
⟨key2⟩ = {⟨value2⟩},
…
}

```
* ⟨type⟩ 为文献的类别，如 article 为学术论文，book 为书籍，incollection 为论文集中的某一篇
* ⟨citation⟩ 为 \cite 命令使用的文献标签
* 在 ⟨citation⟩ 之后为条目里的各个字段，以 ⟨key⟩ = {⟨value⟩} 的形式组织
* article 学术论文，必需字段有 author, title, journal, year; 可选字段包括 volume, number, pages, doi 等；
* book 书籍，必需字段有 author/editor, title, publisher, year; 可选字段包括 volume/number, series, address 等；
* incollection 论文集中的一篇，必需字段有 author, title, booktitle, publisher, year; 可选字段包括 editor, volume/number, chapter, pages, address 等；
* inbook 书中的一章，必需字段有 author/editor, title, chapter/pages, publisher, year; 可选字段包括 volume/number, series, address 等
```tex
@article{Alice13,
title = {Demostration of bibliography items},
author = {Alice Axford and Bob Birkin and Charlie Copper and Danny Dannford},
year = {2013},
month = {Mar},
journal = {Journal of \TeX perts},
volume = {36},
number = {7},
pages = {114-120}}
```
### 6.1.3 BIBTEX样式
* BIBTEX 提供了几个预定义的样式，如 plain, unsrt, alpha 等。如果使用期刊模板的话，可能会提供自用的样式。样式文件以 .bst 为扩展名
* 使用样式文件的方法是在源代码内（一般在导言区）使用 \bibliographystyle 命令
`\bibliographystyle{⟨bst-name⟩}`
* ⟨bst-name⟩ 为 .bst 样式文件的名称，不要带 .bst 扩展名
### 6.1.4 使用BIBTEX排版参考文献
* 第一步：准备一份 BIBTEX 数据库，假设数据库文件名为 books.bib，和 LATEX 源代码一般位于同一个目录下。
* 第二步：在源代码中添加必要的命令。假设源代码名为 demo.tex。
	1. 首先需要使用命令 \bibliographystyle 设定参考文献的格式。
	2. 其次，在正文中引用参考文献。BIBTEX 程序在生成参考文献列表的时候，通常只列出用了\cite 命令引用的那些。如果需要列出未被引用的文献，则需要 \nocite{⟨citation⟩} 命令；而 \nocite{*} 则让所有未被引用的文献都列出。
	3. 再次，在需要列出参考文献的位置，使用 \bibliography 命令代替 thebibliography 环境：
	`\bibliography{⟨bib-name⟩}`
	其中 ⟨bib-name⟩ 是 BIBTEX 数据库的文件名，不要带 .bib 扩展名
```tex
\documentclass{article}
\bibliographystyle{plain}
\begin{document}
\section{Some words}
Some excellent books, for example, \cite{citation1}
and \cite{citation2} \ldots

\bibliography{books}
\end{document}
```
* 第三步：写好了以上两个文件之后，我们就可以开始编译了
	1. 首先使用 pdflatex 或 xelatex 等命令编译 LATEX 源代码 demo.tex；
	2. 接下来用 bibtex 命令处理 demo.aux 辅助文件记录的参考文献格式、引用条目等信息。bibtex 命令处理完毕后会生成 demo.bbl 文件，内容就是一个 thebibliography 环境；
	3. 再使用 pdflatex 或 xelatex 等命令把源代码 demo.tex 编译两遍，读入参考文献并正确生成引用。
* 整个过程使用的命令如下
```shell
xelatex demo
bibtex demo
xelatex demo
xelatex demo
```
### 6.1.5 natbib宏包
* natbib 宏包在正文中支持两种引用方式
```tex
\citep{⟨citation⟩}
\citet{⟨citation⟩}
```
* 分别生成形如 (Axford et al., 2013) 和 Axford et al. (2013) 的人名——年份引用
### 6.1.6 biblatex宏包
* 文档结构和 biblatex 相关命令
	1. 首先是在导言区调用 biblatex 宏包。宏包支持以 ⟨key⟩=⟨value⟩ 形式指定选项，包括参考文献样式 style、参考文献著录排序的规则 sorting 等。
	2. 接着在导言区使用 \addbibresource 命令为 biblatex 引入参考文献数据库。与基于 BIBTEX的传统方式不同的是，这里需要写完整的文件名。
	3. 在正文中使用 \cite 命令引用参考文献。除此之外还可以使用丰富的命令达到不同的引用效果，如 \citeauthor 和 \citeyear 分别单独引用作者和年份，\textcite 和 \parencite分别类似 natbib 宏包提供的 \citet 和 \citep 命令，以及脚注式引用 \footcite 等。
	4. 最后在需要排版参考文献的位置使用命令 \printbibliography。
* 编译方式
```shell
xelatex demo
biber demo
xelatex demo
xelatex demo
```
```tex
% File: egbibdata.bib
@book{caimin2006,
title = {UML 基础和 Rose 建模教程},
address = {北京},
author = {蔡敏 and 徐慧慧 and 黄柄强},
publisher = {人民邮电出版社},
year = {2006},
month = {1}
}

% File: demo.tex
\documentclass{ctexart}
% 使用符合 GB/T 7714-2015 规范的参考文献样式
\usepackage[style=gb7714-2015]{biblatex}
% 注意加 .bib 扩展名
\addbibresource{egbibdata.bib}

\begin{document}

见文献\cite{caimin2006}。

\printbibliography
\end{document}
```
* biblatex 样式和其它选项
```tex
% 同时调用 gb7714-2015.bbx 和 gb7714-2015.cbx
\usepackage[style=gb7714-2015]{biblatex}
% 著录样式调用 gb7714-2015.bbx，引用样式调用 biblatex 宏包自带的 authoryear
\usepackage[bibstyle=gb7714-2015,citestyle=authoryear]{biblatex}
```
## 6.2 索引和makeindex工具
### 6.2.1 使用makeindex工具的方法
* 第一步，在 LATEX 源代码的导言区调用 makeidx 宏包，并使用 \makeindex 命令开启索引的收集：
```tex
\usepackage{makeidx}
\makeindex
```
* 第二步，在正文中需要索引的地方使用 \index 命令。\index 命令的参数写法详见下一小节；并在需要输出索引的地方（如所有章节之后）使用 \printindex 命令。
* 第三步，编译过程：
	1. 首先用 xelatex 等命令编译源代码 demo.tex。编译过程中产生索引记录文件 demo.idx；
	2. 用 makeindex 程序处理 demo.idx，生成用于排版的索引列表文件 demo.ind；
	3. 再次编译源代码 demo.tex，正确生成索引列表。
### 6.2.2 索引项的写法
* 添加索引项
`\index{⟨index entry⟩}`
* ⟨index entry⟩ 为索引项
* 其中 !、@ 和 | 为特殊符号，如果要向索引项直接输出这些符号，需要加前缀 "；而 " 需要输入两个引号 "" 才能输出到索引项
```tex
Test index.
\index{Test@\textsf{""Test}|(textbf}
\index{Test@\textsf{""Test}!sub@"|sub"||see{Test}}
\newpage
Test index.
\index{Test@\textsf{""Test}|)textbf}
```
## 6.3 使用颜色
### 6.3.1 颜色的表达方式
* 调用 color 或 xcolor 宏包后
```tex
\color[⟨color-mode⟩]{⟨code⟩}
\color{⟨color-name⟩}
```
```tex
\documentclass{ctexart}
\usepackage{color}
\begin{document}

\large\sffamily
{\color[gray]{0.6}
60\% 灰色} \\
{\color[rgb]{0,1,1}
青色}

\end{document}
```
```tex
\documentclass{ctexart}
\usepackage{color}
\begin{document}

\large\sffamily
{\color{red} 红色} \\
{\color{blue} 蓝色}

\end{document}
```
```tex
\documentclass{article}
\usepackage{xcolor}
\begin{document}

\large\sffamily
{\color{red!40} 40\% 红色}\\
{\color{blue}蓝色
\color{blue!50!black}蓝黑
\color{black}黑色}\\
{\color{-red}红色的互补色}

\end{document}
```
* 自定义颜色名称，注意这里的 ⟨color-mode⟩ 是必选参数
`\definecolor{⟨color-name⟩}{⟨color-mode⟩}{⟨code⟩}`
### 6.3.2 带颜色的文本和盒子
* 输入带颜色的文本可以用类似 \textbf 的命令
```tex
\textcolor[⟨color-mode⟩]{⟨code⟩}{⟨text⟩}
\textcolor{⟨color-name⟩}{⟨text⟩}
```
* 构造一个带背景色的盒子，⟨material⟩ 为盒子中的内容
```tex
\colorbox[⟨color-mode⟩]{⟨code⟩}{⟨material⟩}
\colorbox{⟨color-name⟩}{⟨material⟩}
```
* 构造一个带背景色和有色边框的盒子，⟨fcode⟩ 或 ⟨fcolor-name⟩ 用于设置边框颜
色
```tex
\fcolorbox[⟨color-mode⟩]{⟨fcode⟩}{⟨code⟩}{⟨material⟩}
\fcolorbox{⟨fcolor-name⟩}{⟨color-name⟩}{⟨material⟩}
```
```tex
\documentclass{ctexart}
\usepackage{color}
\begin{document}

\sffamily
文字用\textcolor{red}{红色}强调\\
\colorbox[gray]{0.95}{浅灰色背景} \\
\fcolorbox{blue}{yellow}{%
\textcolor{blue}{蓝色边框+文字，%
黄色背景}
}

\end{document}
```
## 6.4 使用超链接
### 6.4.1 hyperref宏包
* hyperref 宏包涉及的链接遍布 LATEX 的每一个角落——目录、引用、脚注、索引、参考文献等等都被封装成超链接。为减少可能的冲突，习惯上将 hyperref 宏包放在其它宏包之后调用
```tex
\hypersetup{⟨option1⟩,⟨option2⟩={value},…}
\usepackage[⟨option1⟩,⟨option2⟩={value},…]{hyperref}
```
### 6.4.2 超链接
* hyperref 宏包提供了直接书写超链接的命令，用于在 PDF 中生成 URL
```tex
\url{⟨url⟩}
\nolinkurl{⟨url⟩}
```
* 一段文字作为超链接
`\href{⟨url⟩}{⟨text⟩}`
```tex
\documentclass{article}
\usepackage{hyperref}
\begin{document}

\url{https://wikipedia.org} \\
\nolinkurl{https://wikipedia.org} \\
\href{https://wikipedia.org}{Wiki}

\end{document}
```
* 使用 hyperref 宏包后，文档中所有的引用、参考文献、索引等等都转换为超链接
* 用户也可对某个 \label 命令定义的标签 ⟨label⟩ 作超链接
`\hyperref[⟨label⟩]{⟨text⟩}`
* 默认的超链接在文字外边加上一个带颜色的边框（在打印 PDF 时边框不会打印），可指定colorlinks 参数修改为将文字本身加上颜色，或修改 pdfborder 参数调整边框宽度以“去掉”边框；hidelinks 参数则令超链接既不变色也不加边框
```tex
\hypersetup{hidelinks}
% or:
\hypersetup{pdfborder={0 0 0}}
```
### 6.4.3 PDF书签
* hyperref 宏包另一个强大的功能是为 PDF 生成书签。对于章节命令 \chapter、\section等，默认情况下会为 PDF 自动生成书签
* hyperref 还提供了手动生成书签的命令
`\pdfbookmark[⟨level⟩]{⟨bookmark⟩}{⟨anchor⟩}`
* ⟨bookmark⟩ 为书签名称，⟨anchor⟩ 为书签项使用的锚点（类似交叉引用的标签）。可选参数 ⟨level⟩为书签的层级，默认为 0
```tex
\texorpdfstring{⟨LATEX code⟩}{⟨PDF bookmark text⟩}
```
* 在章节名称里使用公式 E = mc2，而书签则使用纯文本形式的 E=mc^2
```tex
\section{质能公式 \texorpdfstring{$E=mc^2$}{E=mc\textasciicircum 2}}
```
### PDF文档属性

# 第七章 绘图功能
## 7.1 绘图语言简介
## 7.2 TikZ绘图语言
```tex
\tikz[...] ⟨tikz code⟩;
\tikz[...] {⟨tikz code 1⟩; ⟨tikz code 2⟩; ...}
\begin{tikzpicture}[...]
⟨tikz code 1⟩;
⟨tikz code 2⟩;
...
\end{tikzpicture}
```
### 7.2.1 TikZ坐标和路径
* 直角坐标下，点的位置写作 (⟨x⟩,⟨y⟩)，坐标 ⟨x⟩ 和 ⟨y⟩ 可以用 LATEX 支持的任意单位表示，缺省为 cm；
* 极坐标下，点的位置写作 (⟨θ⟩:⟨r⟩)。θ 为极角，单位是度。
* 我们还可以为某个点命名：\coordinate (A) at (⟨coordinate⟩) 然后就可以使用 (A) 作为点的位置了
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\draw (0,0) -- (30:1);
\draw (1,0) -- (2,1);
\coordinate (S) at (0,1);
\draw (S) -- (1,1);
\end{tikzpicture}

\end{document}
```
* 垂足形式
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\coordinate (S) at (2,2);
\draw[gray] (-1,2) -- (S);
\draw[gray] (2,-1) -- (S);
\draw[red] (0,0) -- (0,0 -| S);
\draw[blue] (0,0) -- (0,0 |- S);
\end{tikzpicture}

\end{document}
```
* TikZ 最基本的路径为两点之间连线，如 (⟨x1⟩,⟨y1⟩) -- (⟨x2⟩,⟨y2⟩)，可以连用表示多个连线（折线）。连续使用连线时，可以使用 cycle 令路径回到起点，生成闭合的路径
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\draw (0,0) -- (1,1) -- (2,0) -- cycle;
\end{tikzpicture}

\end{document}
```
* 多条路径可用于同一条画图命令中，以空格分隔
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\draw (0,0) -- (0,1)
(1,0) -- (1,1) -- (2,0) -- cycle;
\end{tikzpicture}

\end{document}
```
* 矩形、圆和椭圆
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\draw (0,0) rectangle (1.5,1);
\draw (2.5,0.5) circle [radius=0.5];
\draw (4.5,0.5) ellipse
[x radius=1,y radius=0.5];
\end{tikzpicture}

\end{document}
```
* 直角、圆弧、椭圆弧
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\draw (0,0) |- (1,1);
\draw (1,0) -| (2,1);
\draw (4,0) arc (0:135:1);
\draw (6,0) arc (0:135:1 and 0.5);
\end{tikzpicture}

\end{document}
```
* 正弦、余弦曲线（1/4 周期）
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\draw (0,0) sin (1,1);
\draw (0,1) sin (1,0);
\draw (2,1) cos (3,0);
\draw (2,0) cos (3,1);
\end{tikzpicture}

\end{document}
```
* 抛物线，用 bend 控制顶点
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\draw (0,0) parabola (1,2);
\draw (2,0) parabola
bend (2.25,-0.25) (3,2);
\draw (4,0) parabola
bend (4.75,2.25) (5,2);
\end{tikzpicture}

\end{document}
```
* 二次和三次 Bézier 曲线，分别使用一个和两个控制点
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\draw (0,0) .. controls
(2,1) and (3,1) .. (3,0);
\draw (4,0) .. controls
(5,1) .. (5,0);
\draw[help lines] (0,0)
-- (2,1) -- (3,1) -- (3,0)
(4,0) -- (5,1) -- (5,0);
\end{tikzpicture}

\end{document}
```
* 网格、函数图像，网格可用 step 参数控制网格大小，函数图像用 domain 参数控制定义域
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\draw[help lines,step=0.5]
(-1,-1) grid (1,1);
\draw[->] (-1.5,0) -- (1.5,0);
\draw[->] (0,-1.5) -- (0,1.5);
\draw[domain=-1:1]
plot(\x,{\x*\x*2 -1});
\end{tikzpicture}

\end{document}
```
### 7.2.2 TikZ绘图命令和参数
*  \fill 命令用来填充图形，\filldraw 命令则同时填充和描边
```tex
\draw[...] ⟨path⟩;
\fill[...] ⟨path⟩;
\filldraw[...] ⟨path⟩;
```
* color/draw/fill=⟨color⟩ 为 \draw 或 \fill 等命令指定颜色
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}[thick]
\draw[blue] (0,0) rectangle (1,1);
\filldraw[fill=yellow,draw=red]
(2,0.5) circle [radius=0.5];
\end{tikzpicture}

\end{document}
```
* thick=⟨length⟩/thin/semithick/... 指定线条的粗细
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\draw[ultra thin] (0,0)--(0,2);
\draw[very thin] (0.5,0)--(0.5,2);
\draw[thin] (1,0)--(1,2);
\draw[semithick] (1.5,0)--(1.5,2);
\draw[thick] (2,0)--(2,2);
\draw[very thick] (2.5,0)--(2.5,2);
\draw[ultra thick] (3,0)--(3,2);
\end{tikzpicture}

\end{document}
```
* solid/dashed/dotted/dash dot/dash dot dot 指定线条类型（实线、虚线、点划线等）
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\draw[dashed] (0,0) -- (0,2);
\draw[dotted] (0.5,0) -- (0.5,2);
\draw[dash dot] (1,0) -- (1,2);
\draw[dash dot dot] (1.5,0) -- (1.5,2);
\draw[densely dotted]
(2,0) -- (3,2) -- (4,0) -- cycle;
\end{tikzpicture}

\end{document}
```
* ⟨arrow⟩-⟨arrow⟩ 指定线条首尾的箭头形式。复杂的箭头形式需要在导言区使用 \usetikzlibrary {arrows.meta}
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}[thick]
\draw[->] (0,4) -- (3,4);
\draw[->>] (0,3.5) -- (3,3.5);
\draw[->|] (0,3) -- (3,3);
\draw[<-] (0,2.5) -- (3,2.5);
\draw[<->] (0,2) -- (3,2);
\draw[>->|] (0,1.5) -- (3,1.5);
\draw[-stealth] (0,1) -- (3,1);
\draw[-latex] (0,0.5) -- (3,0.5);
\draw[-to] (0,0) -- (3,0);
\end{tikzpicture}

\end{document}
```
* rounded corners[=⟨radius⟩]/sharp corners 将路径转向处绘制成圆角/直角
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\draw[rounded corners]
(0,0) rectangle (1,1);
\draw (2,0) -- (2,1)
[rounded corners=.3cm]
-- (3,1) -- (3.5,0)
[sharp corners] -- cycle;
\end{tikzpicture}

\end{document}
```
* scale/xshift/yshift/xslant/yslant/rotate 设定图形的缩放、位移和旋转
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\draw[help lines](0,0) rectangle (1,1);
\draw[scale=1.5] (0,0) rectangle (1,1);
\draw[rotate=30] (0,0) rectangle (1,1);
\draw[help lines](2,0) rectangle (3,1);
\draw[yshift=4pt](2,0) rectangle (3,1);
\draw[help lines](4,0) rectangle (5,1);
\draw[xslant=0.4](4,0) rectangle (5,1);
\end{tikzpicture}

\end{document}
```
* 定义一个样式包含绘图参数，然后将样式作为一个参数用于绘图
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
[myarrow/.style={blue,thick,->}]
\draw (0,0)--(0,1)--(2,1);
\draw[myarrow] (0,0)--(2,1);
\draw[myarrow,dotted]
(0,0)--(2,0)--(2,1);
\end{tikzpicture}

\end{document}
```
* scope 环境，令绘图参数或样式在局部生效
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\draw (0,0) rectangle (2.5, 2.5);
\begin{scope}[thick,scale=0.5]
\draw (0,0) rectangle (2.5, 2.5);
\end{scope}
\end{tikzpicture}

\end{document}
```
### 7.2.3 TikZ文字节点
* TikZ 用 \node 命令绘制文字结点
`\node[⟨options⟩] (⟨name⟩) at (⟨coordinate⟩) {⟨text⟩};`
* (⟨name⟩) 为结点命名，类似 \coordinate；at (⟨coordinate⟩) 指定结点的位置。这两者和前面的 ⟨options⟩ 都可以省略，只有 ⟨text⟩ 是必填的
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\node (A) at (0,0) {A};
\node (B) at (1,0) {B};
\node (C) at (60:1) {C};
\draw (A) -- (B) -- (C) -- (A);
\end{tikzpicture}

\end{document}
```
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\coordinate (A) at (1,1);
\fill (A) circle[radius=2pt];
\node[draw,anchor=south] at (A) {a};
\node[draw,below right=4pt] at (A) {b};
\end{tikzpicture}

\end{document}
```
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\draw (0,0) circle[radius=1];
\fill (0,0) circle[radius=2pt];
\node[draw] (P) at (15:2) {center};
\draw[dotted] (0,0) -- (P.west);
\end{tikzpicture}

\end{document}
```
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\draw (2,1.5) node[above] {$A$}
-- node[above left] {$c$}
(0,0) node[left] {$B$}
-- node[below] {$a$}
(2.5,0) node[right] {$C$}
-- node[above right] {$b$}
cycle;
\end{tikzpicture}

\end{document}
```
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\draw[-stealth,line width=0.2pt] (-0.5,0) -- (4.5,0);
\draw[-stealth,line width=0.2pt] (0,-0.5) -- (0,2.5);
\coordinate (a)
at (0.5,1.9);
\coordinate (b)
at (4,1.2);
\node[below] (a0) at (a |- 0,0) {$a$};
\node[below] (b0) at (b |- 0,0) {$b$};
\filldraw[fill=gray!20,draw,thick]
(a0) -- (a) .. controls (1,2.8) and (2.7,0.4) .. (b) -- (b0) -- cycle;
\node[above right,outer sep=0.2cm, rounded corners,
fill=green!20,draw=gray,text=blue!60!black,scale=0.6]
at (b) {$\displaystyle \int_a^b {f(x)\,\mathrm{d}x} = F(b) - F(a)$};
\end{tikzpicture}

\end{document}
```
### 7.2.4 在TikZ中使用循环
* TikZ 通过 pgffor 功能宏包实现了简单的循环功能
`\foreach \a in {⟨list⟩} {⟨commands⟩}`
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\draw (0,0)--(5,0);
\foreach \i in {0.0,0.1,...,5.0}
{\draw[very thin]
(\i,0)--(\i,0.15);}
\foreach \I in {0,1,2,3,4,5}
{\draw (\I,0)--(\I,0.25)
node[above] {\I};}
\end{tikzpicture}

\end{document}
```
```tex
\documentclass{article}
\usepackage{tikz}
\begin{document}

\begin{tikzpicture}
\foreach \n/\t in
{0/\alpha,1/\beta,2/\gamma}
{\node[circle,fill=lightgray,draw]
at (\n,0) {$\t$};}
\end{tikzpicture}

\end{document}
```

# 第八章 自定义$\LaTeX$命令与功能
## 8.1 自定义命令和环境
### 8.1.1 定义新命令
`\newcommand{\⟨name⟩}[⟨num⟩]{⟨definition⟩}`
* ⟨name⟩ 是要定义的命令名称（带反斜线），第二个参数 ⟨definition⟩ 是命令的具体定义。方括号里的参数 ⟨num⟩ 是可选的
```tex
\documentclass{article}
\begin{document}

\newcommand{\tnss}{The not so Short
Introduction to \LaTeXe}
This is ``\tnss'' \ldots{} ``\tnss''

\end{document}
```
* 在命令的定义中，标记 #1 代表指定的参数。如果想使用多个参数，可以依次使用 #2、⋯⋯、#9 等标记
```tex
\documentclass{article}
\begin{document}

\newcommand{\txsit}[1]{This is the
\emph{#1} Short Introduction
to \LaTeXe}
% in the document body:
\begin{itemize}
\item \txsit{not so}
\item \txsit{very}
\end{itemize}

\end{document}
```
* LATEX 不允许使用 \newcommand 定义一个与现有命令重名的命令。如果需要修改命令定义的话，使用 \renewcommand 命令。它使用与命令 \newcommand 相同的语法。
* 在某些情况之下，使用 \providecommand 命令是一种比较理想的方案：在命令未定义时，它相当于 \newcommand；在命令已定义时，沿用已有的定义
### 8.1.2 定义环境
`\newenvironment{⟨name⟩}[⟨num⟩]{⟨before⟩}{⟨after⟩}`
* 在 ⟨before⟩ 中的内容将在此环境包含的文本之前处理，而在 ⟨after⟩ 中的内容将在遇到 \end{⟨name⟩} 命令时处理
```tex
\documentclass{article}
\begin{document}

\newenvironment{king}
{\rule{1ex}{1ex}%
\hspace{\stretch{1}}}
{\hspace{\stretch{1}}%
\rule{1ex}{1ex}}
\begin{king}
My humble subjects \ldots
\end{king}

\end{document}
```
### 8.1.3 xparse宏包简介
```tex
\NewDocumentCommand\⟨name⟩{⟨arg spec⟩}{⟨definition⟩}
\NewDocumentEnvironment{⟨name⟩}{⟨arg spec⟩}{⟨before⟩}{⟨after⟩}
```
* LATEX 2020-10-01 版本之后，xparse 宏包已集成在了格式之中，不需要显式调用
## 8.2 编写自己的宏包和文档类
### 8.2.1 编写简单的宏包
* 写一个宏包的基本工作就是将原本在你的文档导言区里很长的内容拷贝到另一个文件中去，这个文件需要以 .sty 作扩展名。你还需要加入一个宏包专用的命令
`\ProvidesPackage{⟨package name⟩}`
```tex
% Demo Package by Tobias Oetiker
\ProvidesPackage{demopack}
\newcommand{\tnss}{The not so Short Introduction
to \LaTeXe}
\newcommand{\txsit}[1]{The \emph{#1} Short
Introduction to \LaTeXe}
\newenvironment{king}{\begin{quote}}{\end{quote}}
```
* 这个命令应该放在你的宏包的最前面，并且一定要注意：⟨package name⟩ 需要和宏包的文件名一致

### 8.2.2 在宏包中调用其他宏包
`\RequirePackage[⟨options⟩]{⟨package name⟩}`
### 8.2.3 编写自己的文档类
* 自己的文档类以 .cls 作扩展名，开头使用 \ProvidesClass 命令
`\ProvidesClass{⟨class name⟩}`
* {⟨class name⟩} 也需要和文档类的文件名一致
* 在你的文档类中调用其它文档类的命令是 \LoadClass，用法和 \documentclass 十分相像
`\LoadClass[⟨options⟩]{⟨package name⟩}`
## 8.3 计数器
### 8.3.1 定义和修改计数器
`\newcounter{⟨counter name⟩}[⟨parent counter name⟩]`
* ⟨counter name⟩ 为计数器的名称。计数器可以有上下级的关系，可选参数 ⟨parent counter name⟩ 定义为 ⟨counter name⟩ 的上级计数器
* \setcounter 将数值设为 ⟨number⟩；\addtocounter 将数值加上 ⟨number⟩；\stepcounter 将数值加一，并将所有下级计数器归零
```tex
\documentclass{article}
\begin{document}

\setcounter{⟨counter name⟩}{⟨number⟩}
\addtocounter{⟨counter name⟩}{⟨number⟩}
\stepcounter{⟨counter name⟩}

\end{document}
```
### 8.3.2 计数器的输出格式
* 计数器 ⟨counter⟩ 的输出格式由 \the⟨counter⟩ 表示
* 将 equation 计数器的格式定义为大写字母
`\renewcommand\theequation{\Alph{equation}}`
* 标准文档类里对 \subsection 相关的计数器的输出格式的定义相当于
`\renewcommand\thesubsection{\thesection.\arabic{subsection}}`
### 8.3.3 LATEX中的计数器
* 所有章节命令 \chapter、\section 等分别对应计数器 chapter、section 等等，而且有上下级的关系。而计数器 part 是独立的
* 有序列表 enumerate 的各级计数器为 enumi, enumii, enumiii, enumiv，也有上下级的关系
* 图表浮动体的计数器就是 table 和 figure；公式的计数器为 equation。这些计数器在 article 文档类中是独立的，而在 report 和 book 中以 chapter 为上级计数器
* 页码、脚注的计数器分别是 page 和 footnote
* 把页码修改成大写罗马数字，左右加横线，或是给脚注加上方括号
```tex
\renewcommand\thepage{--~\Roman{page}~--}
\renewcommand\thefootnote{[\arabic{footnote}]}
```
* secnumdepth
	* LATEX 标准文档类对章节划分了层级：在 article 文档类里 part 为 0，section 为 1，依此类推；在 report / book 文档类里 part 为 -1，chapter 为 0，section 为 1，等等。
	* secnumdepth 计数器控制章节编号的深度，如果章节的层级大于 secnumdepth，那么章节的标题、在目录和页眉页脚的标题都不编号（照常生成目录和页眉页脚），章节计数器也不计数
	* 可以用 \setcounter 命令设置 secnumdepth 为较大的数使得层级比较深的章节也编号，如设置为 4 令 \paragraph 也编号；或者设置一个较小的数以取消编号，如设置为 -1 令 \chapter不编号
	* secnumdepth 计数器在 article 文档类里默认为 3（subsubsection 一级）；在 report 和 book文档类里默认为 2（subsection 一级）
* tocdepth
	* tocdepth 计数器控制目录的深度，如果章节的层级大于 tocdepth，那么章节将不会自动写入目录项。默认值同 secnumdepth

## 8.4 $\LaTeX$可定制的一些命令和参数
* 标题名称/前后缀等
* 长度

# 附录 A 安装$\TeX$发行版
## A.1 $\TeX$发行版简介
### A.1.1 安装发行版
* 用于 Windows 的批处理文件
	* install-tl-windows.bat 双击启动图形界面安装程序，可以在图形安装界面的 Advanced 选项中定制安装
	* 在命令提示符中输入 install-tl-windows.bat -no-gui 启动文本界面安装程序
* 用于 Linux 的 Perl 脚本 install-tl 
	* install-tl 启动文本界面安装程序
	* install-tl -gui=wizard 启动图形界面安装程序（简单安装）
	* install-tl -gui=peritk 启动图形界面安装程序（定制安装）
* Linux 下 TEX Live 安装完毕后，一般还需要在 root 权限下进行以下操作，使得 XƎLATEX能正确通过 fontspec 等宏包使用字体
	* 将 texlive-fontconfig.conf 文件复制到 /etc/fonts/conf.d/09-texlive.conf
	* 运行 fc-cache -fsv。 
## A.2 安装和更新宏包
* 图形界面的宏包管理器 TEX Live Manager
* 命令行工具安装和更新宏包
```shell
% TeX Live 命令行工具 tlmgr 的使用示例
% 安装/卸载宏包
tlmgr install <package-name>
tlmgr remove <package-name>
% 更新所有宏包（包括 tlmgr 本身）
tlmgr update --all --self
% 列出所有可更新的宏包
tlmgr update --list
% 指定更新源地址
% <CTAN mirrors> 形如 https://mirrors.tuna.tsinghua.edu.cn/CTAN
tlmgr repository set <CTAN mirrors>/systems/texlive/tlnet
% 查看宏包信息，加 --list 参数可列出宏包的所有文件
tlmgr info <package-name>
```
* TEX Live 默认安装所有宏包
### A.2.1 手动安装宏包
* TEX 目录结构（TEX Directory Structure, TDS）。它是 TEX 发行版中宏包、字体、帮助文档等文件的组织结构。TDS 有时也称为TEXMF 树，取 TEX+METAFONT 之意
* 以 TEX Live 为例，假设系统的 TEXMF 树根目录为 C:\texlive\2020\texmf-dist，其下有很多子目录，仅举几例：
tex/latex LATEX 宏包。
doc/latex LATEX 宏包的帮助文档。
source/latex LATEX 宏包的源代码。
bibtex BIBTEX 工具相关文件，许多宏包配套的 BIBTEX 格式文件位于子目录 bst 中。
fonts/tfm TEX 使用的字体文件，TFM 格式。
fonts/type1 PostScript 字体文件（Type1），PFB 格式。
fonts/opentype OpenType 格式的字体文件。
* 手动安装时，尽量不要拷贝到系统的 TEXMF 树，而是拷贝到发行版提供的用户 TEXMF 树，如 TEX Live 的 C:\texlive\texmf-local。安装完成后，还需刷新 TEX 发行版的文件名数据库，令新安装的宏包文件能够被系统找到。TEX Live 用户须在 Windows 命令行或者 Linux 终端执行命令：
`mktexlsr`

# 附录 B 排除错误、寻求帮助
## B.1 $\LaTeX$错误
## B.2 查找帮助文档
`texdoc fancyhdr`
## B.3 常用宏包简介