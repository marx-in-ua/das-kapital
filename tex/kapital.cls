\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kapital}[2017/04/15 Das Kapital]

% page size 70×100/16
\LoadClass[b5paper, final]{memoir}
\isopage
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
\newfontfamily{\greekfont}{STIX2Text}[
  Path = fonts/ ,
  Script=Greek,
  Extension=.otf,
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
\renewcommand{\thesection}{Розділ \UkrNumToName{\value{section}}. }

\setsecnumdepth{subsection}
\renewcommand{\thesubsection}{\arabic{subsection}. }

% math
\RequirePackage{xfrac}
\RequirePackage{amsmath}

\usepackage{unicode-math}
\setmathfont{serif}[
  Path = fonts/ ,
  Extension = .ttf ,
  BoldFont = *-bold ,
  ItalicFont = *-italic ,
  BoldItalicFont = *-bolditalic
]

\setmathfont{STIX2Math}[% A-Z
  Path = fonts/ ,
  Extension = .otf ,
  StylisticSet=01 ,
  range={"00041-"0005A}
  % Scale = 1.0 
]

\setmathfont{STIX2Math}[% a-z
  Path = fonts/ ,
  Extension = .otf ,
  StylisticSet=01 ,
  range = {"00061-"0007A}
  % Scale = 1.0 
]

%% typography
\usepackage{microtype}
\frenchspacing
% Do not break line at mdash
\usepackage{newunicodechar}
\newunicodechar{—}{\unskip\ifmmode-\else~---\fi}

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
      \@ctrerr  
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

%% Breaks
\newcommand{\parbreak}{¬ \emph{(абзац продовжується на наступній сторінці)}}
\newcommand{\parcont}{\noindent \emph{(абзац починається на попередній сторінці) ¶}}

\endinput
