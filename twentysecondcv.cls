\ProvidesClass{twentysecondcv}[2017/01/08 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
\RequirePackage{fontawesome}
\RequirePackage{forloop}
\RequirePackage{enumitem}
\usepackage{amsfonts}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}
\definecolor{backg}{RGB}{225,236,244}
\definecolor{tagtxt}{RGB}{88,115,159}

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\renewcommand{\bfseries}{\color{gray}} % Make \textbf produce coloured text instead
\pagestyle{empty} % Disable headers and footers
\setlength{\parindent}{0pt} % Disable paragraph indentation

%----------------------------------------------------------------------------------------
%	 COMMAND TO CREATE A SO STYLE TAG. Credit : https://tex.stackexchange.com/a/311949
%----------------------------------------------------------------------------------------
\newcommand\maketag[1]{%
    \tikz[baseline]{%
        \node[anchor=base, text=tagtxt, fill=backg, font=\sffamily, text depth=.5mm] {#1};
    }%
}

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

% \newlength\imagewidth
% \newlength\imagescale
% \pgfmathsetlength{\imagewidth}{5cm}
% \pgfmathsetlength{\imagescale}{\imagewidth/600}

\newlength{\TotalSectionLength} % Define a new length to hold the remaining line width after the section title is printed
\newlength{\SectionTitleLength} % Define a new length to hold the width of the section title
\newcommand{\profilesection}[1]{%
	\setlength\TotalSectionLength{\linewidth}% Set the total line width
	\settowidth{\SectionTitleLength}{\huge #1 }% Calculate the width of the section title
	\addtolength\TotalSectionLength{-\SectionTitleLength}% Subtract the section title width from the total width
	\addtolength\TotalSectionLength{-2.22221pt}% Modifier to remove overfull box warning
	{\color{black!80} \huge #1 \rule[0.15\baselineskip]{\TotalSectionLength}{1pt}}% Print the title and auto-width rule
	\vspace{8pt}
}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}}
\newcommand{\cvbitbucket}[1]{\renewcommand{\cvbitbucket}{#1}}
\newcommand{\cvstackoverflow}[1]{\renewcommand{\cvstackoverflow}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}



% Skill Content
\newcommand{\sklanguages}[1]{\renewcommand{\sklanguages}{#1}}
\newcommand{\skplatformsntools}[1]{\renewcommand{\skplatformsntools}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}
\newcommand*\fontawesome[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}
\newcounter{loop}

% Command for printing skill progress circles
\newcommand\skills[1]{ 
	\begin{tikzpicture}
			
			\foreach [count=\i] \x/\y in #1{

				\begingroup
	
				\forloop{loop}{0}{\value{loop} < \y }{
					\filldraw[fill=mainblue,mainblue] (3 + \value{loop} * 0.7,\i*0.6) circle (5pt);
				}
				\forloop{loop}{\y}{\value{loop} < 5 }{
					\filldraw[fill=maingray,maingray] (3 + \value{loop} * 0.7,\i*0.6) circle (5pt);
				}
				\node [right] at (0,\i*0.6) {\footnotesize\x};

				\endgroup
				% \filldraw[fill=maingray,maingray] (0,\i+0.4) circle (6pt);
				% \node [left] at (0,\i+0.4) {text};
				% \draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
				% \draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.4);
				% \node [above right] at (0,\i+0.4) {\x};
			}
	\end{tikzpicture}
	
}

% Command for education table
\newcommand\education[1]{
	\renewcommand{\education}{
		\begin{flushleft}
		\foreach [count=\i] \x/\y/\z in {#1}{
			{\normalsize\color{mainblue}\x}~\\
			{\footnotesize\color{black}\y}~\\
			{\footnotesize\color{black}\z}~\\
			{\vspace{8pt}}
		}	
		\end{flushleft}
	}
}

%----------------------------------------------------------------------------------------
%	 SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
	\begin{tikzpicture}[remember picture,overlay]
   		\node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
	\end{tikzpicture}

	%------------------------------------------------

	\begin{textblock}{6}(0.5, 1.0)

		%------------------------------------------------
		{\Huge\color{black}\cvname}

		{\hspace{4 pt}\large\color{gray}\cvjobtitle}

		%------------------------------------------------
		\vspace{12 pt}
		%------------------------------------------------

		\renewcommand{\arraystretch}{1.6}
		\begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
			\ifthenelse{\equal{\cvnumberphone}{}}{}{\textsc{\large\icon{\Telefon}} & \cvnumberphone\\}
			\ifthenelse{\equal{\cvsite}{}}{}{\textsc{\large\icon{\Mundus}} & \cvsite\\}
			\ifthenelse{\equal{\cvmail}{}}{}{\textsc{\vspace{1mm}\large\icon{@}} & \href{mailto:\cvmail}{\cvmail}\\}
			\ifthenelse{\equal{\cvgithub}{}}{}{\textsc{\large\icon{\faGithub}} & \href{\cvgithub}{\cvgithub}\\}
			\ifthenelse{\equal{\cvbitbucket}{}}{}{\textsc{\large\icon{\faBitbucket}} & \href{\cvbitbucket}{\cvbitbucket}\\}
			\ifthenelse{\equal{\cvstackoverflow}{}}{}{\textsc{\large\icon{\faStackOverflow}} & \href{\cvstackoverflow}{\cvstackoverflow}\\}
			\ifthenelse{\equal{\cvlinkedin}{}}{}{\textsc{\large\icon{\faLinkedin}} & \href{\cvlinkedin}{\cvlinkedin}}
		\end{tabular}

		%------------------------------------------------
		\vspace{15pt}
		\profilesection{Education}
		\education
		\vspace{-25pt}
		%------------------------------------------------

		%------------------------------------------------
		\profilesection{Skills}
		\subsection{Languages}
		\skills{\sklanguages}
		\vspace{10pt}
		\subsection{Platforms and Tools}
		\skills{\skplatformsntools}
		%------------------------------------------------
			
	\end{textblock}
}


%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

% Command to create the rounded boxes around the first three letters of section titles
\newcommand*\round[2]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=6pt, minimum size=8mm, text height=3.6mm, fill=mainblue,mainblue,text=white](char){#1};%
	\vspace{8 pt}
}

% \newcounter{colorCounter}
% \newcommand{\sectioncolor}[1]{%
% 	{%
% 		\round{#1}{
% 			\ifcase\value{colorCounter}%
% 			maingray\or%
% 			mainblue\or%
% 			maingray\or%
% 			mainblue\or%
% 			maingray\or%
% 			mainblue\or%
% 			maingray\or%
% 			mainblue\or%
%  			maingray\or%
% 			mainblue\else%
% 			maingray\fi%
% 		}%
% 	}%
% 	\stepcounter{colorCounter}%
% }

\renewcommand{\section}[1]{
	{%
		\color{gray}%
		\large\round{#1}{mainblue}%
	}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\large\color{gray} #1%
	}
	\par\vspace{.25\parskip}%
}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

% \newcommand{\twentyitem}[4]{%
% 	\parbox[t]{0.20\textwidth}{%
% 		\normalsize\color{mainblue}#1\\
% 		\footnotesize\color{maingray}#2\\
% 		\tiny\color{black}#3\\
% 	}&\parbox[t]{0.78\textwidth}{%
% 		\footnotesize#4\vspace{\parsep}%
% 	}\\
% }

\newcommand{\twentyitem}[5]{%
	\parbox[t]{0.25\textwidth}{%
		\normalsize\color{mainblue}#1\\
		\footnotesize\color{maingray}#2\\
		\tiny\color{black}#3\\
		\tiny\color{black}#4\\
	}&\parbox[t]{0.75\textwidth}{%
		\footnotesize#5\vspace{\parsep}%
	}\\
}

%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{#2}%
	}\\
}

\newcommand{\twentyitemssinglecol}[1]{%
	\parbox[t]{0.83\textwidth}{%
		\textbf{#1}%
	}\\
	\vspace{8pt}
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=7.6cm,top=0.1cm,right=1cm,bottom=0.2cm,nohead,nofoot]{geometry}

\RequirePackage{hyperref}
