%%
%% This is file `buctcover.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% buctthesis.dtx  (with options: `cover')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2019-2022 by Miracle0565
%% 
%%     https://github.com/Miracle0565/BUCTthesis
%% 
%% This file may be distributed and/or modified under
%% the conditions of the LaTeX Project Public License,
%% either version 1.3c of this license or (at your option)
%% any later version. The latest version of this license
%% is in:
%% 
%%     http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3c or later is part of all distributions
%% of LaTeX version 1999/12/01 or later.
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{buctcover}[2022/05/14 Cover Maker for BUCTthesis]
\RequirePackage{ifxetex}
\RequireXeTeX
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family   = buct,
    prefix   = buct@,
    setkeys  = \kvsetkeys,
}
\newif\ifbuct@bachelor\buct@bachelorfalse
\newif\ifbuct@master\buct@masterfalse
\newif\ifbuct@doctor\buct@doctorfalse
\define@key{buct}{type}{\expandafter\csname buct@#1true\endcsname}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\PassOptionsToPackage{quiet}{xeCJK}
\LoadClass[zihao=-4]{ctexbook}
\ifbuct@bachelor\relax\else
    \ifbuct@master\relax\else
        \ifbuct@doctor\relax\else
            \ClassError{buctthesis}{%
                Specified thesis type is obligatory: \MessageBreak%
                type = [ bachelor | master | doctor ]%
            }{}
\fi\fi\fi
\newcommand{\coversetup}[1]{\kvsetkeys{buct}{#1}}
\DeclareStringOption[班级未定义]{class}
\DeclareStringOption[学号未定义]{studentid}
\DeclareStringOption[题目首行未定义]{titleA}
\DeclareStringOption{titleB}
\DeclareStringOption[专业未定义]{major}
\DeclareStringOption[作者未定义]{author}
\DeclareStringOption[导师未定义]{supervisor}
\DeclareStringOption[\the\year-\two@digits{\month}-\two@digits{\day}]{date}
\RequirePackage[a4paper,nomarginpar,
    top = 2.1cm, bottom = 2.2cm, left = 2cm, right = 2cm,
    headheight = 0cm, footskip = 0cm
]{geometry}
\RequirePackage{xeCJKfntef}
\RequirePackage{array,graphicx,calc,tikz,xifthen,hyperref}
\RequirePackage[absolute,overlay]{textpos}
\pagestyle{empty}
\xeCJKsetup{EmboldenFactor=2.3}
\setCJKmainfont{SimSun}[AutoFakeBold]
\setCJKsansfont{SimHei}[AutoFakeBold]
\newCJKfontfamily[xingkai]\xingkai{STXingkai}
\newCJKfontfamily[zhkai]  \zhkai  {KaiTi} [AutoFakeBold]
\newCJKfontfamily[xbsong] \xbsong {FZXiaoBiaoSong-B05S}
\newCJKfontfamily[dbsong] \dbsong {FZDaBiaoSong-B06S}
\setmainfont{Times New Roman}
\newcommand\buct@title@ul[1]{%
    \CJKunderline{\makebox[\widthof{\buct@titleA\enspace}][l]{#1}}
}
\newcommand\buct@major@ul[1]{%
    \CJKunderline{\makebox[\widthof{\buct@major\quad}][l]{#1}}
}
\newcommand\buct@format@date[1]{%
    \edef\buct@@date{\buct@date}%
    \def\buct@@process@date##1-##2-##3\@nil{%
        #1{##1}{##2}{##3}%
    }%
    \expandafter\buct@@process@date\buct@@date\@nil
}
\newcommand\@zhdate[3]{%
    \bfseries\zhkai
    \ifbuct@bachelor
        \zihao{4}
        #1年\makebox[1.5em]{#2}月\makebox[1.5em]{#3}日
    \else
        \Large\ziju{.1}%
        日\hspace{1.5\ccwd}期：\zhdigits{#1}年\zhnumber{#2}月\zhnumber{#3}日%
    \fi
}
\newcommand{\buct@makecover}{%
    \begin{table}[h]
        \raggedleft
        \ifbuct@bachelor
            \songti\zihao{5}
        \else
            \renewcommand{\arraystretch}{1.3}\large
        \fi
        \begin{tabular}{l@{}l}
            \ifbuct@bachelor%
                班\hspace{2\ccwd}级&：\CJKfamily+{zhsong}\buct@class\hspace*{2\ccwd}\\
                学\hspace{2\ccwd}号&：\CJKfamily+{zhsong}\buct@studentid\hspace*{2\ccwd}\\
            \else%
                \xbsong 单位代码 & ：\CJKfamily+{zhsong}\mbox{10010}\\
                \xbsong 学\hspace{2\ccwd}号 & ：\CJKfamily+{zhsong}\mbox{\buct@studentid}\\
            \fi
        \end{tabular}
    \end{table}
    \ifbuct@bachelor\vspace{3bp}\else\vspace{26bp}\fi
    \begin{minipage}[c][][c]{2.35cm}
        \includegraphics[width = 2.35cm]{BUCT-badge.pdf}
    \end{minipage}
    \qquad
    \begin{minipage}[c][2.35cm][c]{9cm}
        \xingkai
        \ifbuct@bachelor
            \ziju{0.1}\hspace*{0.8\ccwd}\zihao{-0}
        \else
            \ziju{-0.02}\zihao{0}
        \fi
        {北京化工大学}
    \end{minipage}
    \ifbuct@bachelor\vspace{12bp}\else\vspace{18bp}\fi
    \begin{center}
        \ifbuct@bachelor
            \ziju{0.15}\xbsong\zihao{-0}\CJKfamily+{}{%
            \punctstyle{banjiao}毕业设计（论文）% (论文)
            }
        \else%
            %\ziju{-0.05}
            \dbsong\fontsize{38bp}{60bp}\selectfont
            \ifbuct@master{硕}\else{博}\fi{}士研究生学位论文
        \fi
    \end{center}
    \ifbuct@bachelor
            \setlength{\TPHorizModule}{1cm}
            \setlength{\TPVertModule}{1cm}
            \begin{textblock}{0}(0,10)
                \noindent%
                \tikz[line width=1.2pt] \draw (0,0) -- (21,0) (0,0.2) -- (21,0.2);
            \end{textblock}
            \vspace{72bp}
            \begin{center}
                \xeCJKsetup{
                    underline = {
                        skip      = false,
                        thickness = 1.4pt,
                    }
                }
                \renewcommand{\arraystretch}{2}
                \begin{tabular}{%
                        >{\zihao{-2}\xbsong}l
                        >{\zihao{3}\bfseries}l
                }
                    题\hspace{\ccwd}目  & \buct@title@ul{\buct@titleA}\\
                    \ifthenelse{\equal{\buct@titleB}{}}{\relax}{
                                        & \buct@title@ul{\buct@titleB}\\
                    }
                \end{tabular}
                \vskip144bp\zihao{3}
                \begin{tabular}{
                        >{\begin{CJKfilltwosides}[b]{4\ccwd}\xbsong}r%
                            <{\end{CJKfilltwosides}}%
                        @{}>{\enspace\zihao{4}\bfseries}l%
                        <{\vspace{.2em}}%
                    }
                    专业     & \buct@major@ul{\buct@major}\\
                    学生   & \buct@major@ul{\buct@author}\\
                    指导教师 & \buct@major@ul{\buct@supervisor}\\
                \end{tabular}
            \end{center}
            \vfill{%
                \begin{center}%
                    \buct@format@date{\@zhdate}%
                \end{center}%
            }
    \else
        \vspace{76bp}
        \begin{center}
            \fontsize{20}{36}\selectfont
            \xeCJKsetup{
                underline = {
                    skip      = false,
                    thickness = 1.2pt,
                }
            }
            \begin{tabular}{
                >{\begin{CJKfilltwosides}[b]{4\ccwd}\sffamily\bfseries}r%
                <{\end{CJKfilltwosides}}%
                @{}>{\enspace\zihao{3}\bfseries}l%
                <{\vspace{.2em}}%
            }
                题目     & \buct@title@ul{\buct@titleA}\\
                \ifthenelse{\equal{\buct@titleB}{}}{\relax}{
                                        & \buct@title@ul{\buct@titleB}\\
                }
                专业     & \buct@title@ul{\zihao{4}\buct@major}\\
                研究生   & \buct@title@ul{\zihao{4}\buct@author}\\
                指导教师 & \buct@title@ul{\zihao{4}\buct@supervisor}\\
            \end{tabular}
        \end{center}
        \vfill{%
            \begin{center}%
                \buct@format@date{\@zhdate}%
            \end{center}%
        }
    \fi
}
\NewDocumentCommand{\makecover}{ o }{%
    \hypertarget{cover}{}
    \pdfbookmark{封面}{cover}
        \IfNoValueTF{#1}{\buct@makecover}{%
            \includepdf[pages=-]{#1}
        }
}
\endinput
%%
%% End of file `buctcover.cls'.
