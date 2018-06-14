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
\setfootins{24\p@ \@plus 8\p@ \@minus 8\p@}
% \setheaderspaces{*}{25pt}{*}
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

% fonts
\setmainfont{serif}[
  Path = fonts/ ,
  Extension = .ttf ,
  BoldFont = *-bold ,
  ItalicFont = *-italic ,
  BoldItalicFont = *-bolditalic,
  Scale = 0.867
]
\setsansfont{AlegreyaSans}[
  Path = fonts/ ,
  Extension=.otf,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
  SmallCapsFont=*SC-Regular,
  Scale=MatchLowercase,
]
\addfontfeature{LetterSpace=2.0}
%\setsansfont{sans}[
%  Path = fonts/ ,
%  Extension = .ttf ,
%  BoldFont = *-bold ,
%  ItalicFont = *-italic ,
%  BoldItalicFont = *-bolditalic
%]
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

%% titles
\newcommand\UkrNumToName[1]{%
\ifcase#1\relax % case 0
\or перший\or другий\or третій%
\else Not implemented\fi}

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
\renewcommand{\frac}[2]{\ifmmode{\oldfrac{#1}{#2}}\else$\oldfrac{#1}{#2}$\fi}

%% split frac
\newcommand{\splitfracm}[2]{<\genfrac{}{}{0pt}{1}{#1}{#2}}
% in text mode
\newcommand{\splitfrac}[2]{\ifmmode\splitfracm{#1}{#2}\else$\splitfracm{#1}{#2}$\fi}

%% ======
%% Tables
%% ======

\usepackage[font=bf]{caption}
\usepackage{makecell}
\usepackage{dcolumn}

%% same width
%% \samewidth{of_what}{text}
\usepackage{calc}
\newcommand{\samewidth}[2]{
  \makebox[\widthof{#1}][c]{#2}%
}

%% ditto mark
\newcommand{\dittomark}{>>}
\newcommand{\ditto}[1]{
  \samewidth{#1}{\dittomark{}}%
}

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

%% styling
\RequirePackage{style}

\endinput
