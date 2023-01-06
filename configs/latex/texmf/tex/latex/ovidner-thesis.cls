\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ovidner-thesis}[ovidner thesis class]

\DeclareOption{showframe}{
  \AtEndOfClass{
    \RequirePackage{showframe}
  }
}
\DeclareOption{glossary}{
  \AtEndOfClass{
    \WarningFilter{glossaries}{Overriding}
    \RequirePackage[nopostdot,nonumberlist]{glossaries}
    \RequirePackage[]{glossaries-extra}
    \setabbreviationstyle[acronym]{long-short}
    \makeglossaries{}
    % Adds a reset of all glossary entries at each chapter
    \pretocmd{\clearforchapter}{\glsresetall}{}{}
    \pdfstringdefDisableCommands{%
      \def\\{}%
      \def\texttt#1{<#1>}%
      \def\glsfmtfull#1{#1}%
      \def\Glsfmtfull#1{#1}%
    }
  }
}
\DeclareOption{article}{
  \AtEndOfClass{

  }
  \PassOptionsToClass{\CurrentOption}{memoir}
}
\DeclareOption{liutitlepage}{
  \AtEndOfClass{
    \newlength{\titlepageverticalmargin}
    \newlength{\titlepagehorizontalmargin}
    \newlength{\titlepagetextwidth}
    \newlength{\titlepagetextheight}
    \newlength{\titlepageliulogoheight}
    \newlength{\titlepagemainblockindent}
    \setlength{\titlepageverticalmargin}{10mm}
    \setlength{\titlepagehorizontalmargin}{10mm}
    \setlength{\titlepagetextwidth}{\paperwidth-2\titlepagehorizontalmargin}
    \setlength{\titlepagetextheight}{\paperheight-2\titlepageverticalmargin}
    \setlength{\titlepageliulogoheight}{3\baselineskip}
    \setlength{\titlepagemainblockindent}{1.898777662\titlepageliulogoheight}

    \renewcommand{\maketitle}{%
      \enlargethispage{\lowermargin}%
      \vspace*{-\uppermargin}%
      \vspace*{-\baselineskip}%
      \vspace*{\titlepageverticalmargin}%
      \noindent%
      \hspace{-\spinemargin}%
      \hspace{\titlepagehorizontalmargin}%
      \begin{minipage}[c][\titlepagetextheight]{\titlepagetextwidth}%
          {\small\sffamily\raggedleft%
              Linköping University | Department of Management and Engineering\\
              \thedocumenttype{} | Division of Product Realisation\\
              \thedraftversion\par
          }

          \vfill

          \hspace{\titlepagemainblockindent}%
          \begin{minipage}{\titlepagetextwidth-\titlepagemainblockindent-\titlepagehorizontalmargin}
              {\Huge\sffamily\raggedright\thetitle\par}
              \vspace{\baselineskip}
              {\large\sffamily\raggedright\thesubtitle\par}
              %\hrule
              %\vspace{0.618\baselineskip}
              %{\Large\liuthinfont\bfseries\raggedright \thetitle\par}
              \vspace{\baselineskip}
              {\sffamily\bfseries\raggedright\theauthor\par}
              % \vspace{2\baselineskip}
              % {\small\sffamily\raggedright%
              %     \begin{tabular}{@{}l@{}@{}l@{}}
              %         Supervisors:~ & Johan Persson, Linköping University \\
              %         & Mattias Vennberg Eriksson, Scania CV AB \\
              %         Examiner:~ & Mehdi Tarkian, Linköping University
              %     \end{tabular}
              % }\par
              % \ifdefempty{\thedraftversion}{}{%
              %     \vspace{2\baselineskip}
              %     {\sffamily\raggedright \thedraftversion\par}
              % }
          \end{minipage}
          \vfill

          \includegraphics[height=\titlepageliulogoheight]{liu-logos/liu-primary-en-black.eps}%
          \hfill%
          \parbox[b]{0.5\linewidth}{\small\sffamily\raggedleft%
              Linköpings universitet\\
              SE-581 83 Linköping\\
              013-28 10 00, www.liu.se%
          }%
      \end{minipage}%
      % This mitigates an overfull hbox
      \hspace*{-\foremargin}%
      \thispagestyle{title}%
    }
  }
}
% Passes any undeclared option on to memoir
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax

% Allows us to silence warnings and errors
\RequirePackage{silence}

\LoadClass{memoir}
% Prints layout measurements in mm instead of pt
\settypeoutlayoutunit{mm}

% pdfusetitle and unicode makes sure that the PDF metadata matches \title and \author
\RequirePackage[hidelinks,pdfusetitle,unicode,naturalnames]{hyperref}
\RequirePackage{bookmark}  % Better bookmarks

% Like Babel, but better
\RequirePackage{polyglossia}

\usepackage[style=iso]{datetime2}

% Various utilities
\RequirePackage{float}
%\RequirePackage{gensymb}
\RequirePackage{graphicx}
\RequirePackage{listings}
% \RequirePackage{amsmath,amssymb,wasysym}
%\RequirePackage{stix}
\RequirePackage{fontspec}
\RequirePackage{unicode-math}
\RequirePackage{multicol}
\RequirePackage{enumitem}
\RequirePackage{pdfpages}
% \RequirePackage[cache=false]{minted}
\RequirePackage[autostyle]{csquotes}
\RequirePackage[style=numeric,alldates=iso,maxnames=4,maxcitenames=2,seconds=true,labeldate=year,sorting=none]{biblatex}
% \RequirePackage[style=authoryear-comp,sorting=nyt,alldates=iso,maxcitenames=2,seconds=true,labeldate=year,labelnumber=true,defernumbers]{biblatex}
\RequirePackage{calc}
\RequirePackage{etoolbox}
\RequirePackage{rotating}
\RequirePackage{mdframed}
\RequirePackage{lipsum}

% Micro-optimizations for better typography. Always enabled with "final" to keep
% page breaks in the same places as final builds.
\RequirePackage[final]{microtype}
\WarningFilter{microtype}{Unknown slot number of character}

\RequirePackage{liustyling}

\RequirePackage{siunitx}
\sisetup{
  %output-exponent-marker = \ensuremath{\mathrm{e}},
  scientific-notation = engineering,
  round-mode = places,
  round-precision = 1,
  round-integer-to-decimal = true,
  table-auto-round
}

\newcommand{\mononumbers}{\addfontfeatures{Numbers={Monospaced}}}
\newcommand{\footfont}{\small\sffamily}
\newcommand{\footpagenumberfont}{\footfont\mononumbers}
\apptocmd{\cftchapterfont}{\sffamily}{}{}
\apptocmd{\cftchapterpagefont}{\sffamily\mononumbers}{}{}
\apptocmd{\cftchapterpresnum}{\mononumbers}{}{}
\apptocmd{\cftsectionfont}{\sffamily}{}{}
\apptocmd{\cftsectionpagefont}{\sffamily\mononumbers}{}{}
\apptocmd{\cftsectionpresnum}{\mononumbers}{}{}
\apptocmd{\cftsubsectionfont}{\sffamily}{}{}
\apptocmd{\cftsubsectionpagefont}{\sffamily\mononumbers}{}{}
\apptocmd{\cftsubsectionpresnum}{\mononumbers}{}{}
\newcommand{\thesubtitle}{}
\newcommand{\subtitle}[1]{%
    \renewcommand{\thesubtitle}{#1}
}
\newcommand{\thedocumenttype}{}
\newcommand{\documenttype}[1]{%
    \renewcommand{\thedocumenttype}{#1}
}
\newcommand{\epigraphpage}[2]{%
    \clearpage
    \thispagestyle{empty}
    \null\vfill\epigraph{#1}{\textsc{#2}}
}
\newcommand{\thedraftversion}{}
\newcommand{\draftversion}[1]{%
    \renewcommand{\thedraftversion}{#1}
}

\makepagestyle{bringhurst}
\makeevenfoot{bringhurst}{{\footpagenumberfont\thepage}}{}{{\footfont\color{gray}\thedraftversion}}
\makeoddfoot{bringhurst}{{\footfont\color{gray}\thedraftversion}}{}{{\footpagenumberfont\thepage}}
\pagestyle{bringhurst}

\setstocksize{240mm}{165mm}
\settrimmedsize{240mm}{165mm}{*}

% Sets the width of the typebox to 0.7 of the paper width, but limiting it to yield lines within 35 to 75 characters.
\settypeblocksize{0.8\paperheight}{\maxof{0.78\xlvchars}{\minof{0.7\paperwidth}{1.15\lxvchars}}}{*}
\setlrmargins{*}{*}{1}
\setulmargins{*}{*}{1}

\AtBeginDocument{
  % Since we prefer to set the language(s) in the main file, we have to run this just before the document begins
  \RequirePackage[noabbrev]{cleveref}

  % This does not log the layout to console, as \checkandfixthelayout does
  \checkthelayout[lines]
  \fixthelayout

  % Use ISO (bold italic) notation for vectors
  \let\vec\symbfit
}

% Removes page number if only one page
\AtEndDocument{\ifnum\value{lastsheet}=1\thispagestyle{empty}\fi}

% https://practicaltypography.com/one-space-between-sentences.html
\frenchspacing

\strictpagecheck

\makeheadstyles{sans}{%
    \chapterstyle{default}
    \apptocmd{\abstractnamefont}{\sffamily}{}{}
    \apptocmd{\booknamefont}{\sffamily}{}{}
    \apptocmd{\partnamefont}{\sffamily}{}{}
    \apptocmd{\chaptitlefont}{\sffamily}{}{}
    \apptocmd{\chapnumfont}{\sffamily\mononumbers}{}{}
    \apptocmd{\chapnamefont}{\sffamily}{}{}
    \apptocmd{\secheadstyle}{\sffamily}{}{}
    \apptocmd{\subsecheadstyle}{\sffamily}{}{}
    \apptocmd{\subsubsecheadstyle}{\sffamily}{}{}
    \pretocmd{\@seccntformat}{\mononumbers}{}{}
}
\headstyles{sans}
\aliaspagestyle{plain}{bringhurst}
\hangcaption
\captionnamefont{\footnotesize}
\captiontitlefont{\footnotesize}


% \usemintedstyle{bw}
% \setminted{
%     bgcolor=liu-gray!2,
%     linenos=true,
%     frame=leftline,
%     rulecolor=liu-gray!50,
%     fontsize=\scriptsize,
%     breaklines=true,
%     breakbefore=.,
%     tabsize=2
% }
% \setminted[python]{
%     tabsize=4
% }
% \renewcommand{\theFancyVerbLine}{%
%     \textcolor{liu-gray!50}{\normalfont\miniscule\sffamily\addfontfeatures{Numbers={Monospaced}}\arabic{FancyVerbLine}}
% }


\newlist{rqs}{enumerate}{2}
\setlist[rqs,1]{label=\textbf{RQ\arabic*},ref=RQ\arabic*,left=0pt}
\setlist[rqs,2]{label=(\alph*),ref=\therqsi(\alph*)}

% Print all names when \fullcite:ing
% https://tex.stackexchange.com/questions/126226/how-do-i-instruct-fullcite-to-use-maxbibnames-rather-than-maxcitenames
\preto\fullcite{\AtNextCite{\defcounter{maxnames}{99}}}

% Don't print ISBN if we have a DOI
% https://tex.stackexchange.com/questions/76534/biblatex-print-isbn-only-if-doi-is-not-defined
\DeclareSourcemap{
  \maps[datatype=bibtex]{
     \map{
        \step[fieldsource=doi,final]
        \step[fieldset=isbn,null]
        \step[fieldset=issn,null]
        \step[fieldset=url,null]
        \step[fieldset=urldate,null]
        }
      }
}

\newsubfloat{figure}% Allow subfloats in figure environment

\WarningFilter{hyperref}{Draft mode on}
\WarningFilter{l3regex}{This package is obsolete}

\AtBeginEnvironment{quote}{\itshape}
\AtEndEnvironment{quote}{\normalfont}
