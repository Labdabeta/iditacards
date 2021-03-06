\LoadClass{standalone}
% NOTE: Cloud colour is 76baff

\ProvidesClass{iditacard}[2017/05/12 Class for Iditacard cards]

\RequirePackage{fontspec}
\RequirePackage{xcolor}

\RequirePackage[none]{hyphenat}

\RequirePackage{tikz}
\usetikzlibrary{positioning,shapes,shadows,arrows,backgrounds,fit}
\RequirePackage{shapepar}
\RequirePackage{microtype}

\graphicspath{{images/}}

\newfontfamily\bebas{Bebas Neue Regular}
\newfontfamily\alegreya{Alegreya}

\definecolor{town}{HTML}{CF5FCF}
\definecolor{frozenlake}{HTML}{5F9FFF}
\definecolor{hills}{HTML}{7FDF7F}
\definecolor{wasteland}{HTML}{DFDF3F}
\definecolor{forest}{HTML}{9FB76F}
\definecolor{cliffface}{HTML}{FF5F5F}
\definecolor{ropebridge}{HTML}{CFAF7F}
\definecolor{blizzard}{HTML}{5F5FFF}
\definecolor{mountain}{HTML}{9F9F9F}
\definecolor{village}{HTML}{FF8F0F}

\definecolor{energy}{HTML}{003FFF}
\definecolor{health}{HTML}{FF0000}
\definecolor{risk}{HTML}{000000}

\definecolor{utility}{HTML}{FFFFFF}
\definecolor{attachment}{HTML}{5FAFCF}
\definecolor{dog}{HTML}{BF9F7F}
\definecolor{stretch}{HTML}{9F9F9F}
\definecolor{personal}{HTML}{AF5FCF}
\definecolor{movement}{HTML}{7F7FDF}
\definecolor{damage}{HTML}{FF6F6F}
\definecolor{sled}{HTML}{7FDF7F}
\definecolor{food}{HTML}{CFCF4F}

\definecolor{info}{HTML}{FFFFFF}
\definecolor{starting}{HTML}{777777}
\definecolor{common}{HTML}{000000}
\definecolor{rare}{HTML}{000077}
\definecolor{epic}{HTML}{007700}
\definecolor{legendary}{HTML}{770077}

\newcommand{\cardtype}[1]{%
    \newcommand{\backgroundcolor}{#1}
}

\newcommand{\rarity}[1]{%
    \newcommand{\edgecolor}{#1}
}

\newcommand{\deck}[1]{%
    \newcommand{\whichdeck}{#1}
}

\newcommand{\energy}[1]{%
% \fill [black] (50.0/300.0,875.0/300.0) rectangle (150.0/300.0,775.0/300.0);
% \fill [energy] (55.0/300.0,870.0/300.0) rectangle (145.0/300.0,780.0/300.0); % node [text=black,pos=0.5] {\bf\fontsize{25}{30}\bebas #1};
\node [minimum width=0.5in, minimum height=0.5in, anchor=center, inner sep=0mm] at (125.0/300.0,825.0/300.0) {\includegraphics[width=0.5in,height=0.5in]{icons/hand.png}};
\node [text=black, minimum width=0.5in, minimum height=0.5in, text centered, text width=0.5in, anchor=center, inner sep=0mm] at (125.0/300.0,825.0/300.0) {\bf\fontsize{25}{30}\bebas #1};
}

\newcommand{\health}[1]{%
%\fill [black] (50.0/300.0,725.0/300.0) rectangle (150.0/300.0,625.0/300.0);
%\fill [health] (55.0/300.0,720.0/300.0) rectangle (145.0/300.0,630.0/300.0) node [text=black,pos=0.5] {\bf\fontsize{25}{30}\bebas #1};
\node [minimum width=0.5in, minimum height=0.5in, anchor=center, inner sep=0mm] at (125.0/300.0,700.0/300.0) {\includegraphics[width=0.5in, height=0.5in]{icons/deck.png}};
\node [text=black, minimum width=0.5in, minimum height=0.5in, text centered, text width=0.5in, anchor=center, inner sep=0mm] at (125.0/300.0, 700.0/300.0) {\bf\fontsize{25}{30}\bebas #1};
}

\newcommand{\risk}[1]{%
%\fill [white] (50.0/300.0,575.0/300.0) rectangle (150.0/300.0,475.0/300.0);
%\fill [risk] (55.0/300.0,570.0/300.0) rectangle (145.0/300.0,480.0/300.0) node [text=white,pos=0.5] {\bf\fontsize{25}{30}\bebas #1};
\node [minimum width=0.5in, minimum height=0.5in, anchor=center, inner sep=0mm] at (125.0/300.0, 538.0/300.0) {\includegraphics[width=0.5in, height=0.5in]{icons/risk.png}};
\node [text=white, minimum width=0.5in, minimum height=0.5in, text centered, text width=0.5in, anchor=center, inner sep=0mm] at (125.0/300.0, 538.0/300.0) {\bf\fontsize{25}{30}\bebas #1};
}

\newcommand{\@condcost}[2]{\ifnum 0<#1#2\fi}
\newcommand{\costs}[3]{%
\@condcost{#1}{\energy{#1}}%
\@condcost{#2}{\health{#2}}%
\@condcost{#3}{\risk{#3}}%
}

\newcommand{\name}[1]{%
% add draw to the node to see its box
\node [rectangle, anchor=north, minimum width=2.15in, minimum height=2.0/3.0in, text centered, text width=1.833333in, inner sep=0mm] at (375.0/300.0,975.0/300.0) {\bf\fontsize{20}{30}\bebas#1\par};
}

\newcommand{\text}[1]{%
% add draw to the node to see its box
\node [rectangle, minimum width=1.833333in, minimum height=200.0/300.0, text centered, text width=1.833333in, inner sep=0mm, anchor=north] at (375.0/300.0,450.0/300) {\fontsize{16}{16}\bebas#1\par};
}

\newcommand{\helptext}[1]{%
% add draw to the node to see its box
\node [rectangle, minimum width=1.833333in, minimum height=200.0/300.0, text centered, text width=1.833333in, inner sep=0mm, anchor=north] at (375.0/300.0, 800.0/300.0) {\fontsize{16}{16}\bebas#1\par};
}

\newcommand{\flava}[1]{%
% add draw to the node to see its box
\node [rectangle, minimum width=1.833333in, minimum height=100.0/300.0, text centered, text width=1.833333in, inner sep=0mm, anchor=north] at (375.0/300.0,150.0/300.0) {\fontsize{6}{6}\alegreya"#1"\par};
}

\newcommand{\type}[1]{%
\node [rectangle, minimum width=1.833333in, minimum height=100.0/300.0, text centered, text width=1.833333in, inner sep=0mm, anchor=north] at (375.0/300.0,100.0/300.0) {\fontsize{12}{12}\bebas#1\par};
}

% Aspect ratio of about 3:2
\newcommand{\art}[1]{%
\node [rectangle, minimum width=649.8/300.0, minimum height=425.0/300.0, inner sep=0, anchor=north west] at (49.2/300.0, 888.0/300.0) {\noindent\includegraphics*[width=2.1664in, height=1.416667in]{#1}};
}

\newcommand{\utilcount}[1]{%
\node [anchor=center] at (180.0/300.0, 745.0/300.0) {#1}; % Coord is art NW +- offset of image
}

\newcommand{\dogcount}[1]{%
\node [anchor=center] at (310.0/300.0, 745.0/300.0) {#1};
}

\newcommand{\movecount}[1]{%
\node [anchor=center] at (440.0/300.0, 745.0/300.0) {#1};
}

\newcommand{\foodcount}[1]{%
\node [anchor=center] at (570.0/300.0, 745.0/300.0) {#1};
}

\newcommand{\attachcount}[1]{%
\node [anchor=center] at (212.0/300.0, 603.0/300.0) {#1};
}

\newcommand{\personalcount}[1]{%
\node [anchor=center] at (374.0/300.0, 603.0/300.0) {#1};
}

\newcommand{\sledcount}[1]{%
\node [anchor=center] at (536.0/300.0, 603.0/300.0) {#1};
}

\newcommand{\Mm}{myriameter}
\newcommand{\Mms}{myriameters}
\newcommand{\destroy}[2]{Destroy up to #1 of #2.}
\newcommand{\take}[2]{Take #1 of #2.}
\newcommand{\recover}[1]{\ifnum #1=1 Recover a card. \else Recover #1 cards. \fi}
\newcommand{\draw}[1]{\ifnum #1=1 Draw a card. \else Draw #1 cards. \fi}
\newcommand{\personal}{{\color{personal}personal}}
\newcommand{\hypothermia}{{\color{energy}hypothermia}}
\newcommand{\starvation}{{\color{health}starvation}}

\newcommand{\raw}[1]{%
\node [rectangle, minimum width=650.0/300.0, minimum height=950.0/300.0, text justified, text width=53mm, inner sep=1mm, anchor=north west] at (50.0/300.0,1000.0/300.0) {#1};
}

\newcommand{\rawcenter}[1]{%
\node [rectangle, minimum width=650.0/300.0, minimum height=950.0/300.0, text centered, text width=53mm, inner sep=1mm, anchor=north west] at (50.0/300.0,1000.0/300.0) {#1};
}

\newcommand{\rawleft}[1]{%
\node [rectangle, minimum width=650.0/300.0, minimum height=950.0/300.0, text ragged, text width=53mm, inner sep=1mm, anchor=north west] at (50.0/300.0,1000.0/300.0) {#1};
}

\newcommand{\hraw}[1]{%
\node [rectangle, rotate=90, minimum width=950.0/300.0, minimum height=650.0/300.0, text justified, text width=80mm, inner sep=1mm, anchor=north west] at (50.0/300.0,50.0/300.0) {#1};
}

\newcommand{\hrawcenter}[1]{%
\node [rectangle, rotate=90, minimum width=950.0/300.0, minimum height=650.0/300.0, text centered, text width=80mm, inner sep=1mm, anchor=north west] at (50.0/300.0,50.0/300.0) {#1};
}

\newcommand{\hrawleft}[1]{%
\node [rectangle, rotate=90, minimum width=950.0/300.0, minimum height=650.0/300.0, text ragged, text width=80mm, inner sep=1mm, anchor=north west] at (50.0/300.0,50.0/300.0) {#1};
}

\newenvironment{card}
{% Begin
\noindent\begin{tikzpicture}[x=1in,y=1in]
\fill [\edgecolor] (0,0) rectangle (2.5,3.5);
\fill[rounded corners=10pt] [\backgroundcolor] (50.0/300.0,50.0/300.0) rectangle (700.0/300.0,1000.0/300.0);
\node at (645.0/300.0,95.0/300.0) {\includegraphics[width=0.25in, height=0.25in]{deck/\whichdeck.png}};
}
{% End
\end{tikzpicture}}

\newenvironment{playcard}[3][@]
{% Begin
\cardtype{#2}\rarity{#3}
\begin{card}
\type{\if #1@#2\else#1 #2\fi}
}
{% End
\end{card}
}
