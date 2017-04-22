% University of Alabama MS/PhD thesis/dissertation LaTeX Class File
%
% Copyright (c) 2012 Paul Kilgo
% The latest version of this file may be obtained from
%   https://github.com/OEP/uathesis
%
% License: LaTeX Project Public License (www.latex-project.org/lppl.txt)
%   Executive summary:
%       This software is copyright but you are granted a license which gives
%       you, the "user" of the software, legal permission to copy, distribute,
%       and/or modify the software. However, if you modify the software and
%       then distribute it (even just locally) you must change the name of the
%       software to avoid confusion.
%
% OR (dual-licensed)
%
% License: GNU Lesser General Public License (www.gnu.org/licenses/lgpl.html)
%
% Author Information:
%   Paul Kilgo
%   The University of Alabama
%   paulkilgo@gmail.com
%
% Any change requests are appreciated if proposed through Github. Any bug
% reporting should also be done through Github as well.
%
% Happy writing!

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{uathesis}

\RequirePackage{ifthen}

\newif\ifthesis
\DeclareOption{thesis}{\thesistrue}
\DeclareOption{dissertation}{\thesisfalse}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{report}%
}
\ProcessOptions\relax
\LoadClass[letter,12pt]{report}

% margins
\usepackage[top=1in,bottom=1in,left=1in,right=1in]{geometry}
\usepackage{titlesec}
\usepackage{setspace}
\usepackage{textcase}
\usepackage{tocloft}
\usepackage[nonumberlist,xindy,toc]{glossaries}

\renewcommand{\glossaryname}{LIST OF ABBREVIATIONS AND SYMBOLS}

\renewcommand{\cfttoctitlefont}{\pagebreak\vspace*{1in}\hspace{.43\linewidth}\MakeTextUppercase}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftchapfont}{ }
\renewcommand{\cftdot}{.}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchappagefont}{}

\renewcommand{\contentsname}{\textbf{CONTENTS}}

\renewcommand{\cftloftitlefont}{\pagebreak\hfill\MakeTextUppercase}
\renewcommand{\cftafterloftitle}{\hfill}

\renewcommand{\cftlottitlefont}{\pagebreak\hfill\MakeTextUppercase}
\renewcommand{\cftafterlottitle}{\hfill}

%% Title spacings.
\titlespacing{\chapter}{0pt}{2in}{1in}

%% Thesis committee
\newcommand\committee[1]{\renewcommand\@committee{#1}}
\newcommand\@committee{Committee undefined}

%% Adviser
\newcommand\adviser[1]{\renewcommand\@adviser{#1}}
\newcommand\@adviser{Adviser undefined}

%% Candidate degree
\newcommand\degree[1]{\renewcommand\@degree{#1}}
\newcommand\@degree{Undefined Degree}

%% University (if not UA)
\newcommand\university[1]{\renewcommand\@university{#1}}
\newcommand\@university{The University of Alabama}

%% Department
\newcommand\department[1]{\renewcommand\@department{#1}}
\newcommand\@department{Undefined Department}

%% School (in case of undergrad thesis or something)
\newcommand\school[1]{\renewcommand\@school{#1}}
\newcommand\@school{Graduate School}

%% Year of graduation
\newcommand\gradyear[1]{\renewcommand\@gradyear{#1}}
\newcommand\@gradyear{\the\year}

%% Place
\newcommand\place[1]{\renewcommand\@place{#1}}
\newcommand\@place{Tuscaloosa, Alabama}

%% Abstract body text
\renewcommand\abstract[1]{\renewcommand\@abstract{#1}}
\newcommand\@abstract{No abstract body text.}

%% Dedication body text
\newcommand\dedication[1]{\renewcommand\@dedication{#1}}
\newcommand\@dedication{No dedication body text.}

%% Acknowledgments body text
\newcommand\acknowledgments[1]{\renewcommand\@acknowledgments{#1}}
\newcommand\@acknowledgments{No acknowledgments body text.}

%% Rename bibliography
\renewcommand{\bibname}{References}

%% Do not add vspace between chapters
%% Hack taken from:
%% http://tex.stackexchange.com
%% /questions/784/how-to-change-the-line-spacing-in-my-list-of-figures
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}

% Make the front matter...
\newcommand{\makefrontmatter}{
  \thispagestyle{empty}
  \vspace*{50\p@}
  \begin{center}
    \begin{doublespace}
    \renewcommand{\and}{\NoCaseChange{\\}}
    \MakeTextUppercase{\@title} \linebreak \linebreak
    by \linebreak
    \MakeTextUppercase{\@author}
    \begin{singlespace}
      \MakeTextUppercase{\@adviser, Committee Chair \and \@committee}
    \end{singlespace}
    
    \hfill \linebreak
    \ifthesis
      A THESIS
    \else
      A DISSERTATION
    \fi
    \hfill \linebreak
    \begin{singlespace}
	  Submitted in partial fulfillment of the requirements \\
      for the degree of \@degree \\
      in the Department of \@department \\
      in the \@school\,of \\
      \@university
    \end{singlespace}
	\hfill \linebreak
	\hfill \linebreak
	\MakeTextUppercase{\@place}
	\hfill \linebreak
	\hfill \linebreak
	\@gradyear
  \end{doublespace}
  \end{center}
  \pagebreak

    \begin{frontmatter}

	\topskip=1in
    \chapter*{\textbf{ABSTRACT}}
    \addcontentsline{toc}{chapter}{ABSTRACT}
	\topskip=-1in

    \@abstract

\topskip=1in
    \chapter*{\textbf{DEDICATION}}
    \addcontentsline{toc}{chapter}{DEDICATION} 
    \@dedication
\pagebreak
    %% Print everything in the glossary.
    \glsaddall
    \printglossary[toctitle={LIST OF ABBREVIATIONS AND SYMBOLS},title={\textbf{LIST OF ABBREVIATIONS AND SYMBOLS}}]
    \glsresetall

    \chapter*{\textbf{ACKNOWLEDGMENTS}}
    \addcontentsline{toc}{chapter}{ACKNOWLEDGMENTS}

    \@acknowledgments
\topskip=-1in
    %% ToC entries have double spaced but only longer-than-1-lines have single space.
    \renewcommand\cftchapafterpnum{\vskip12pt}
    \renewcommand\cftsecafterpnum{\vskip12pt}
    \renewcommand\cftsubsecafterpnum{\vskip12pt}
    \begin{spacing}{1}
      \tableofcontents
    \end{spacing}

    \listoftables 
    \addcontentsline{toc}{chapter}{LIST OF TABLES} 

    \listoffigures
    \addcontentsline{toc}{chapter}{LIST OF FIGURES} 

    \end{frontmatter}

}
  
\newcommand{\makecopyright}{
  \thispagestyle{empty}
  \singlespacing
  \null \vfill
  \begin{center}
    Copyright \@author\,\@gradyear \\
    ALL RIGHTS RESERVED
  \end{center}
}


\newenvironment{frontmatter}{
  \makecopyright
  \pagebreak
  \pagenumbering{roman}
  \setcounter{page}{2}
  \setcounter{chapter}{0}
  \begin{doublespace}
  \renewcommand{\@makechapterhead}[1]
  {
    \begin{center}
      \MakeTextUppercase{ ##1 }
    \end{center}
  }
  \renewcommand{\@makeschapterhead}[1]
  {
    \begin{center}
      \MakeTextUppercase{ ##1 }
    \end{center}
  }
}
{
    \end{doublespace}
}
\newenvironment{body}
{
  \pagebreak
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \setcounter{chapter}{0}
  \begin{doublespace}
  \renewcommand{\@makechapterhead}[2]
  {
    \vspace*{50\p@}%
    \begin{center}
      \MakeTextUppercase{ \textbf{ \@chapapp\space \thechapter } }
      \linebreak
      \MakeTextUppercase{ \textbf{ ##1 } }
    \end{center}
  }
  
  \renewcommand{\@makeschapterhead}[1]
  {
    \begin{center}
      \MakeTextUppercase{ \textbf{ ##1 } }
    \end{center}
  }
  
  \renewcommand{\section}
  {
    \@startsection{section}{1}{0mm}{4ex}{2ex}{\normalsize\bfseries}
  }
  
  \renewcommand{\subsection}
  {
    \@startsection{subsection}{1}{0mm}{1mm}{1mm}{\normalsize\bfseries}
  }
}
{
  \end{doublespace}
}

\makeglossaries
