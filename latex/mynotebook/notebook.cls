% provide class for notebook
\ProvidesClass{notebook}

% load class
\LoadClass[10pt, oneside]{book}

% usepackage
\usepackage{geometry}
\usepackage{hyperref}
\usepackage{xcolor}
\usepackage{tikz}
\usepackage{fontspec}
\usepackage{amsmath, amsthm, amssymb,bm}
\usepackage{titlesec}%chapter1修改为第1章
\usepackage{fancyhdr}
\usepackage{graphicx}%图片插入


% fonts
\setmainfont[Path=fonts/]{msyh.ttc}%衬线字体
\setsansfont[Path=fonts/]{msyh.ttc}%无衬线字体
\setmonofont[Path=fonts/]{msyh.ttc}%等宽字体

% layout
\geometry{a4paper,left=1.25in,right=1.25in,top=1in,bottom=1in}
\linespread{1.2}

% renewcommand
\renewcommand{\contentsname}{\centering\Huge\textbf{目录}}
\renewcommand{\tablename}{表格}
\renewcommand{\figurename}{图形}
\renewcommand{\appendixname}{附录}
\renewcommand{\bibname}{参考文献}
\renewcommand{\indexname}{索引}
\setlength{\parindent}{0ex}
\setlength{\abovecaptionskip}{2ex}
\setlength{\belowcaptionskip}{2ex}
\newtheorem{theorem}{定理}[section]
\newtheorem{definition}[theorem]{定义}
\newtheorem{lemma}[theorem]{引理}
\newtheorem{corollary}[theorem]{推论}
\newtheorem{example}[theorem]{例}
\newtheorem{proposition}[theorem]{命题}

% title page
\title{{\Huge{\textbf{笔记本}}}\\}
\author{\textcolor{green!50!blue}{青藤}}
\date{}

% 
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{}%左页眉
\fancyhead[R]{}%右页眉
\fancyhead[C]{}%中间页眉
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{4pt}%分隔线宽度4磅
\renewcommand{\footrulewidth}{4pt}
% titlespec
\titleformat{\chapter}{\raggedright\Huge\bfseries}{第\,\thechapter\,章}{1em}{}
\titleformat{\section}{\raggedright\Large\bfseries}{\,\thesection\,}{1em}{}
\titleformat{\subsection}{\raggedright\large\bfseries}{\,\thesubsection\,}{1em}{}


