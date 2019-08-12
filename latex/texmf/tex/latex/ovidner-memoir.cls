\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ovidner-memoir}[custom convenience class]

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

% Various utilities
\RequirePackage{float}
\RequirePackage{gensymb}
\RequirePackage{graphicx}
\RequirePackage{listings}
% \RequirePackage{amsmath,amssymb,wasysym}
% \RequirePackage{stix}
\RequirePackage{fontspec}
\RequirePackage{unicode-math}
\RequirePackage{multicol}
\RequirePackage{enumitem}
\RequirePackage{pdfpages}
\RequirePackage{csquotes}
\RequirePackage[alldates=iso,seconds=true,style=authoryear]{biblatex}
\RequirePackage{calc}
\RequirePackage{etoolbox}
\RequirePackage{rotating}
\RequirePackage{mdframed}
\RequirePackage{amsfonts}

% Micro-optimizations for better typography.
% Always enabled with "final" to keep page breaks in the same places as final builds.
\RequirePackage[final]{microtype}

\RequirePackage{siunitx}
\sisetup{
  %output-exponent-marker = \ensuremath{\mathrm{e}},
  scientific-notation = engineering,
  round-mode = places,
  round-precision = 1,
  round-integer-to-decimal = false
}

% Better cross-references
\RequirePackage[noabbrev]{cleveref}

\newcommand{\footfont}{\small\sffamily}
\newcommand{\footpagenumberfont}{\footfont\addfontfeatures{Numbers={Monospaced}}}
\newcommand{\thesubtitle}{}
\newcommand{\subtitle}[1]{%
    \renewcommand{\thesubtitle}{#1}
}

\makepagestyle{bringhurst}
\makeevenfoot{bringhurst}{{\footpagenumberfont\thepage}}{}{}
\makeoddfoot{bringhurst}{}{}{{\footpagenumberfont\thepage}}
\pagestyle{bringhurst}
\aliaspagestyle{plain}{bringhurst}

% Sets the width of the typebox to a golden ratio of the paper width, but limiting it to yield lines within 35 to 75 characters.
\settypeblocksize{0.75\paperheight}{\maxof{0.78\xlvchars}{\minof{0.618\paperwidth}{1.15\lxvchars}}}{*}
\setlrmargins{*}{*}{1}
\setulmargins{*}{*}{1.618}

% Removes page number if only one page
\AtEndDocument{\ifnum\value{lastsheet}=1\thispagestyle{empty}\fi}

% Use ISO (bold italic) notation for vectors
\AtBeginDocument{\let\vec\symbfit}

% https://practicaltypography.com/one-space-between-sentences.html
\frenchspacing

% Caption style
\hangcaption
\captionnamefont{\footnotesize}
\captiontitlefont{\footnotesize}

\WarningFilter{hyperref}{Draft mode on}
\WarningFilter{l3regex}{This package is obsolete}
\WarningFilter{microtype}{Unknown slot number of character}

\AtBeginDocument{
  % This does not log the layout to console, as \checkandfixthelayout does
  \checkthelayout[lines]
  \fixthelayout
}
