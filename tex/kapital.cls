\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kapital}[2017/04/15 Das Kapital]

% page size 70×100/16
\LoadClass[b5paper, final]{memoir}
\semiisopage
\checkandfixthelayout

% languages support
\RequirePackage[no-math]{fontspec}
\RequirePackage{polyglossia}
\setmainlanguage{ukrainian}
\setotherlanguage{greek}
\setotherlanguage{german}
\setotherlanguage{english}
% Temporary disable dut to franch footnotes
% \setotherlanguage{french}

% fonts
\setmainfont{serif}[
  Path = fonts/ ,
  Extension = .ttf ,
  BoldFont = *-bold ,
  ItalicFont = *-italic ,
  BoldItalicFont = *-bolditalic
]
\setsansfont{sans}[
  Path = fonts/ ,
  Extension = .ttf ,
  BoldFont = *-bold ,
  ItalicFont = *-italic ,
  BoldItalicFont = *-bolditalic
]
\newfontfamily{\greekfont}{NotoSerif}[
  Path = fonts/ ,
  Script=Greek,
  Extension=.ttf,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
  Scale=MatchLowercase,
]

% titles
\newcommand\UkrNumToName[1]{%
\ifcase#1\relax % case 0
\or перший\or другий\or третій%
\else Not implemented\fi}

\addto\captionsukrainian{\renewcommand{\chaptername}{Відділ}}
\chapterstyle{bianchi}
\renewcommand{\printchapternum}{\UkrNumToName{\thechapter}. }

\counterwithout{section}{chapter}
\renewcommand{\thesection}{Розділ \UkrNumToName{\value{section}} }

\setsecnumdepth{subsubsection}
\renewcommand{\thesubsection}{\arabic{subsection}. }
\renewcommand{\thesubsubsection}{\alph{subsubsection}. }

% math
\RequirePackage{xfrac}
\RequirePackage{amsmath}

\usepackage{unicode-math}
%\setmathfont{serif}[
%  Path = fonts/ ,
%  Extension = .ttf ,
%  BoldFont = *-bold ,
%  ItalicFont = *-italic ,
%  BoldItalicFont = *-bolditalic
%]

\setmathfont{STIX2Math}[% a-z
  Path = fonts/ ,
  Extension = .otf ,
  StylisticSet=01 ,
  Scale = MatchLowercase ,
  % range = {"00061-"0007A, "1D41A-"1D433, "1D44E-"1D467, "1D482-"1D49B, "1D4B6-"1D4CF, "1D4EA-"1D503, "1D5BA-"1D5D3, "1D5EE-"1D607, "1D622-"1D63B, "1D656-"1D66F, "1D552-"1D56B, "1D51E-"1D537, "1D586-"1D59F, "1D68A-"1D6A3}
]

%% Alllow cyrilic letters in math
\DeclareSymbolFont{cyrletters}{\encodingdefault}{\familydefault}{m}{it}
\newcommand{\makecyrmathletter}[1]{%
  \begingroup\lccode`a=#1\lowercase{\endgroup
  \Umathcode`a}="0 \csname symcyrletters\endcsname\space #1
}
\count255="409
\loop\ifnum\count255<"44F
  \advance\count255 by 1
  \makecyrmathletter{\count255}
\repeat

%% frac in text mode
\let\oldfrac\frac
\renewcommand{\frac}[2]{\ifmmode\oldfrac{#1}{#2}\else$\oldfrac{#1}{#2}$\fi}

%% split frac
\newcommand{\splitfracm}[2]{<\genfrac{}{}{0pt}{1}{#1}{#2}}
% in text mode
\newcommand{\splitfrac}[2]{\ifmmode\splitfracm{#1}{#2}\else$\splitfracm{#1}{#2}$\fi}

%% ======
%% Tables
%% ======

\usepackage[font=bf]{caption}

%% ditto mark
\usepackage{calc}

\newcommand{\dittomark}{>>}
\newcommand{\ditto}[1]{
  \makebox[\widthof{#1}][c]{\dittomark{}}%
}

%% ======
%% Typography
%% ======

\usepackage{microtype}
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

% footnotes 
\RequirePackage{bigfoot}

\makeatletter
\def\@fnsymbolsingle#1{%
  %\ensuremath{%
    \ifcase#1% 0
      *
    \or % 1
      *%   
    \or % 2
      **
    \or % 3  
      ***
    \or % 4   
      ****
    \or % 5
      *****
    \else % >= 6
      undefined
    \fi
  %}%   
}   
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

%% indexes 
\RequirePackage{amsmidx}
\makeindex{franko}
\makeindex{i}
\makeindex{ii}
\makeindex{iii1}
\makeindex{iii2}

%% Breaks
\newcommand{\parbreak}{¬ \emph{(абзац продовжується на наступній сторінці)}}
\newcommand{\parcont}{\noindent \emph{(абзац починається на попередній сторінці) ¶}}

\endinput
