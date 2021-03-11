\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CUC}[isaac]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax

\LoadClass[a4paper, zihao=-4]{ctexart}

\DeclareOption{times}{\setmainfont{Times New Roman}}
\ProcessOptions\relax

% 页边距
\RequirePackage[left=3cm,right=2.3cm,top=2.3cm,bottom=2.6cm]{geometry}

% 页眉页脚
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}                      % 清楚页眉页脚设置
\fancyhead[C]{\fangsong 中国传媒大学本科毕业论文}
\fancyfoot[C]{\fangsong \thepage}

% 前几页的页眉页脚
\fancypagestyle{frontmatterstyle}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot{} % clear all footer fields
    \fancyfoot[C]{\thepage} %
    \renewcommand{\thepage}{\Roman{page}}
}

% 设置 1.25 倍行距
\RequirePackage{setspace}
\renewcommand{\baselinestretch}{1.35}

% 制作 Csection，用来处理计数器以及新开一页
\newcommand\Csection[1]{
  \clearpage
  \setcounter{figure}{0}
  \setcounter{table}{0}
  \setcounter{equation}{0}
  \section{#1}
}

% 英文字体
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

% 设置章节的编号格式
\ctexset{
    section = {
        name={,、},
        number={\chinese{section}},
        format={\centering\heiti\zihao{3}},
        aftername={\enspace},
        beforeskip={24bp},
        afterskip={18bp}
    },
    subsection = {
        name={（,）},
        number={\chinese{subsection}},
        format={\raggedright\heiti\zihao{4}},
        aftername={\enspace},
        beforeskip={24bp},
        afterskip={6bp}
    },
    subsubsection = {
        name={,.},
        number={\arabic{subsubsection}},
        format={\raggedright\heiti\zihao{-4}},
        aftername={\enspace},
        beforeskip={12bp},
        afterskip={6bp}
    }
}

\RequirePackage{titlesec}
\titlespacing{\section}{0pt}{17pt}{16.5pt}
\titlespacing{\subsection}{0pt}{13pt}{13pt}
\titlespacing{\subsubsection}{0pt}{13pt}{13pt}

% 数学公式宏包
\RequirePackage{amsmath}

% 图片宏包
\RequirePackage{graphicx}

% 插图、公式、表格编号样式
% 需在每一个section重置计数器，使用Csection即可一键完成，同时，\countwithin可能是一个更好的选择，但是目前并不会如何设置如2-1这样的样式
\renewcommand {\thetable} {\thesection{} - \arabic{table}} 
\renewcommand {\thefigure} {\thesection{} - \arabic{figure}}
\renewcommand {\theequation} {\thesection{} - \arabic{equation}} 

% 插图、公式、表格编号缩小
\RequirePackage{caption}
\captionsetup{labelformat=default,labelsep=space,font={small}}

% 修改目录样式
\RequirePackage{tocloft}
\setcounter{tocdepth}{2}

    % 目录中间加空格
\renewcommand{\contentsname}{\textmd{\heiti\centerline{目 \quad 录}}}
    % 都加上。。。
\renewcommand{\cftsecleader}{\cftdotfill{0.6}}
\renewcommand{\cftsubsecleader}{\cftdotfill{0.6}}
    % 设置字体
\renewcommand{\cftsecfont}{\heiti}    %设置section条目的字体
\renewcommand{\cftsubsecfont}{\songti} %设置subsection条目的字体
    
% 参考文献【需要自己安装GBT7714 https://github.com/CTeX-org/gbt7714-bibtex-style】
\RequirePackage{gbt7714}

% 中文摘要
\newcommand{\ZhAbstract}[4]{
    \phantomsection     % 超链接
    \pagenumbering{Roman}
    \addcontentsline{toc}{section}{摘 \quad 要}
    % 设置页眉页脚
    \thispagestyle{frontmatterstyle}
    \begin{center}%
        \linespread{1}
        \setlength{\parskip}{24pt}
        \zihao{3}\heiti \bfseries{#1}%
    \end{center}%

    \begin{center}%
        \linespread{1}
        \setlength{\parskip}{24pt}
        \zihao{3}\songti #2%
    \end{center}%
    
    \begin{center}%
        \linespread{1}
        \setlength{\parskip}{24pt}
        \zihao{3}\heiti  摘 \quad 要%
    \end{center}%
    #3
    ~\\
    ~\\
    {\heiti \zihao{-4} 关键词：#4} 
    \newpage
}

% 英文摘要
\newcommand{\EnAbstract}[4]{
    \phantomsection     % 超链接
    \addcontentsline{toc}{section}{ABSTRACT}
    % 设置页眉页脚
    \thispagestyle{frontmatterstyle}
    \begin{center}%
        \linespread{1}
        \setlength{\parskip}{24pt}
        \zihao{3} \bfseries{#1}%
    \end{center}%

    \begin{center}%
        \linespread{1}
        \setlength{\parskip}{24pt}
        \zihao{3} #2%
    \end{center}%
    
    \begin{center}%
        \linespread{1}
        \setlength{\parskip}{24pt}
        \zihao{3}  ABSTRACT%
    \end{center}%
    #3
    ~\\
    ~\\
    {\zihao{-4} \bfseries{Keywords:#4}} 
    \newpage
}

