\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kapital}[2017/04/15 Das Kapital]

% page size 70×100/16
\LoadClass[b5paper, final]{memoir}
\isopage
\checkandfixthelayout

% languages support
\RequirePackage{polyglossia}
\setmainlanguage{ukrainian}
\setotherlanguage{english}
\setotherlanguage{german}
\setotherlanguage{french}
\setotherlanguage{greek}

% fonts
\setmainfont{serif}[
	Path = fonts/ ,
	BoldFont = *-bold.ttf ,
	ItalicFont = *-italic.ttf ,
	BoldItalicFont = *-bolditalic.ttf
]
\setsansfont{sans}[
	Path = fonts/ ,
	BoldFont = *-bold.ttf ,
	ItalicFont = *-italic.ttf ,
	BoldItalicFont = *-bolditalic.ttf
]

% titles
\newcommand\UkrNumToName[1]{%
\ifcase#1\relax % case 0
\or перший\or другий\or третій%
\else Not implemented\fi}

\addto\captionsukrainian{\renewcommand{\chaptername}{Відділ}}
\chapterstyle{bianchi}
\renewcommand{\printchapternum}{\UkrNumToName{\thechapter}}

\counterwithout{section}{chapter}}
\renewcommand{\thesection}{Відділ \UkrNumToName{\value{section}}}

\endinput
