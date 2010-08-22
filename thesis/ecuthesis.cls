%%---------------------------------------------------------------------------%%
%% ECU Thesis class
%% By: John Barker
%% Custom page layout for my ECU thesis/proposal submission
%%---------------------------------------------------------------------------%%

% Base on report class.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ecuthesis}[2010/04/19 Thesis Style]
\ProcessOptions
\LoadClass[onecolumn,12pt]{report}
\usepackage[cm]{fullpage}

% Don't use hyphenation
\hyphenpenalty=100000

% Support for floats
\usepackage{float}

%%---------------------------------------------------------------------------%%
%% Fonts - requires xetex
%%---------------------------------------------------------------------------%%

\ProvidesPackage{opentypefonts}[2008/03/05 Uses OpenType fonts instead of LaTeX defaults. Needs XeTeX.]

\RequirePackage[cm-default]{fontspec}
\RequirePackage{xunicode}
\RequirePackage{xltxtra}

\defaultfontfeatures{Scale=MatchLowercase}

\setsansfont[Mapping=tex-text,Scale=1.1]{Raleway}
\setmainfont[Mapping=tex-text,Scale=1.0]{Optima}
\setmonofont{Monaco}

%%---------------------------------------------------------------------------%%
%% Chapters/Titles
%%---------------------------------------------------------------------------%%

% This package gives us more control over title format
\usepackage[calcwidth]{titlesec}

% Customize the chapter titles with a line underneath and no 'Chapter X' 
% label
\usepackage[avantgarde]{quotchap}

% Don't use up so much space for chapters
\renewcommand\chapterheadstartvskip{\vspace*{-7\baselineskip}}
\renewcommand\chapterheadendvskip{\vspace*{0.2\baselineskip}}

% Put a line under section headings
\titleformat{\section}[hang]{\sffamily\bfseries}
 {\Large\thesection}{12pt}{\Large}[{\titlerule[0.5pt]}]

\titlespacing{\subsection}{0pt}{*0}{6pt}
\titlespacing{\subsubsection}{0pt}{*0}{6pt}
\titlespacing{\subsubsection}{0pt}{*0}{*0}
\titlespacing{\paragraph}{0pt}{*0}{*0}

% New line after paragraph heading
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}
  {-3.25ex\@plus -1ex \@minus -.2ex}
  {1.5ex \@plus .2ex}
  {\normalfont\normalsize\bfseries}}

%%---------------------------------------------------------------------------%%
%% Paragraphs and spacing
%%---------------------------------------------------------------------------%%

%% Double Spacing
\RequirePackage{setspace}

%% Don't indent paragraphs
\setlength{\parskip}{12pt}
\setlength{\parindent}{0pt}

% Allow sentences to be stretched a bit, this is needed since I'm not allowing
% hyphenation
\emergencystretch 2em

%%---------------------------------------------------------------------------%%
%% Headers and footers
%%---------------------------------------------------------------------------%%

% Use the fancy header package
\usepackage{fancyhdr}

% Reset the defaults
\fancyhead{}
\fancyfoot{}

% No head rule
\renewcommand{\headrulewidth}{0pt}

% Footer with line
\fancyfoot[L]{\rule{0cm}{4mm}\color{black}{\sffamily\bfseries \thepage}}

% Make sure the line appears above the page number box
\renewcommand{\footrulewidth}{0.4pt}
\renewcommand{\footruleskip}{2mm}

% Use the page style - must come last
\pagestyle{fancy}

% Use same footers on plain pages
\fancypagestyle{plain} {
  \fancyhead{}
  \fancyfoot{}
  \fancyfoot[L]{\rule{0cm}{4mm}\color{black}{\sffamily\bfseries \thepage}}
  \renewcommand{\footrulewidth}{0.5pt}
  \renewcommand{\headrulewidth}{0pt}
}

%%---------------------------------------------------------------------------%%
%% Tables
%%---------------------------------------------------------------------------%%

\usepackage{booktabs}

%%---------------------------------------------------------------------------%%
%% Lists
%%---------------------------------------------------------------------------%%

% mdwlist provides more compact lists
\usepackage{mdwlist}

%%---------------------------------------------------------------------------%%
%% Customize the abstract
%%---------------------------------------------------------------------------%%

\renewenvironment{abstract}{
  \normalbaselines
  \section*{ABSTRACT}
  \em }
{ \em
  \nopagebreak[4]}

%%---------------------------------------------------------------------------%%
%% Title page
%%---------------------------------------------------------------------------%%

% Macros for defining the title page
\newcommand{\department}[1]{\gdef\@department{#1}}
\department{??DEPARTMENT??}
\newcommand{\school}[1]{\gdef\@school{#1}}
\school{}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\degree{??DEGREE??}
\newcommand{\advisor}[1]{\gdef\@advisor{#1}}
\advisor{??ADVISOR??}
\newcommand{\copyrightyear}[1]{\gdef\@copyrightyear{#1}}
\copyrightyear{??COPYRIGHTYEAR??}
\newcommand{\email}[1]{\gdef\@email{#1}}
\email{??EMAIL??}
\newcommand{\studentid}[1]{\gdef\@studentid{#1}}
\studentid{??STUDENTID??}

\newcounter{@supervisors}

% Internal macro for printing the supervisor in the title page
\newcommand{\@supervisor}[1]{
  {#1} \\
}

% \supervisor{Name}
% Macro to specify a supervisor to be listed in the title page, max: 7 supervisors
\newcommand{\supervisor}[1]{
  % Inc. num of members to include this new one.
  \addtocounter{@supervisors}{1}
  \ifcase\value{@supervisors}
    \typeout{Thesis format internal error.  No supervisors specified, you must specify at least one supervisor} \or
    \newcommand{\@supervisora}{Supervisors: & {#1} \\} \or
    \newcommand{\@supervisorb}{ & {#1} \\} \or
    \newcommand{\@supervisorc}{ & {#1} \\} \or
    \newcommand{\@supervisord}{ & {#1} \\} \or
    \newcommand{\@supervisore}{ & {#1} \\} \or
    \newcommand{\@supervisorf}{ & {#1} \\} \or
    \newcommand{\@supervisorg}{ & {#1} \\} \or
    \newcommand{\@supervisorh}{ & {#1} \\}
  \else
    \typeout{Too many supervisors specified, maximum allowed is 7}
  \fi
} 

% Title page
\renewcommand{\maketitle}{
  \thispagestyle{empty}
  \clearpage
    \setcounter{page}{1}  % ``The title page and signature page together
                          % count as the first page of the prefatory material''

    \doublespacing
    \begin{flushleft}

      {\Huge \bfseries \MakeUppercase{\@title} \par}

    \vfill

      A proposal for a thesis submitted in partial fulfilment of the requirements for the degree of\\

      {\large \@degree}

    \vfill

      \begin{tabular}{@{}p{1.2in}p{3in}}
      By: & \@author\\
      Student ID: & \@studentid\\
      Email: & \@email\\
      \end{tabular}

    \vfill

      \@department\\
      \@school\\
      % Insert space before table, bit of a hack but otherwise the table
      % sits too close to the above text
      \vspace{6pt}

      \begin{tabular}{@{}p{1.2in}p{3in}}
      \newcounter{@supervisorsprinted}
      \@whilenum \value{@supervisorsprinted} < \value{@supervisors} \do {
        \stepcounter{@supervisorsprinted}
        \ifcase\value{@supervisorsprinted}
          \typeout{Thesis style--internal error printing supervisors.} \or
          \@supervisora \or
          \@supervisorb \or
          \@supervisorc \or
          \@supervisord \or
          \@supervisore \or
          \@supervisorf \or
          \@supervisorg \or
          \@supervisorh
        \else
          \typeout{Internal error printing supervisors}
        \fi
        }
      \end{tabular}\\

      Date of submission: \@date

    \end{flushleft}
  \clearpage
}

%%---------------------------------------------------------------------------%%
%% Bibliography
%%---------------------------------------------------------------------------%%

% Use the excellent biblatex package with apa style
% minnames=1,maxnames=2 - abbreviates all author names in citations
% hyperref - links in pdf
\RequirePackage[url=false,hyperref=true,style=apa,minnames=1,maxnames=2]{biblatex}

%%---------------------------------------------------------------------------%%
%% PDF Hyperlinks
%%---------------------------------------------------------------------------%%

% Use hyperlinks for convenience, but let's not make them coloured
\usepackage[pdftex,bookmarks,colorlinks,breaklinks,
pdftitle={TITLE},pdfauthor={AUTHOR}]{hyperref}
\hypersetup{
  colorlinks,%
  citecolor=black,%
  filecolor=black,%
  linkcolor=black,%
  urlcolor=black
}

% Custom chapters and biblatex conflict slightly, so render the references heading
% in a different way
\defbibheading{bibliography}[\bibname]{
  \pagebreak
  \section*{#1}
  \markboth{#1}{#1}}

