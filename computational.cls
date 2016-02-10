\LoadClass[a4paper,11pt]{article}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{computational}[2015/09/21 - My Document Class for Scientific Computing disciplines]

\RequirePackage{titlesec}
\RequirePackage[top=2cm, bottom=2.25cm, left=2cm, right=2cm]{geometry}
\RequirePackage{mdframed}
\RequirePackage{textcomp}
\RequirePackage{mathptmx}
\RequirePackage{placeins}
\RequirePackage{multicol}

\DeclareOption{no-stat}{\def\@nostat{1}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\newcommand{\textapprox}{\raisebox{0.5ex}{\texttildelow}}

\newcommand{\mac}{%
\ifdefined\dir
Macbook-Pro:\dir crepaldi
\else
Macbook-Pro:\textapprox crepaldi
\fi
}

\newcommand{\setdir}[1]{\gdef\@dir{#1}}
\newcommand{\directory}{\@dir}

\newcommand{\unix}{%
\ifdefined\@dir
username@tktl-pangolin:\textapprox\@dir
\else
username@tktl-pangolin:\textapprox
\fi
} %pangolin


\newcommand*{\setos}[1]{\gdef\@os{#1}}
\newcommand*{\@os}{}

\newcommand{\cmd}[2][]{%
\if\@os1
\indent\texttt{\footnotesize\unix{#1}\$ #2}\par
\else
    \if\@os2
    \indent\texttt{\footnotesize\mac{#1}\$ #2}\par
    \else
    \if\@os3
    \indent\texttt{\footnotesize\$ #2}\par
    \else 
    Operating System (O.S.) not suported, please choose betwen unix (1) or mac (2) or none(3).
    \fi
\fi
\fi
}

%\newcommand{\shellcmd}[2][]{\indent\texttt{\footnotesize\unix{#1}\$ #2}}
%\newcommand{\bashcmd}[2][]{\indent\texttt{\footnotesize\mac{#1}\$ #2}}
\newcommand{\gdb}[1]{\indent\texttt{\footnotesize(gdb) #1}\par}
\newcommand{\resp}[1]{\indent\texttt{\footnotesize #1}\par}

%\usepackage{fancyvrb}
%\DefineVerbatimEnvironment{shell}{Verbatim}{commandchars=\%\{\},formatcom=\setcounter{prompt}{0}}
%\newcounter{prompt}
%\newcommand{\prompt}{\stepcounter{prompt}\theprompt>}

\newcounter{prob}

\newcommand{\problem}{%
\stepcounter{prob}
{\vspace{.3cm}\huge\bf Problem \theprob\par\vspace{.5cm}}
}

\newcommand*{\course}[1]{\gdef\@course{#1}%
}
\newcommand*{\@course}{\texttt{\string\course} currently
not set. Please fix this.}
\newcommand*{\professor}[1]{\gdef\@professor{#1}%
}
\newcommand*{\@professor}{\texttt{\string\professor} currently
not set. Please fix this.}


\newcommand{\stat}{%
\ifdefined\@nostat
\relax
\else
\section*{Note}
\def\@os{2}
This exercise was done using a ssh remote login through my pangolin (pangolin.it.helsinki.fi) university linux account while using my macbook pro with OS X.
To do such a thing, the following command was run in the OS X Yosemite terminal.

\cmd{ssh username@pangolin.it.helsinki.fi}

The editor I used to edit files and write codes was \textbf{emacs}.
All files (and Makefiles, when applicable) created by the student and used in this exercise were packed together with this PDF documentation and shall be available to the assistant for further analysis in its own problem folder.
\fi
}

\renewcommand*{\maketitle}{%
{%
\centering
{\scshape\LARGE University of Helsinki \par Department of Physics \par}
\vspace{.5cm}
{\scshape\Large\@course\unskip\strut\par}
\vspace{.8cm}
{\huge\bfseries\@title\unskip\strut\par}
\vspace{.8cm}
{\Large\itshape Student: \@author\unskip\strut\par}
\vspace{.3cm}
{\Large\itshape Professor: \@professor\unskip\strut\par}
\vspace{.8cm}
{\large \@date\par}
\vspace{.5cm}
\hrule
\vspace{1cm}
}
\stat
\vspace{.5cm}
}

\newcounter{comcount}

\newenvironment{shell}{%
\stepcounter{comcount}
\medskip
\centering{\textbf{Command \thecomcount}}
\medskip
\begin{mdframed}
\vspace{.2cm}
}{%
\end{mdframed}
\medskip
}