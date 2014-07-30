\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{dmv-ptm}[2013/4/05 PTM]
\LoadClass[a4paper,10pt]{article}


\providecommand{\title}[1]{\def\@title{#1}}
\renewcommand{\author}[1]{\def\@author{#1}}
\newcommand{\coauthor}[1]{\def\@coauthor{#1}\coauthortrue}
\providecommand{\institution}[1]{\def\@institution{#1}}
\newcommand{\country}[1]{\def\@country{#1}}
\providecommand{\email}[1]{\def\@email{#1}}
\newcommand{\session}[1]{\def\@session{#1}\sessiontrue}

\newif\ifcoauthor
\coauthorfalse
\newif\ifsession
\sessionfalse

\title{...}
\author{...}
\institution{...}
\country{...}
\email{...}


\baselineskip=12pt

\RequirePackage[dvips=false,pdftex=false,vtex=false,
            papersize={210mm,297mm},
            textwidth={120mm},textheight={190mm},heightrounded,
            vmarginratio=1:1,hmarginratio=1:1,bindingoffset=0mm,
            headheight=13pt,headsep=12pt,footskip=28pt]{geometry}



            \RequirePackage{fancyhdr}

            \pagestyle{fancy}
            \lhead{}
            \chead{}
            \rhead{DMV-PTM Mathematical Meeting\\ 17--20.09.2014, Pozna\'n}
            \lfoot{}
            \cfoot{}
            \rfoot{}
            \renewcommand{\headrulewidth}{0pt}
            \renewcommand{\footrulewidth}{0pt}

            \fancypagestyle{titlepage}{%
              \lhead{} \chead{} \rhead{}
              \rfoot{} \cfoot{}
              \lfoot{}
              \renewcommand{\headrulewidth}{1.25pt}
              \renewcommand{\footrulewidth}{0pt} }

\RequirePackage{lipsum}

\def\printpagenumber{\ifnum\thepage=1\relax \else \textbf{Your abstract is too long, please compress it!}\fi}

\renewenvironment{abstract}{\fontsize{10pt}{13pt}\selectfont 
}{\par\printpagenumber}

\def\maketitle{%
%\vspace*{1\baselineskip}

\bgroup\fontsize{14pt}{18pt}\selectfont\bfseries
\noindent\@title\par
\egroup

\vskip 1\baselineskip

\bgroup\fontsize{10pt}{10pt}\selectfont\bfseries
\noindent\@author\par
\egroup

\vskip .5\baselineskip

\bgroup\fontsize{10pt}{12pt}\selectfont
\noindent\@institution,\ \@country\par
\egroup

\bgroup\fontsize{10pt}{12pt}\selectfont
\noindent\texttt{\@email}\par
\egroup

\vskip .5\baselineskip

   \ifcoauthor
          \noindent\emph{\@coauthor}\par \vskip 1\baselineskip
       \else 
%          \vskip 1\baselineskip
   \fi
\ifsession
          \noindent\emph{Session: \@session}
       \else
          \noindent\textbf{Give the session name!}
    \fi
\vskip 1\baselineskip
}

\renewenvironment{thebibliography}[1]{%
\par
\vskip 13pt
\bgroup\fontsize{10.5pt}{13pt}\selectfont
\noindent\textbf{References}\par\vskip 6.5pt
\egroup 
%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \setlength{\itemsep}{0pt}%
            \setlength{\parskip}{0pt}%
            \setlength{\topsep}{0pt}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}%
            \fontsize{9.5pt}{11pt}\selectfont}%
      \sloppy
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

\endinput
