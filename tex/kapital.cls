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
\setmainfont{PTF55F}[ % шрифты в подкаталогах "paratype" и "stix-fonts"
	Path = fonts/paratype/ ,
    Extension = .ttf ,
    UprightFont = PTF55F ,
    BoldFont = PTF75F ,
    ItalicFont = PTF56F ,
    BoldItalicFont = PTF76F
]

\setsansfont{PTS55F}[
	Path = fonts/paratype/ ,
    Extension = .ttf ,
    UprightFont = PTS55F ,
    BoldFont = PTS75F ,
    ItalicFont = PTS56F ,
    BoldItalicFont = PTS76F
]

\setmonofont{PTM55F}[
	Path = fonts/paratype/ ,
    Extension = .ttf ,
    UprightFont = PTM55F ,
    BoldFont = PTM75F
]

\newfontfamily{\greekfont}{STIX2Text-Regular}[
  Path = fonts/stix-fonts/ ,
  Script = Greek ,
  Extension = .otf ,
  UprightFont = STIX2Text-Regular ,
  ItalicFont = STIX2Text-Italic ,
  BoldFont = STIX2Text-Bold ,
  BoldItalicFont = STIX2Text-BoldItalic ,
  Scale = MatchLowercase
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
\setmathfont{PTF55F}[
  Path = fonts/paratype/ ,
  Extension = .ttf ,
  UprightFont = PTF55F ,
  BoldFont = PTF75F ,
  ItalicFont = PTF56F ,
  BoldItalicFont = PTF76F 
]

\setmathfont{STIX2Math}[% A-Z все начертания с латиницей без цифр
  Path = fonts/stix-fonts/ ,
  Extension = .otf ,
  StylisticSet=01 ,
  range = {"00041-"0005A, "1D400-"1D419, "1D434-"1D44D, "1D468-"1D481, "1D49C-"1D4B5, "1D4D0-"1D4E9, "1D5A0-"1D5B9, "1D5D4-"1D5ED, "1D608-"1D621, "1D63C-"1D655, "1D538-"1D551, "1D504-"1D51D, "1D56C-"1D585, "1D670-"1D689}
]

\setmathfont{STIX2Math}[% a-z все начертания с латиницей без цифр
  Path = fonts/stix-fonts/ ,
  Extension = .otf ,
  StylisticSet=01 ,
  range = {"00061-"0007A, "1D41A-"1D433, "1D44E-"1D467, "1D482-"1D49B, "1D4B6-"1D4CF, "1D4EA-"1D503, "1D5BA-"1D5D3, "1D5EE-"1D607, "1D622-"1D63B, "1D656-"1D66F, "1D552-"1D56B, "1D51E-"1D537, "1D586-"1D59F, "1D68A-"1D6A3}
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
