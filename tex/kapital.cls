\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kapital}[2017/04/15 Das Kapital]

\LoadClass[11pt, b5paper, final, openany]{memoir}


% 2893px 1889px
% 11.8082 px in mm
\setstocksize{235mm}{155mm}
\settrimmedsize{\stockheight}{\stockwidth}{*}

% 1422px (2190 + 56)px
\settypeblocksize{*}{120.42mm}{1.5795}
% 178px 297px
\setlrmargins{42pt}{*}{*}
% (349 - 56)px 360px
\setulmargins{*}{*}{1.23}
\setfootins{18\p@ \@plus 4\p@ \@minus 4\p@}{\bigskipamount}
\setheaderspaces{*}{13pt}{*}
\checkandfixthelayout

% languages support
\RequirePackage[no-math]{fontspec}
\RequirePackage{polyglossia}
\setmainlanguage{ukrainian}
\setotherlanguage{greek}
\setotherlanguage{german}
\setotherlanguage{english}
% Temporary disable due to franch footnotes
% \setotherlanguage{french}

\RequirePackage{counters}

%% We move headings one level up
\let\subparagraph\paragraph
\let\paragraph\subsubsection
\let\subsubsection\subsection
\let\subsection\section
\let\section\chapter
\let\chapter\part

\addto\captionsukrainian{\renewcommand{\partname}{Відділ}}
\renewcommand{\thepart}{\UkrNumToName{\value{part}}}

\counterwithout{chapter}{part}

\setsecnumdepth{paragraph}
\renewcommand{\thechapter}{\Roman{chapter}}
\renewcommand{\thesection}{\arabic{section}. }
\renewcommand{\thesubsection}{\alph{subsection}) }
\renewcommand{\thesubsubsection}{\arabic{subsubsection}. }
\renewcommand{\theparagraph}{\Alph{subsubsection}) }

% math
\RequirePackage{xfrac}
\RequirePackage{amsmath}
\usepackage{abraces} % do we need it (?)

% braces
\usepackage{tikz}
\tikzstyle{every picture}+=[remember picture]
\tikzstyle{na} = [baseline=-.5ex]

\input{fonts.tex}

%% frac in text mode
\let\oldfrac\frac
\renewcommand{\frac}[2]{\ifmmode{\oldfrac{#1}{#2}}\else$\oldfrac{#1}{#2}$\fi}

%% split frac
\newcommand{\splitfracm}[2]{<\genfrac{}{}{0pt}{1}{#1}{#2}}
% in text mode
\newcommand{\splitfrac}[2]{\ifmmode\splitfracm{#1}{#2}\else$\splitfracm{#1}{#2}$\fi}

%% pound
\newcommand{\pound}[1]{\,£}

%% ======
%% Tables
%% ======

\usepackage{caption}
\DeclareCaptionFont{tablefont}{\tablefont}
\captionsetup{font=tablefont, textfont=bf}

\usepackage{makecell}
\usepackage{bigdelim}
\usepackage{multirow}
\usepackage{longtable}
\usepackage{rotating}

%% set font
\newcommand{\settablefont}{%
  \sisetup{group-minimum-digits=3,detect-all,text-rm=\tablefont}%
  \tablefont%
}

\AtBeginEnvironment{tabularx}{\settablefont}
\AtBeginEnvironment{tabular}{\settablefont}
\AtBeginEnvironment{longtable}{\settablefont}


%% default hangindent 
\newcommand{\indentdef}{\hspace{1em}}
\newcommand{\hangindentdef}{\hangindent=1em}

%% same width
%% \samewidth{of_what}{text}
\usepackage{calc}
\newcommand{\samewidth}[2]{\makebox[\widthof{#1}][c]{#2}}

%% ditto mark
\newcommand{\dittomark}{>>}
\newcommand{\ditto}[1]{\samewidth{#1}{\dittomark{}}}

%% temp length
\newlength{\myheight}

%% default tabcolsep
\newlength{\tabcolsepdef}
\setlength{\tabcolsepdef}{\tabcolsep}

%% cells
\newcommand{\makevertcell}[2]{
  \rotatebox[origin=c]{90}{\parbox[c]{#1}{#2}}%
}
%% paragrraph cell
\newcommand{\makehangcell}[1]{
 \noindent\parbox[b]{\hsize}{\strut\hangindentdef{}#1\strut} %
}

%% hang out of align
\newcommand{\hang}[2]{\makebox[0pt][#1]{#2}}

\newcommand{\md}{\textemdash{}}
\newcommand{\emptycell}{\makecell{\textemdash{}}}

%% caption2
\newcommand{\captionnew}[1]{
{\bfseries\sffamily #1}%
}

%% line color 75%
\definecolor{gray75}{rgb}{0.75, 0.75, 0.750}
%% Set table line color
%% see p. 12 http://mirror.datacenter.by/pub/mirrors/CTAN/macros/latex/contrib/booktabs/booktabs.pdf
\newcommand{\CT@arc@}{\color{gray75}}


%% ======
%% Typography
%% ======

\usepackage{microtype} % [tracking=true]
\frenchspacing

% Do not break line at mdash
\usepackage{newunicodechar}
\newunicodechar{—}{\unskip\ifmmode-\else~---\fi}

% L e t t e r  s p a c e (\so)
\RequirePackage{soul} 
\makeatletter
\font\SOUL@tt="PTserif"
\setbox\z@\hbox{\SOUL@tt-}
\SOUL@ttwidth\wd\z@
\makeatother

%
% numbers
%
\RequirePackage{siunitx}

%% Book I
\sisetup{
  detect-all,
  input-ignore={.},
  input-decimal-markers={,}
}

% footnotes 
\RequirePackage{bigfoot}
% fix bug in bigfoot 2015/08/30 2.1
% see https://tex.stackexchange.com/questions/471379/footnote-marks-missplaced-with-bigfoot/
\usepackage{xpatch}
\makeatletter
\patchcmd\FN@allmarks{266}{256}{}{\fail}
\makeatother

% 100 note
\DeclareNewFootnote{default}

% ** note
\DeclareNewFootnote{Z}[fnsymbolsingle]
\MakeSortedPerPage{footnoteZ}
\WithSuffix\newcommand\footnote*[1]{\footnoteZ{#1}}

% 100a note
\newcounter{footalt}[footnote]
\def\thefootalt{\thefootnote \alph{footalt}}
\def\footnoteA{\refstepcounter{footalt}%
   \Footnotedefault{\thefootalt}}
\def\footnotemarkA{\refstepcounter{footalt}%
   \Footnotemarkdefault{\thefootalt}}
\def\footnotetextA{\Footnotetextdefault{\thefootalt}}

%% indexes 
%% hack to prevent warning
\newcommand{\indexchap}[1]{}

\RequirePackage{amsmidx}
\makeindex{franko}
\makeindex{i}
\makeindex{ii}
\makeindex{iii1}
\makeindex{iii2}

%% fix spacing on index
\let\oldmyindex\index
\renewcommand*{\index}[2]{\unskip\oldmyindex{#1}{#2}}

%% Breaks
\newcommand{\parbreak}{¬ \emph{(абзац продовжується на наступній сторінці)}}
\newcommand{\parcont}{\noindent \emph{(абзац починається на попередній сторінці) ¶}}

%% styling
\RequirePackage{style}

\endinput
