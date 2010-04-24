%%---------------------------------------------------------------------------%%
%% ECU Thesis class
%% By: John Barker
%% Custom page layout for my ECU thesis/proposal submission
%%---------------------------------------------------------------------------%%

% Base on report class.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ecuthesis}[2010/04/19 Thesis Style]
\ProcessOptions
\LoadClass[a4wide,onecolumn,12pt]{report}
\usepackage[cm]{fullpage}
\usepackage[english]{babel}

% Use sans-serif font
% \usepackage{helvet}
\renewcommand{\familydefault}{\sfdefault}

% Support for floats
\usepackage{float}

%%---------------------------------------------------------------------------%%
%% Chapters/Titles
%%---------------------------------------------------------------------------%%

% This package gives us more control over title format
\usepackage{titlesec}

% Customize the chapter titles with a line underneath and no 'Chapter X' 
% label
\titleformat{\chapter}[display]
  {} % format
  {} % label
  {0pt} % separator
  { \bfseries
    \LARGE
    \uppercase} % before
  [ \titlerule ] % after

\titlespacing{\chapter}{0pt}{*0}{12pt}
\titlespacing{\section}{0pt}{*0}{6pt}
\titlespacing{\subsection}{0pt}{*0}{6pt}
\titlespacing{\subsubsection}{0pt}{*0}{6pt}
\titlespacing{\subsubsection}{0pt}{*0}{*0}
\titlespacing{\paragraph}{0pt}{*0}{*0}

%%---------------------------------------------------------------------------%%
%% Paragraphs and spacing
%%---------------------------------------------------------------------------%%

%% Double Spacing
\RequirePackage{setspace}

%% Don't indent paragraphs
\parindent 0pt
\parskip 12pt

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

      {\Large \bfseries \MakeUppercase{\@title} \par}

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

% Use REFERENCES as heading rather than bibliography
\renewcommand{\bibname}{REFERENCES}

% Bibliography should be single spaced, and placed in the table of contents
% It should use an APA-like format.
\RequirePackage[sort]{natbib}
\bibliographystyle{apalike2}
\usepackage{url}

% FIXME: Can't use this, it's broken doesn't support our bibtex files very well
% Use actual apacite package
% \RequirePackage{apacite}
% \bibliographystyle{apacite}

%%---------------------------------------------------------------------------%%
%% PDF Hyperlinks
%%---------------------------------------------------------------------------%%

% Use hyperlinks for convenience, but let's not make them coloured
\usepackage[pdftex,bookmarks,colorlinks,breaklinks,pagebackref,
pdftitle={TITLE},pdfauthor={AUTHOR}]{hyperref}
\hypersetup{
  colorlinks,%
  citecolor=black,%
  filecolor=black,%
  linkcolor=black,%
  urlcolor=black
}
