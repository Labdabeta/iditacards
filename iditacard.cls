\LoadClass{standalone}

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

\newcommand{\energy}[1]{%
\fill [energy] (50.0/300.0,875.0/300.0) rectangle (150.0/300.0,775.0/300.0) node [text=black,pos=0.5] {\bf\fontsize{25}{30}\bebas #1};
}

\newcommand{\health}[1]{%
\fill [health] (50.0/300.0,725.0/300.0) rectangle (150.0/300.0,625.0/300.0) node [text=black,pos=0.5] {\bf\fontsize{25}{30}\bebas #1};
}

\newcommand{\risk}[1]{%
\fill [risk] (50.0/300.0,575.0/300.0) rectangle (150.0/300.0,475.0/300.0) node [text=white,pos=0.5] {\bf\fontsize{25}{30}\bebas #1};
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

\newcommand{\Mm}{myriameter}
\newcommand{\Mms}{myriameters}
\newcommand{\destroy}[2]{Destroy up to #1 of #2.}
\newcommand{\take}[2]{Take #1 of #2.}
\newcommand{\recover}[1]{Recover #1.}
\newcommand{\draw}[1]{Draw #1.}

\newcommand{\raw}[1]{%
\node [rectangle, minimum width=650.0/300.0, minimum height=950.0/300.0, text justified, text width=53mm, inner sep=1mm, anchor=north west] at (50.0/300.0,1000.0/300.0) {#1};
}

\newcommand{\rawcenter}[1]{%
\node [rectangle, minimum width=650.0/300.0, minimum height=950.0/300.0, text centered, text width=53mm, inner sep=1mm, anchor=north west] at (50.0/300.0,1000.0/300.0) {#1};
}

\newcommand{\rawleft}[1]{%
\node [rectangle, minimum width=650.0/300.0, minimum height=950.0/300.0, text ragged, text width=53mm, inner sep=1mm, anchor=north west] at (50.0/300.0,1000.0/300.0) {#1};
}


\newenvironment{card}
{% Begin
\noindent\begin{tikzpicture}[x=1in,y=1in]
\fill [\edgecolor] (0,0) rectangle (2.5,3.5);
\fill[rounded corners=10pt] [\backgroundcolor] (50.0/300.0,50.0/300.0) rectangle (700.0/300.0,1000.0/300.0);
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
