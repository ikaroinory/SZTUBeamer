%----------------------------------------------------------------------------------------------------%
%
% SZTUBeamer
%     -- A beamer class for SZTU
%
%----------------------------------------------------------------------------------------------------%

%----------------------------------------------------------------------------------------------------%
%
% -> Class Clarification
%
%----------------------------------------------------------------------------------------------------%
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{SZTUBeamer}[2024/04/25 v1.0 A beamer class for SZTU]

%----------------------------------------------------------------------------------------------------%
%
% -> Options
%
%----------------------------------------------------------------------------------------------------%
\RequirePackage{ifthen}

\def\bool@hideNav{false}
\DeclareOption{hideNav}{\def\bool@hideNav{true}}
\def\bool@bdi{false}
\DeclareOption{bdi}{\def\bool@bdi{true}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbeamer}}
\ProcessOptions\relax

\LoadClass{ctexbeamer}

\ifthenelse{\equal{\bool@hideNav}{true}}{\setbeamertemplate{navigation symbols}{}}{}

%----------------------------------------------------------------------------------------------------%
%
% -> Require Packages
%
%----------------------------------------------------------------------------------------------------%
\RequirePackage{tikz}
\RequirePackage{float}
\RequirePackage{graphicx}

% Table
\RequirePackage{booktabs}
\RequirePackage{makecell}
\RequirePackage{multirow}

% Figure
\RequirePackage{subcaption}

% Algorithm
\RequirePackage{algorithm}
\RequirePackage{algorithmicx}
\RequirePackage{algpseudocode}

% Math
\RequirePackage{bm}

%----------------------------------------------------------------------------------------------------%
%
% -> global Variables
%
%----------------------------------------------------------------------------------------------------%
\gdef\global@title{Unknown}
\gdef\global@author{Unknown}
\gdef\global@institute{Unknown}
\gdef\global@supervisor{Unknown}
\gdef\global@reportYear{Unknown}
\gdef\global@reportMonth{Unknown}
\gdef\global@reportDay{Unknown}
\gdef\global@authorPrefix{}
\NewDocumentCommand{\authorPrefix}{m}{\gdef\global@authorPrefix{#1}}
\gdef\global@supervisorPrefix{}
\NewDocumentCommand{\supervisorPrefix}{m}{\gdef\global@supervisorPrefix{#1}}

\gdef\global@reportDate{\global@reportYear 年\global@reportMonth 月\global@reportDay 日}

%----------------------------------------------------------------------------------------------------%
%
% -> Colors
%
%----------------------------------------------------------------------------------------------------%
\definecolor{sztu}{RGB}{2,53,146}

\setbeamercolor{structure}{fg=sztu}
\setbeamercolor{palette primary}{use=structure,fg=white,bg=structure.fg}
\setbeamercolor{palette secondary}{use=structure,fg=white,bg=structure.fg!75!black}
\setbeamercolor{palette tertiary}{use=structure,fg=white,bg=structure.fg!50!black}
\setbeamercolor{palette quaternary}{fg=white,bg=structure.fg!50!black}

\setbeamercolor{title}{bg=sztu}
\setbeamercolor{frametitle}{bg=sztu,fg=white}
\setbeamercolor{titlelike}{parent=palette primary}

\setbeamercolor{footline}{bg=sztu}

\setbeamercolor{block title}{bg=sztu,fg=white}
\setbeamercolor*{block title example}{use={normal text,example text},bg=white,fg=sztu}
\setbeamercolor{fine separation line}{}
\setbeamercolor{item projected}{fg=white}
\setbeamercolor{palette sidebar primary}{use=normal text,fg=normal text.fg}
\setbeamercolor{palette sidebar quaternary}{use=structure,fg=structure.fg}
\setbeamercolor{palette sidebar secondary}{use=structure,fg=structure.fg}
\setbeamercolor{palette sidebar tertiary}{use=normal text,fg=normal text.fg}
\setbeamercolor{section in sidebar}{fg=brown}
\setbeamercolor{section in sidebar shaded}{fg=grey}

\setbeamercolor{separation line}{}
\setbeamercolor{sidebar}{bg=sztu}
\setbeamercolor{sidebar}{parent=palette primary}
\setbeamercolor{subsection in sidebar}{fg=brown}
\setbeamercolor{subsection in sidebar shaded}{fg=grey}

%----------------------------------------------------------------------------------------------------%
%
% -> Fonts
%
%----------------------------------------------------------------------------------------------------%
% \usefonttheme{serif}
\setCJKmainfont{STKaiti}
\setCJKsansfont{STKaiti}
\setsansfont{Times New Roman}

\setbeamerfont{title}{family=\kaishu}
\setbeamerfont{author}{family=\kaishu}
\setbeamerfont{institute}{family=\kaishu}
\setbeamerfont{date}{parent=institute}

\setbeamerfont{frametitle}{family=\kaishu, size=\large}

\setbeamerfont{block title}{family=\kaishu}

\setbeamerfont{headline}{family=\kaishu}

\setbeamerfont{caption}{size=\tiny}

\usefonttheme[onlymath]{serif}

%----------------------------------------------------------------------------------------------------%
%
% -> Commands
%
%----------------------------------------------------------------------------------------------------%
\let\old@title\title
\RenewDocumentCommand{\title}{m}{
    \gdef\global@title{#1}
    \old@title{\global@title}
}

\let\old@author\author
\RenewDocumentCommand{\author}{m}{
    \gdef\global@author{#1}
    \old@author{\global@author}
}

\let\old@institute\institute
\RenewDocumentCommand{\institute}{m}{
    \gdef\global@institute{#1}
    \old@institute{\global@institute}
}

\NewDocumentCommand{\supervisor}{m}{
    \gdef\global@supervisor{#1}
}

\NewDocumentCommand{\reportDate}{mmm}{
    \gdef\global@reportYear{#1}
    \gdef\global@reportMonth{#2}
    \gdef\global@reportDay{#3}
}

\NewDocumentCommand{\cover}{}{
    \begin{frame}
        \titlepage
    \end{frame}
}

\NewDocumentCommand{\toc}{}{
    \begin{frame}
        \tableofcontents[
            sectionstyle       = show,
            subsectionstyle    = show/shaded/hide,
            subsubsectionstyle = show/shaded/hide
        ]
    \end{frame}
}

\NewDocumentCommand{\endpage}{O{hide}m}{
    \begin{frame}
        \centering\huge
        #2%

        \ifthenelse{\equal{#1}{show}}{
            \par\large
            \vspace*{2em}
            \global@authorPrefix\ifthenelse{\equal{\global@authorPrefix}{}}{}{：}\global@author
            \ifthenelse{\equal{\global@supervisor}{Unknown}}
            {}{%
                \quad\global@supervisorPrefix\ifthenelse{\equal{\global@supervisorPrefix}{}}{}{：}\global@supervisor%
            }
        }{}
        \vskip2em
        {\usebeamercolor[fg]{titlegraphic}\inserttitlegraphic\par}
    \end{frame}
}

%----------------------------------------------------------------------------------------------------%
%
% -> Algorithms
%
%----------------------------------------------------------------------------------------------------%
% \floatname{algorithm}{算法}
\captionsetup[algorithm]{
	format   = plain,
	labelsep = quad,
	% font={song,sfive},   % 图的字体, 宋体小五
	position = top
}
\RenewDocumentCommand{\algorithmicrequire}{}{\bfseries 输入：}
\RenewDocumentCommand{\algorithmicensure}{}{\bfseries 输出：}

%----------------------------------------------------------------------------------------------------%
%
% -> Template Settings
%
%----------------------------------------------------------------------------------------------------%
\titlegraphic{
    \includegraphics[height = 0.5cm]{asserts/SZTU.png}
    \ifthenelse{\equal{\bool@bdi}{true}}{\includegraphics[height = 0.5cm]{asserts/BDI.png}}{}
}
% \logo{
%     \includegraphics[height = 0.5cm]{asserts/sztu_logo.png}
%     \includegraphics[height = 0.5cm]{asserts/bdi_logo.png}
% }
% \logo{
%     \begin{tikzpicture}[overlay, remember picture]
%         \node[left = 0cm] at (current page.20){
%             \includegraphics[height = 0.5cm]{asserts/sztu_logo.png}
%             \includegraphics[height = 0.5cm]{asserts/bdi_logo.png}
%         };
%     \end{tikzpicture}
% }

\useoutertheme[footline=authorinstitutetitle,subsection=false]{smoothbars}
\useinnertheme{circles}

\setbeamertemplate{title page}{\ignorespaces
    \vbox{}
    \begingroup{
        \centering
        % {\usebeamercolor[fg]{titlegraphic}\inserttitlegraphic\par}\vskip1em
        \begin{beamercolorbox}[sep=8pt, center]{title}\ignorespaces
            \usebeamerfont{title}\inserttitle\par
            \ifx\insertsubtitle\@empty
            \else
                \vskip0.25em
                {\usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}\insertsubtitle\par}
            \fi
        \end{beamercolorbox}
        \vskip1em\par
        \begin{beamercolorbox}[sep=8pt, center]{author}
            \usebeamerfont{author}%
            \global@authorPrefix\ifthenelse{\equal{\global@authorPrefix}{}}{}{：}\global@author
            \ifthenelse{\equal{\global@supervisor}{Unknown}}
            {}{%
                \quad\global@supervisorPrefix\ifthenelse{\equal{\global@supervisorPrefix}{}}{}{：}\global@supervisor%
            }
        \end{beamercolorbox}
        \begin{beamercolorbox}[sep=8pt, center]{institute}
            \usebeamerfont{institute}\global@institute
        \end{beamercolorbox}
        \begin{beamercolorbox}[sep=8pt, center]{date}
            \usebeamerfont{date}\global@reportDate
        \end{beamercolorbox}
        \vskip1em
        {\usebeamercolor[fg]{titlegraphic}\inserttitlegraphic\par}
    }\endgroup
    \vfill
}

\setbeamertemplate{footline}{\ignorespaces
    \begin{beamercolorbox}[colsep=1.5pt]{upper separation line foot}\kaishu
    \end{beamercolorbox}

    \begin{beamercolorbox}[ht=2.5ex,dp=1.125ex,
      leftskip=.3cm,rightskip=.3cm plus1fil]{author in head/foot}
      \leavevmode{\usebeamerfont{author in head/foot}\kaishu\insertshortauthor}
      \hfill
      {\usebeamerfont{institute in head/foot}\usebeamercolor[fg]{institute in head/foot}\kaishu\insertshortinstitute}
    \end{beamercolorbox}

    \begin{beamercolorbox}[ht=2.5ex,dp=1.125ex,
      leftskip=.3cm,rightskip=.3cm plus1fil]{title in head/foot}
      {\usebeamerfont{title in head/foot}\kaishu\insertshorttitle}
      \hfill
      {\usebeamerfont{frame number}\usebeamercolor[fg]{frame number}\insertframenumber~/~\inserttotalframenumber}
    \end{beamercolorbox}
    
    \begin{beamercolorbox}[colsep=1.5pt]{lower separation line foot}
    \end{beamercolorbox}
}

\setbeamertemplate{bibliography item}[text]
\setbeamertemplate{caption}[numbered]

%----------------------------------------------------------------------------------------------------%
%
% -> Others
%
%----------------------------------------------------------------------------------------------------%
\AtBeginSection[]{
	\begin{frame}
		\tableofcontents[sectionstyle=show/shaded,subsectionstyle=show/shaded/hide,subsubsectionstyle=show/shaded/hide]
	\end{frame}
}
\AtBeginSubsection[]{
	\begin{frame}
		\tableofcontents[sectionstyle=show/shaded,subsectionstyle=show/shaded/hide,subsubsectionstyle=show/shaded/hide]
	\end{frame}
}
