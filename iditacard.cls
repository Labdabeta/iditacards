\LoadClass{standalone}

\ProvidesClass{iditacard}[2017/05/12 Class for Iditacard cards]

\RequirePackage{fontspec}
\RequirePackage{xcolor}

\RequirePackage{tikz}
\usetikzlibrary{positioning,shapes,shadows,arrows,backgrounds,fit}
\RequirePackage{shapepar}
\RequirePackage{microtype}

\newfontfamily\bebas{Bebas Neue Regular}
\newfontfamily\alegreya{Alegreya}

\definecolor{town}{HTML}{CF5FCF}
\definecolor{frozenlake}{HTML}{5F9FFF}
\definecolor{hills}{HTML}{7FDF7F}
\definecolor{wasteland}{HTML}{DFDF3F}
\definecolor{forest}{HTML}{9FB76F}
\definecolor{cliffface}{HTML}{FF5F5F}
\definecolor{ropebridge}{HTML}{FF7F7F}
\definecolor{blizzard}{HTML}{5F5FFF}
\definecolor{mountain}{HTML}{9F9F9F}
\definecolor{village}{HTML}{CF5FCF}

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

\definecolor{starting}{HTML}{007777}
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
\fill [energy] (50.0/300.0,950.0/300.0) rectangle (250.0/300.0,850.0/300.0) node [text=black,pos=0.5] {\bf\fontsize{25}{30}\bebas #1};
}

\newcommand{\health}[1]{%
\fill [health] (50.0/300.0,800.0/300.0) rectangle (250.0/300.0,700.0/300.0) node [text=black,pos=0.5] {\bf\fontsize{25}{30}\bebas #1};
}

\newcommand{\risk}[1]{%
\fill [risk] (50.0/300.0,650.0/300.0) rectangle (250.0/300.0,550.0/300.0) node [text=white,pos=0.5] {\bf\fontsize{25}{30}\bebas #1};
}

\newcommand{\name}[1]{%
% add draw to the node to see its box
\node [rectangle, minimum width=1.5in, minimum height=2.0/3.0in, text centered, text width=1.5in, inner sep=0mm] at (475.0/300.0,850.0/300.0) {\bf\fontsize{25}{30}\bebas#1\par};
}

\newcommand{\text}[1]{%
% add draw to the node to see its box
\node [rectangle, minimum width=1.833333in, minimum height=200.0/300.0, text centered, text width=1.833333in, inner sep=1mm, anchor=north west] at (100.0/300.0,550.0/300) {\fontsize{16}{16}\bebas#1\par};
}

\newcommand{\flava}[1]{%
% add draw to the node to see its box
\node [rectangle, minimum width=1.833333in, minimum height=100.0/300.0, text centered, text width=1.833333in, inner sep=0mm, anchor=north west] at (100.0/300.0,250.0/300.0) {\fontsize{6}{6}\alegreya"#1"\par};
}

\newcommand{\type}[1]{%
\node [rectangle, minimum width=1.833333in, minimum height=100.0/300.0, text centered, text width=1.833333in, inner sep=0mm, anchor=north west] at (100.0/300.0,100.0/300.0) {\fontsize{12}{12}\bebas#1\par};
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
\fill [\backgroundcolor] (50.0/300.0,50.0/300.0) rectangle (700.0/300.0,1000.0/300.0);
}
{% End
\end{tikzpicture}}
