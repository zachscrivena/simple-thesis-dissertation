% !TEX TS-program = xelatex
% !TEX encoding = UTF-8 Unicode
% -*- coding: UTF-8; -*-
% vim: set fenc=utf-8

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% simplethesisdissertation.cls
%% <https://github.com/zachscrivena/simple-thesis-dissertation>
%% This is free and unencumbered software released into the
%% public domain; see <http://unlicense.org> for details.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{simplethesisdissertation}[2016/12/25 Simple Thesis Dissertation https://github.com/zachscrivena/simple-thesis-dissertation]

\DeclareOption{a4paper}{\PassOptionsToClass{\CurrentOption}{report}}
\DeclareOption{letterpaper}{\PassOptionsToClass{\CurrentOption}{report}}

% Run in non-stop mode.
\DeclareOption{nonstopmode}{\nonstopmode}

% Draft mode.
\newcommand{\TypesetInDraftMode}{0}
\DeclareOption{draftmode}{\renewcommand{\TypesetInDraftMode}{1}}

\ProcessOptions\relax

% Use report class as the base class.
\LoadClass[12pt,oneside]{report}

% Geometry package for page margins.
% A4-size (210 mm × 297 mm) single-sided pages
\RequirePackage[
left=25.4mm,
right=25.4mm,
top=20mm,
bottom=16mm,
headsep=6mm, % header separation, above text body
footskip=6mm] % footer skip, below text body
{geometry}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MISCELLANEOUS PACKAGES.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\RequirePackage[none]{hyphenat} % Disable hyphenation.
\RequirePackage[english]{babel} % For language-specific hyphenation.
\RequirePackage{cite} % Automatically sort and range citations numbers.
\RequirePackage{environ} % For easy definition of environments.
\RequirePackage{rotating} % For rotating objects.
\RequirePackage{framed} % For framed text.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PDF OUTPUT.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% PDF settings and properties.
\RequirePackage{hyperref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% COLORS.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[usenames]{color} % For colors.
\definecolor{AccentOne}{RGB}{0,68,186} % blue

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FONTS.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{fontspec}
\defaultfontfeatures{Mapping=tex-text} % to support TeX conventions like "---".
\RequirePackage{xunicode} % Unicode support for LaTeX character names (accents, European chars, etc.).
\RequirePackage{xltxtra} % Extra customizations for XeLaTeX.
\RequirePackage{lmodern} % For Latin Modern fonts.

% Font: Main font, \textnormal{}, \normalfont.
\setmainfont
[Path=./Fonts/tinos/,
ItalicFont=Tinos-Italic,
BoldFont=Tinos-Bold,
BoldItalicFont=Tinos-BoldItalic,
Scale=1.00]
{Tinos-Regular.ttf}

% Font: Roman font, \textrm{}, \rmfamily.
\setromanfont
[Path=./Fonts/tinos/,
ItalicFont=Tinos-Italic,
BoldFont=Tinos-Bold,
BoldItalicFont=Tinos-BoldItalic,
Scale=1.00]
{Tinos-Regular.ttf}

% Font: Sans-serif font, \textsf{}, \sffamily.
\setsansfont
[Path=./Fonts/carlito/,
ItalicFont=Carlito-Italic,
BoldFont=Carlito-Bold,
BoldItalicFont=Carlito-BoldItalic,
Scale=0.95]
{Carlito-Regular.ttf}

% Font: Monospace font, \texttt{}, \ttfamily.
\setmonofont
[Path=./Fonts/mplus/,
BoldFont=mplus-1m-bold,
Scale=0.95]
{mplus-1m-regular.ttf}

% Symbols.
\RequirePackage{textcomp} % For symbols.
\RequirePackage{underscore} % Use underscore symbol without escape sequence.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SECTION HEADINGS.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Section heading fonts.
\RequirePackage[explicit]{titlesec}

\titlespacing*{\part}%
{0em}% left
{8em}% vertical space before title
{4em}% vertical space after title
[0em]% right

\titleformat{\part}
[display]% shape
{\sffamily\bfseries\filcenter}% applied to label and text
{\fontsize{16}{19.2}\selectfont\color{AccentOne}PART~\thepart}% applied to the label only
{1em}% vertical spacing between label and text
{\fontsize{32}{38.4}\selectfont{#1}}% applied before the text
[]% applied after the text

\titleformat{name=\part,numberless}
[display]% shape
{\sffamily\bfseries\filcenter}% applied to label and text
{\fontsize{16}{19.2}\selectfont\color{AccentOne}~}% applied to the label only
{1em}% vertical spacing between label and text
{\fontsize{32}{38.4}\selectfont{#1}}% applied before the text
[]% applied after the text

\titlespacing*{\chapter}%
{0em}% left
{5em}% vertical space before title
{2em}% vertical space after title
[0em]% right

\titleformat{\chapter}
[display]% shape
{\sffamily\bfseries\raggedright}% applied to label and text
{\fontsize{17.5}{21}\selectfont\color{AccentOne}CHAPTER~\thechapter}% applied to the label only
{0em}% vertical spacing between label and text
{\fontsize{30}{36}\selectfont{#1}}% applied before the text
[]% applied after the text

\titleformat{name=\chapter,numberless}
[display]% shape
{\sffamily\bfseries\raggedright}% applied to label and text
{\fontsize{17.5}{21}\selectfont\color{AccentOne}~}% applied to the label only
{0em}% vertical spacing between label and text
{\fontsize{30}{36}\selectfont{#1}}% applied before the text
[]% applied after the text

\titleformat{\section}%
[hang]% shape
{\fontsize{17}{20.4}\selectfont\sffamily\bfseries\raggedright}% applied to label and text
{\color{AccentOne}\thetitle}% applied to the label only
{0.5em}% horizontal spacing between label and text
{#1}% applied before the text
[]% applied after the text

\titleformat{\subsection}%
[hang]% shape
{\fontsize{14.5}{17.4}\selectfont\sffamily\bfseries\raggedright}% applied to label and text
{\color{AccentOne}\thetitle}% applied to the label only
{0.5em}% horizontal spacing between label and text
{#1}% applied before the text
[]% applied after the text

\titleformat{\subsubsection}%
[hang]% shape
{\fontsize{13}{15.6}\selectfont\sffamily\bfseries\raggedright}% applied to label and text
{\color{AccentOne}\thetitle}% applied to the label only
{0.5em}% horizontal spacing between label and text
{#1}% applied before the text
[]% applied after the text

\titlespacing*{\paragraph}%
{\parindent}% left
{\parskip}% vertical space before title
{0.5em}% horizontal space after title
[]% right

\titleformat{\paragraph}%
[runin]% shape
{\sffamily\bfseries}% applied to label and text
{}% applied to the label only
{0em}% horizontal spacing between label and text
{#1.}% applied before the text
[]% applied after the text

\titlespacing*{\subparagraph}%
{2\parindent}% left
{\parskip}% vertical space before title
{0.5em}% horizontal space after title
[]% right

\titleformat{\subparagraph}%
[runin]% shape
{\sffamily\bfseries\itshape}% applied to label and text
{}% applied to the label only
{0em}% horizontal spacing between label and text
{#1.}% applied before the text
[]% applied after the text

% Section numbering depth.
\setcounter{secnumdepth}{10}

% Macros to capture section names.
\def\Chaptername{}
\let\Chaptermark\chaptermark
\def\chaptermark#1{\def\Chaptername{#1}\Chaptermark{#1}}
\def\Sectionname{}
\let\Sectionmark\sectionmark
\def\sectionmark#1{\def\Sectionname{#1}\Sectionmark{#1}}
\def\Subsectionname{}
\let\Subsectionmark\subsectionmark
\def\subsectionmark#1{\def\Subsectionname{#1}\Subsectionmark{#1}}
\def\Subsubsectionname{}
\let\Subsubsectionmark\subsubsectionmark
\def\subsubsectionmark#1{\def\Subsubsectionname{#1}\Subsubsectionmark{#1}}

% References to parts.
\newcommand{\Part}{{\color{AccentOne}Part}}
\newcommand{\Parts}{{\color{AccentOne}Parts}}
\newcommand{\pref}[1]{{\color{AccentOne}\ref{#1}}}

% References to chapters.
\newcommand{\Chapter}{{\color{AccentOne}Chapter}}
\newcommand{\Chapters}{{\color{AccentOne}Chapters}}
\newcommand{\cref}[1]{{\color{AccentOne}\ref{#1}}}

% References to sections.
\newcommand{\Section}{{\color{AccentOne}Section}}
\newcommand{\Sections}{{\color{AccentOne}Sections}}
\newcommand{\sref}[1]{{\color{AccentOne}\ref{#1}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PARAGRAPHS.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Line spacing.
\RequirePackage{setspace}
%\singlespacing
\onehalfspacing
%\doublespacing
%\setstretch{1.40} % custom

% Paragraph indentation:
% Indent first line of all paragraphs (including the first),
% as in IEEE style.
\let\@afterindentfalse\@afterindenttrue

% Indented blocks.
\newcommand{\IndentBlock}[1]{\noindent\hangafter=0\hangindent=#1\parindent\ignorespaces}
\newcommand{\IndentHanging}{\noindent\hangafter=1\hangindent=\parindent\ignorespaces}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% HEADERS AND FOOTERS.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Header and footer font.
\newcommand{\UseHeaderFooterFont}{\footnotesize\sffamily}

% Footer.
\ifnum\TypesetInDraftMode=0
\newcommand{\FooterText}{}
\else
\newcommand{\FooterText}{\null\hfill\color{red}{DRAFT}~\Timestamp\hfill\null}
\fi

% Empty style, for title page.
\def\ps@empty{%
\def\@oddhead{\UseHeaderFooterFont}%
\def\@evenhead{\UseHeaderFooterFont}%
\def\@oddfoot{\UseHeaderFooterFont\FooterText}%
\def\@evenfoot{\UseHeaderFooterFont\FooterText}}

% Plain style, for chapter pages.
\def\ps@plain{%
\def\@oddhead{\UseHeaderFooterFont%
\hfill\thepage\hfill}%
\def\@evenhead{\UseHeaderFooterFont%
\hfill\thepage\hfill}%
\def\@oddfoot{\UseHeaderFooterFont\FooterText}%
\def\@evenfoot{\UseHeaderFooterFont\FooterText}}

\iffalse
% Plain style, for chapter pages.
\def\ps@plain{%
\def\@oddhead{\UseHeaderFooterFont%
\MakeUppercase{\DocumentTitle}\hfill\thepage}%
\def\@evenhead{\UseHeaderFooterFont%
\thepage\hfill\MakeUppercase{\DocumentTitle}}%
\def\@oddfoot{\UseHeaderFooterFont\FooterText}%
\def\@evenfoot{\UseHeaderFooterFont\FooterText}}

% Regular style, for regular pages in numbered chapters.
\def\ps@regular{%
\def\@oddhead{\UseHeaderFooterFont%
\MakeUppercase{\chaptername~\thechapter~~\Chaptername}\hfill\thepage}%
\def\@evenhead{\UseHeaderFooterFont%
\thepage\hfill\MakeUppercase{\DocumentTitle}}%
\def\@oddfoot{\UseHeaderFooterFont\FooterText}%
\def\@evenfoot{\UseHeaderFooterFont\FooterText}}

% Regular style, for regular pages in unnumbered chapters.
\def\ps@regularunnumberedchapters{%
\def\@oddhead{\UseHeaderFooterFont%
\MakeUppercase{\Chaptername}\hfill\thepage}%
\def\@evenhead{\UseHeaderFooterFont%
\thepage\hfill\MakeUppercase{\DocumentTitle}}%
\def\@oddfoot{\UseHeaderFooterFont\FooterText}%
\def\@evenfoot{\UseHeaderFooterFont\FooterText}}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FOOTNOTES.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Blank footnotes.
\newcommand\BlankFootnote[1]{%
\begingroup%
\renewcommand{\thefootnote}{}%
\footnotetext{#1}%
\addtocounter{footnote}{-1}%
\addtocounter{Hfootnote}{-1}%
\endgroup}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LISTS.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Numbered lists in IEEE style.
% (Individual lists can be modified by redefining
% these macros inside the enumerate environment.)

% 1st level: 1), 2), 3)
\renewcommand{\theenumi}{\arabic{enumi}}
\renewcommand{\labelenumi}{\theenumi)}
% 2nd level: a), b), c)
\renewcommand{\theenumii}{\alph{enumii}}
\renewcommand{\labelenumii}{\theenumii)}
\renewcommand\p@enumii{}
% 3rd level: i), ii), iii)
\renewcommand{\theenumiii}{\roman{enumiii}}
\renewcommand{\labelenumiii}{\theenumiii)}
\renewcommand\p@enumiii{}
% 4th level: A), B), C)
\renewcommand{\theenumiv}{\Alph{enumiv}}
\renewcommand{\labelenumiv}{\theenumiv)}
\renewcommand\p@enumiv{}

% Numbered lists: Adjust spacing.
\let\oldenumerate\enumerate
\renewcommand{\enumerate}{
\oldenumerate
\setlength{\itemsep}{0pt}
\setlength{\parskip}{0pt}
\setlength{\parsep}{0pt}
}

% Itemized lists: Adjust spacing.
\let\olditemize\itemize
\renewcommand{\itemize}{
\olditemize
\setlength{\itemsep}{0pt}
\setlength{\parskip}{0pt}
\setlength{\parsep}{0pt}
}

% Definition items.
\newcommand{\DefineItem}[1]{%
\IndentBlock{1}#1\nopagebreak
\par\IndentBlock{2}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FIGURES AND TABLES.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{graphicx} % To support graphics in EPS format.
\RequirePackage{longtable} % For multi-page long tables.
\RequirePackage{multirow} % To support multi-row cells in tables.
\RequirePackage{booktabs} % For making nice tables.
\RequirePackage{array} % For better table content alignment.

% Adjust spacing between table rows.
\renewcommand*\arraystretch{1.25}

% Dashed lines in tables.
\RequirePackage{arydshln}
\def\dashvertical{;{2pt/3pt}}
\def\dashhorizontal{\hdashline[2pt/3pt]}

% Captions for figures and tables.
\newcommand{\CaptionFontSize}{\small}

\def\@figurestring{figure}
\def\@tablestring{table}
\def\@makecaption#1#2{%
\CaptionFontSize
\ifx\@captype\@figurestring
\vskip1em
\fi
\sbox\@tempboxa{{\color{AccentOne}\sffamily\bfseries\MakeUppercase{#1}}\hspace{0.5em}#2}%
\ifdim\wd\@tempboxa>\hsize
{{\color{AccentOne}\sffamily\bfseries\MakeUppercase{#1}}\hspace{0.5em}#2}%
\else
\hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
\fi
\ifx\@captype\@tablestring
\vskip1em
\fi
}

% References to figures.
\newcommand{\Figure}{{\color{AccentOne}Figure}}
\newcommand{\Figures}{{\color{AccentOne}Figures}}
\newcommand{\fref}[1]{{\color{AccentOne}\ref{#1}}}

% References to tables.
\newcommand{\Table}{{\color{AccentOne}Table}}
\newcommand{\Tables}{{\color{AccentOne}Tables}}
\newcommand{\tref}[1]{{\color{AccentOne}\ref{#1}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DATE AND TIME.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{datetime2} % For dates and times.

% Timestamp.
\newcommand{\Timestamp}{{\DTMnow}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MATHEMATICS.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{amsmath,amsfonts,amsbsy,amssymb,amsthm} % AMS packages.

% Indicator function "1[.]" symbol.
% Option 1: Use "\mathbf"
%\newcommand{\one}[1]{{\mathbf{1}\left[#1\right]}}
% Option 2: Use "bbold" package (install "bbold-type1" first)
\DeclareSymbolFont{bbold}{U}{bbold}{m}{n}
\DeclareSymbolFontAlphabet{\mathbbold}{bbold}
\newcommand{\one}[1]{{\mathbbold{1}\left[#1\right]}}
% Option 3: Use "dsfont" package
%\RequirePackage{dsfont}
%\newcommand{\one}[1]{{\mathds{1}\left[#1\right]}}

% Allow line breaks within math blocks.
\allowdisplaybreaks

% Prevent line breaks within math expressions.
\relpenalty=10000
\binoppenalty=10000
\sloppy

% Theorems (cf. "amsthm.sty").
\newtheoremstyle{MyPlain}%
{0.4em}% space above
{0.4em}% space below
{\itshape}% body font
{}% indent amount
{}% theorem head font
{}% punctuation after theorem head
{0.5em}% space after theorem head
{\sffamily\bfseries{\color{AccentOne}\MakeUppercase{\thmname{#1}\thmnumber{ #2}}}\thmnote{ (#3)}}% custom theorem head spec

\newtheoremstyle{MyDefinition}%
{0.4em}% space above
{0.4em}% space below
{}% body font
{}% indent amount
{}% theorem head font
{}% punctuation after theorem head
{0.5em}% space after theorem head
{\sffamily\bfseries{\color{AccentOne}\MakeUppercase{\thmname{#1}\thmnumber{ #2}}}\thmnote{ (#3)}}% custom theorem head spec

\theoremstyle{MyPlain}

\@ifundefined{chapter}
{\newtheorem{Thm:Theorem}{Theorem}[]}
{\newtheorem{Thm:Theorem}{Theorem}[chapter]}

\newtheorem{Thm:Lemma}[Thm:Theorem]{Lemma}
\newtheorem{Thm:Corollary}[Thm:Theorem]{Corollary}
\newtheorem{Thm:Claim}[Thm:Theorem]{Claim}
\newtheorem{Thm:Proposition}[Thm:Theorem]{Proposition}
\newtheorem{Thm:Conjecture}[Thm:Theorem]{Conjecture}

\theoremstyle{MyDefinition}
\newtheorem{Thm:Problem}[Thm:Theorem]{Problem}
\newtheorem{Thm:Definition}[Thm:Theorem]{Definition}
\newtheorem{Thm:Example}[Thm:Theorem]{Example}

% References to theorems, lemmas, corollaries, etc.
\newcommand{\Theorem}{{\color{AccentOne}Theorem}}
\newcommand{\Theorems}{{\color{AccentOne}Theorems}}
\newcommand{\Lemma}{{\color{AccentOne}Lemma}}
\newcommand{\Lemmas}{{\color{AccentOne}Lemmas}}
\newcommand{\Corollary}{{\color{AccentOne}Corollary}}
\newcommand{\Corollaries}{{\color{AccentOne}Corollaries}}
\newcommand{\Claim}{{\color{AccentOne}Claim}}
\newcommand{\Claims}{{\color{AccentOne}Claims}}
\newcommand{\Proposition}{{\color{AccentOne}Proposition}}
\newcommand{\Propositions}{{\color{AccentOne}Propositions}}
\newcommand{\Conjecture}{{\color{AccentOne}Conjecture}}
\newcommand{\Conjectures}{{\color{AccentOne}Conjectures}}
\newcommand{\Problem}{{\color{AccentOne}Problem}}
\newcommand{\Problems}{{\color{AccentOne}Problems}}
\newcommand{\Definition}{{\color{AccentOne}Definition}}
\newcommand{\Definitions}{{\color{AccentOne}Definitions}}
\newcommand{\Example}{{\color{AccentOne}Example}}
\newcommand{\Examples}{{\color{AccentOne}Examples}}
\newcommand{\mref}[1]{{\color{AccentOne}\ref{#1}}}

% References to equations.
%\let\origeqref=\eqref
%\def\eqref#1{{\color{AccentOne}\origeqref{#1}}}

% Proof.
\renewenvironment{proof}[1][\proofname]{%
{\par\vskip0.4em\noindent%
\sffamily\bfseries\itshape{#1:}%
\hspace{0.5em}}}%
{\nopagebreak\hspace*{\fill}~\mbox{\rule[0pt]{1.3ex}{1.3ex}}\par}

\newcommand{\qedmarker}{\nopagebreak\hspace*{\fill}~%
\mbox{\rule[0pt]{1.3ex}{1.3ex}}\par}

% Resized "align" environment.
\NewEnviron{ResizedAlign}[2]{%
\par\noindent
\resizebox{#1}{!}{
\parbox{#2}{
\begin{align}
\BODY
\end{align}}}\par}

% Resized "align*" environment.
\NewEnviron{ResizedAlign*}[2]{%
\par\noindent
\resizebox{#1}{!}{
\parbox{#2}{
\begin{align*}
\BODY
\end{align*}}}\par}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CODE.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{algpseudocode} % For algorithms.

\algnewcommand{\CommentLeft}[1]{\State $\triangleright$\;\textit{#1}}
\algnewcommand{\CommentRight}[1]{\null\hfill $\triangleright$\;\textit{#1}}
\algnewcommand{\Goto}{\State \textbf{goto}\,}
\algnewcommand{\Break}{\State \textbf{break}\,}
\algnewcommand{\Stateu}{\Statex \hskip\ALG@thistlm}

% Inline code.
\newcommand{\code}[1]{\mbox{\color{DarkBlue}\texttt{#1}}}

% Code block.
\NewEnviron{CodeBlock}[1]{%
\par\noindent\ignorespaces%
\begin{oframed}%
\noindent\;\textbf{#1}
\nopagebreak\vspace{4pt}%
\hrule width \textwidth height 0.6pt depth 0pt
\vspace{4pt}%
\begin{algorithmic}[1]
\BODY
\ignorespaces%
\end{algorithmic}%
\end{oframed}%
\par}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TABLE OF CONTENTS (TOC) SETTINGS.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% TOC depth.
\setcounter{tocdepth}{10}

% Suppress entries in the TOC.
\newcommand{\DummyThree}[3]{}

\newcommand{\DisableTOCUpdates}{%
\let\tempaddcontentsline=\addcontentsline
\let\addcontentsline=\DummyThree}

\newcommand{\EnableTOCUpdates}{%
\let\addcontentsline=\tempaddcontentsline}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% HIDDEN TEXT, TODO MARKER, SAMPLE/BLIND TEXT.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Hidden text.
\newcommand{\Hide}[1]{}

% TODO marker.
\ifnum\TypesetInDraftMode=0
\newcommand{\TODO}[1]{}
\else
\newcommand{\TODO}[1]{{\color{red}\fbox{\texttt{\textbf{TODO}}}~#1}\PackageWarning{TODO:}{#1}}
\fi

% Sample/blind text.
\RequirePackage{lipsum}

\ifnum\TypesetInDraftMode=0
\renewcommand{\lipsum}[1][]{}
\fi

% End of class file.
\endinput
