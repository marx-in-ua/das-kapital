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

% titles
\addto\captionsukrainian{\renewcommand{\chaptername}{Відділ}}
\addto\captionsukrainian{\renewcommand{\sectionname}{Розділ}}

\endinput
