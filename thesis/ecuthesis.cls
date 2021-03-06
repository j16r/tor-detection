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
\RequirePackage[cm]{fullpage}

% Don't use hyphenation
\hyphenpenalty=100000

% Support for floats
\RequirePackage{float}

%%---------------------------------------------------------------------------%%
%% Fonts - requires xetex
%%---------------------------------------------------------------------------%%

\RequirePackage[cm-default]{fontspec}
\RequirePackage{xunicode}
\RequirePackage{xltxtra}

\defaultfontfeatures{Scale=MatchLowercase}

\setsansfont[Mapping=tex-text,Scale=1.1]{Optima}
\setmonofont{Menlo}

%%---------------------------------------------------------------------------%%
%% Table of contents
%%---------------------------------------------------------------------------%%

\RequirePackage{tocloft}

%%---------------------------------------------------------------------------%%
%% Chapters/Titles
%%---------------------------------------------------------------------------%%

% This package gives us more control over title format
\RequirePackage[calcwidth]{titlesec}

% Use the fancy chapter package for chapter headings
\usepackage[Bjornstrup]{fncychap}

\ChTitleVar{\raggedleft\Huge\sffamily\bfseries}

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
\emergencystretch 5em

%%---------------------------------------------------------------------------%%
%% Bibliography
%%---------------------------------------------------------------------------%%

\RequirePackage[american]{babel}
\RequirePackage{csquotes}

% Use the excellent biblatex package with apa style
% minnames=1,maxnames=2 - abbreviates all author names in citations
% hyperref - links in pdf
\RequirePackage[
  url = false,
  hyperref = true,
  style = apa,
  minnames = 1,
  maxnames = 2,
  bibencoding = utf8]{biblatex}
\DeclareLanguageMapping{american}{american-apa}
\DefineBibliographyStrings{american}{% adapt language
  page = {{}p\adddot},
  pages = {{}pp\adddot},
}

% Custom chapters and biblatex conflict slightly, so render the references heading
% in a different way
\defbibheading{bibliography}[\bibname]{
  \chapter{Bibliography}
  \section*{#1}
  \markboth{#1}{#1}
}

%%---------------------------------------------------------------------------%%
%% Headers and footers
%%---------------------------------------------------------------------------%%

% Use the fancy header package
\RequirePackage{fancyhdr}

%%---------------------------------------------------------------------------%%
%% Code sections
%%---------------------------------------------------------------------------%%

\RequirePackage{listings}
\lstset{
  basicstyle=\ttfamily,
  xleftmargin=36pt,
  xrightmargin=12pt,
  numberstyle=\tiny,              % the size of the fonts that are used for the line-numbers
  numbers=left,                   % where to put the line-numbers
  stepnumber=1,                   % the step between two line-numbers. If it's 1 each line
  tabsize=2,                      % sets default tabsize to 2 spaces
  breaklines=true,                % sets automatic line breaking
  breakatwhitespace=true,         % sets if automatic breaks should only happen at whitespace
  escapeinside={\%*}{*)},         % if you want to add a comment within your code
  showstringspaces=false,         % don't show spaces in strings as little _ style characters
}


%%---------------------------------------------------------------------------%%
%% Tables
%%---------------------------------------------------------------------------%%

\RequirePackage{booktabs}

%%---------------------------------------------------------------------------%%
%% Lists
%%---------------------------------------------------------------------------%%

% mdwlist provides more compact lists
\RequirePackage{mdwlist}

%%---------------------------------------------------------------------------%%
%% Customize the abstract
%%---------------------------------------------------------------------------%%

\renewenvironment{abstract}{
  \pagebreak
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
  \clearpage
  \thispagestyle{empty}
  \setcounter{page}{1}  % ``The title page and signature page together
                        % count as the first page of the prefatory material''

  \begin{flushright}

    \fontspec[Scale=1.2]{Georgia}

    {\Huge {\@title} \par}

    \rule{\linewidth}{5pt}

    A thesis submitted in partial fulfilment of the requirements for the degree of\\
    {\large \@degree}

  \end{flushright}

  \vfill

  \begin{flushleft}

    \fontspec[Scale=1.2]{Baskerville}

    \begin{tabular}{@{}p{1.2in}p{3in}}
    By: & \@author\\
    Student ID: & \@studentid\\
    Email: & \@email\\
    \end{tabular}

    \vfill

    {
      \large
      \@department\\
      \@school\\
    }

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
    \end{tabular}

    \vspace{6pt}

    Date of submission: \@date

  \end{flushleft}
  \clearpage
}

%%---------------------------------------------------------------------------%%
%% PDF Hyperlinks
%%---------------------------------------------------------------------------%%

% Use hyperlinks for convenience, but let's not make them coloured
\RequirePackage[bookmarks,colorlinks,breaklinks]{hyperref}
\hypersetup{
  colorlinks,
  citecolor=black,
  filecolor=black,
  linkcolor=black,
  urlcolor=black
}
