%%---------------------------------------------------------------------------%%
%% Conference paper class
%% By: John Barker
%% Custom page layout for my conference paper 
%%---------------------------------------------------------------------------%%

% Base on report class.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{conference}[2010/04/19 Thesis Style]
\ProcessOptions
\LoadClass[a4wide,onecolumn,12pt]{report}
\usepackage[cm]{fullpage}

\usepackage{csquotes}
\usepackage[english]{babel}

% Use sans-serif font
% \usepackage{helvet}
%\renewcommand{\familydefault}{\sfdefault}

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
%% Bibliography
%%---------------------------------------------------------------------------%%

% Use REFERENCES as heading rather than bibliography
\renewcommand{\bibname}{REFERENCES}

% Bibliography should be single spaced, and placed in the table of contents
%\RequirePackage[sort]{natbib}
%\bibliographystyle{apalike2}
%\usepackage{url}

\RequirePackage[natbib=true,style=apa]{biblatex}

% FIXME: Can't use this, it's broken doesn't support our bibtex files very well
% Use actual apacite package
% \RequirePackage{apacite}
% \bibliographystyle{apacite}

%%---------------------------------------------------------------------------%%
%% PDF Hyperlinks
%%---------------------------------------------------------------------------%%

% Use hyperlinks for convenience, but let's not make them coloured
%\usepackage[pdftex,bookmarks,colorlinks,breaklinks,pagebackref,
%pdftitle={TITLE},pdfauthor={AUTHOR}]{hyperref}
%\hypersetup{
%  colorlinks,%
%  citecolor=black,%
%  filecolor=black,%
%  linkcolor=black,%
%  urlcolor=black
%}
