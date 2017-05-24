%
% sbadvising.cls v.0.1
%
% CSU San Bernardino Student Advising Class
%
% Writen by:
%    Keith Evan Schubert, Ph.D., E.I.T.
%    December 9, 2009
%    v.0.1
% Contents:
%    Basic layout, titlepage, dedication, acknowledgements, abstract
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sbadvising}[2009/12/09 v0.1 CSUSB Advising Class]
\RequirePackage{ifthen}
\RequirePackage{suffix}
\RequirePackage[letterpaper]{geometry}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}
\typeout{*****************************************************************}
\typeout{** California State University, San Bernardino Advising Class  **}
\typeout{** Written by Keith Evan Schubert                              **}
\typeout{**            Associate Professor                              **}
\typeout{**            Department of Computer Science and Engineering   **}
\typeout{*****************************************************************}

\renewcommand{\normalsize}{\fontsize{12pt}{12pt}\selectfont}%
\geometry{paperwidth=8.5in,paperheight=11in,includehead=false,top=.25in,left=.25in,right=.25in,bottom=.25in,footskip=.5in}%
\markboth{}{}%clear the old headers that comes from thesis
%
%               Declaring Variables
%
%\fboxrule{1pt}
%\fboxsep{5pt}
\gdef\@department{Department of Computer Science and Engineering}
\newcommand{\Department}[1]{\gdef\@department{#1}}
\gdef\@student{}
\newcommand{\Student}[1]{\gdef\@student{#1}}
\gdef\@studentid{}
\newcommand{\StudentID}[1]{\gdef\@studentid{#1}}
\gdef\@advisor{}
\newcommand{\Advisor}[1]{\gdef\@advisor{#1}}
\gdef\@catalogyear{}
\newcommand{\Catalog}[1]{\gdef\@catalogyear{#1}}
\gdef\@bscs{}
\newcommand{\BSCS}{\gdef\@bscs{X}}
\gdef\@bacs{}
\newcommand{\BACS}{\gdef\@bacs{X}}
\gdef\@bsbi{}
\newcommand{\BSBI}{\gdef\@bsbi{X}}
\gdef\@bsce{}
\newcommand{\BSCE}{\gdef\@bsce{X}}
%
% set up the quarter, year selection boxes
%
\newcommand{\@validblocks}{%
  {a},%
  {b},%
  {c},%
  {d}%
}
\newcommand{\@validquarters}{%
  {fall}{F}{4},%
  {winter}{W}{1},%
  {spring}{Sp}{2},%
  {summer}{Su}{3}%
}
\newcommand{\get@quarter}[3]{%
  \def\@quarter@label{#1}%
  \def\@quarter@text{#2}%
  \def\@quarter@value{#3}%
}
\newcommand{\reset@blocks}{%
  \@for\@theblock:=\@validblocks\do{
    \@for\@thequarter:=\@validquarters\do{%
    \expandafter\get@quarter\@thequarter
    \ifthenelse{\equal{4}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\makebox[.5in]{F}}}{}%
    \ifthenelse{\equal{1}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\makebox[.5in]{W}}}{}%
    \ifthenelse{\equal{2}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\makebox[.5in]{Sp}}}{}%
    \ifthenelse{\equal{3}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\makebox[.5in]{Su}}}{}%
    }
  \@namedef{year@\@theblock}{\underline{\makebox[.5in]{}}}
  \@namedef{schedule@i@\@theblock}{\underline{\makebox[3in]{}}}
  \@namedef{schedule@ii@\@theblock}{\underline{\makebox[3.65in]{}}}
  \@namedef{schedule@iii@\@theblock}{\underline{\makebox[3.65in]{}}}
  \@namedef{schedule@iv@\@theblock}{\underline{\makebox[3.65in]{}}}
  \@namedef{comment@i@\@theblock}{\underline{\makebox[2.85in]{}}}
  \@namedef{comment@ii@\@theblock}{\underline{\makebox[3.65in]{}}}
  }%
}
\reset@blocks
\newcounter{block}
\setcounter{block}{0}

\newcommand{\schedule}[6]{
  \addtocounter{block}{1}
  \def\@curblock{\alph{block}}
  \@namedef{schedule@i@\@curblock}{\underline{\makebox[3in]{#1}}}
  \@namedef{schedule@ii@\@curblock}{\underline{\makebox[3.65in]{#2}}}
  \@namedef{schedule@iii@\@curblock}{\underline{\makebox[3.65in]{#3}}}
  \@namedef{schedule@iv@\@curblock}{\underline{\makebox[3.65in]{#4}}}
  \@namedef{comment@i@\@curblock}{\underline{\makebox[2.85in]{#5}}}
  \@namedef{comment@ii@\@curblock}{\underline{\makebox[3.65in]{#6}}}
}

  \newcounter{quarter}
  \newcounter{yearcounter}
  \newcounter{nextyear}
  \newcounter{whichyear}
  \newcounter{stopblock}
  \newcommand{\@blockdone}{false}
\newcommand{\setupadvice}[3]{
  \setcounter{yearcounter}{#2}
  \setcounter{nextyear}{\value{yearcounter}}
  \addtocounter{nextyear}{1}
  \setcounter{whichyear}{1}
  \setcounter{stopblock}{#3}
  \renewcommand{\@blockdone}{false}
  \@for\@thequarter:=\@validquarters\do{
    \expandafter\get@quarter\@thequarter
    \ifthenelse{\equal{\@quarter@label}{#1}}{\setcounter{quarter}{\@quarter@value}}{}
  }
  \@for\@theblock:=\@validblocks\do{
    \ifthenelse{\equal{\@blockdone}{false}}{
      \ifthenelse{\equal{\@theblock}{\alph{stopblock}}}{\renewcommand{\@blockdone}{true}}{}
      \@for\@thequarter:=\@validquarters\do{%
        \expandafter\get@quarter\@thequarter
        \ifthenelse{\equal{\@quarter@value}{\value{quarter}}}{
          \ifthenelse{\equal{4}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\framebox[.5in]{F}}}{}%
          \ifthenelse{\equal{1}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\framebox[.5in]{W}}}{}%
          \ifthenelse{\equal{2}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\framebox[.5in]{Sp}}}{}%
          \ifthenelse{\equal{3}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\framebox[.5in]{Su}}}{}%
        }{
          \ifthenelse{\equal{4}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\makebox[.5in]{F}}}{}%
          \ifthenelse{\equal{1}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\makebox[.5in]{W}}}{}%
          \ifthenelse{\equal{2}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\makebox[.5in]{Sp}}}{}%
          \ifthenelse{\equal{3}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\makebox[.5in]{Su}}}{}%
        }
      }
    \ifthenelse{\equal{\value{whichyear}}{1}}{
    \@namedef{year@\@theblock}{\underline{\makebox[.5in]{\arabic{yearcounter}}}}
    }{
    \@namedef{year@\@theblock}{\underline{\makebox[.5in]{\arabic{nextyear}}}}
    }
    }{}
    \addtocounter{quarter}{1}
    \ifthenelse{\equal{\value{quarter}}{5}}{\setcounter{quarter}{1}\addtocounter{whichyear}{1}}{}
  }
}
\WithSuffix\newcommand\setupadvice*[3]{%
  \setcounter{yearcounter}{#2}%
  \setcounter{nextyear}{\value{yearcounter}}%
  \addtocounter{nextyear}{1}%
  \setcounter{whichyear}{1}%
  \setcounter{stopblock}{#3}%
  \renewcommand{\@blockdone}{false}%
  \@for\@thequarter:=\@validquarters\do{%
    \expandafter\get@quarter\@thequarter%
    \ifthenelse{\equal{\@quarter@label}{#1}}{\setcounter{quarter}{\@quarter@value}}{}%
  }%
  \@for\@theblock:=\@validblocks\do{%
    \ifthenelse{\equal{\@blockdone}{false}}{%
      \ifthenelse{\equal{\@theblock}{\alph{stopblock}}}{\renewcommand{\@blockdone}{true}}{}%
      \@for\@thequarter:=\@validquarters\do{%
        \expandafter\get@quarter\@thequarter%
        \ifthenelse{\equal{\@quarter@value}{\value{quarter}}}{%
          \ifthenelse{\equal{4}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\framebox[.5in]{F}}}{}%
          \ifthenelse{\equal{1}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\framebox[.5in]{W}}}{}%
          \ifthenelse{\equal{2}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\framebox[.5in]{Sp}}}{}%
          \ifthenelse{\equal{3}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\framebox[.5in]{Su}}}{}%
        }{%
          \ifthenelse{\equal{4}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\makebox[.5in]{F}}}{}%
          \ifthenelse{\equal{1}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\makebox[.5in]{W}}}{}%
          \ifthenelse{\equal{2}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\makebox[.5in]{Sp}}}{}%
          \ifthenelse{\equal{3}{\@quarter@value}}{\@namedef{\@quarter@label @\@theblock}{\makebox[.5in]{Su}}}{}%
        }%
      }%
    \ifthenelse{\equal{\value{whichyear}}{1}}{%
    \@namedef{year@\@theblock}{\underline{\makebox[.5in]{\arabic{yearcounter}}}}%
    }{%
    \@namedef{year@\@theblock}{\underline{\makebox[.5in]{\arabic{nextyear}}}}%
    }%
    }{}%
    \addtocounter{quarter}{1}%
    \ifthenelse{\equal{\value{quarter}}{3}}{\setcounter{quarter}{4}}{}%
    \ifthenelse{\equal{\value{quarter}}{5}}{\setcounter{quarter}{1}\addtocounter{whichyear}{1}}{}%
  }%
}%
%
%  Sheet
%
\newcommand{\makesheet}{\begin{center}
{\MakeUppercase{\@department}\\ ADVISING SHEET}
\end{center}
\vspace{.2in}
\begin{flushright}ADVISOR:\underline{\makebox[2.5in]{\@advisor}}\makebox[.25in]{}\end{flushright}
\begin{center}
Student Name:\underline{\makebox[4in]{\@student}} SID\#\underline{\makebox[1.5in]{\@studentid}}
\end{center}
\begin{center}
Catalog Year:\underline{\makebox[1.5in]{\@catalogyear}}
(BS)\underline{\makebox[.5in]{\@bscs}}
(BA)\underline{\makebox[.5in]{\@bacs}}
(BINF)\underline{\makebox[.5in]{\@bsbi}}
(CE)\underline{\makebox[.5in]{\@bsce}}
\end{center}
\begin{tabular}{|p{3.75in}||p{3.75in}|}\hline
&\\
Quarter: \fall@a \winter@a \spring@a \summer@a Year:\year@a &Quarter: \fall@b \winter@b \spring@b \summer@b Year:\year@b \\
&\\
Schedule:\schedule@i@a &Schedule:\schedule@i@b\\
&\\
\schedule@ii@a &\schedule@ii@b\\
&\\
\schedule@iii@a &\schedule@iii@b\\
&\\
\schedule@iv@a &\schedule@iv@b\\
&\\
Comments:\comment@i@a&Comments:\comment@i@b\\
&\\
\comment@ii@a&\comment@ii@b\\
&\\\hline\hline
&\\
Quarter: \fall@c \winter@c \spring@c \summer@c Year:\year@c &Quarter: \fall@d \winter@d \spring@d \summer@d Year:\year@d \\
&\\
Schedule:\schedule@i@c &Schedule:\schedule@i@d\\
&\\
\schedule@ii@c &\schedule@ii@d\\
&\\
\schedule@iii@c &\schedule@iii@d\\
&\\
\schedule@iv@c &\schedule@iv@d\\
&\\
Comments:\comment@i@c&Comments:\comment@i@d\\
&\\
\comment@ii@c&\comment@ii@d\\
&\\\hline
\end{tabular}

\vspace{2in}
Today's Date:\underline{\makebox[1.75in]{\today}}

\vspace{.3in}
Advisor's Signature\underline{\makebox[3in]{}}

\vspace{.6in}
{\small \LaTeX version }{\tiny KES}
}



