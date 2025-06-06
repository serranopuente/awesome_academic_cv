%% Copyright 2016 Christophe Roger
%
% Author: 
% Christophe Roger (Darwiin)
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3c
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is M. C. Roger.
%
% This work consists of the files awesome-source-cv.cls 

\ProvidesClass{awesome-source-cv}[2016/11/05 v1.6.1 Awesome Source CV Class]

\LoadClass[a4paper]{article}

\DeclareOption{green}{
  \def\@green{green}
}

\DeclareOption{red}{
  \def\@red{red}
}

\DeclareOption{indigo}{
  \def\@indigo{indigo}
}
\DeclareOption{orange}{
  \def\@orange{orange}
}

\DeclareOption{localFont}{
  \def\@local{local}
}

\DeclareOption{alternative}{
  \def\@alternative{alternate}
}

\ProcessOptions

% Dependences
%A Few Useful Packages
\RequirePackage[frenchb]{babel}
\RequirePackage[utf8]{luainputenc}
\RequirePackage{fontspec} 					                 % for loading fonts
\RequirePackage{url,parskip} 	    % other packages for formatting
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{fullpage}
\RequirePackage[margin=1.5cm]{geometry}
\RequirePackage{fontawesome}
\RequirePackage{hyperref}\hypersetup{hidelinks}
\RequirePackage{titlesec}
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{longtable} 	
\RequirePackage{etoolbox}
\RequirePackage{tikz}
\RequirePackage[skins]{tcolorbox}


\DeclareUnicodeCharacter{00E9}{\'{e}}
% Define default accent colors
\definecolor{basecolor}{HTML}{000066}       %BLUE

\ifundef{\@green} {
  \ifundef{\@red} {
    \ifundef{\@indigo}{
      \ifundef{\@orange} {}
      { \definecolor{basecolor}{HTML}{e68a00} }
    }
    { \definecolor{basecolor}{rgb}{0.2, 0.07, 0.48} }
  }
  { \definecolor{basecolor}{HTML}{b30000} }     %RED
}
{ \definecolor{basecolor}{rgb}{0.0, 0.62, 0.38} }

\definecolor{darkGrey}{HTML}{989898}

\colorlet{linkcolor}{basecolor}
\colorlet{accentcolor}{linkcolor!90}
\colorlet{symbolcolor}{linkcolor!85}

% Setup hyperref package, and colours for links
%\definecolor{linkcolour}{rgb}{0,0.2,0.6}
\hypersetup{breaklinks}

\pagestyle{empty}                         % non-numbered pages
%\font\fb=''[cmr10]''                      % for use with \LaTeX command

% Setup CV sections
\titleformat{\section}{\Large\raggedright}{}{0em}{}[\titlerule]
\titlespacing{\section}{0pt}{2pt}{2pt}

% Configure list
\setlist[itemize,1]{label=\faAngleRight, nosep, leftmargin=2em} 

% Setup Array : new column type
\newcolumntype{R}[1]{>{\hfill}m{#1}}

%Italian hyphenation for the word: ''corporations''
\hyphenation{im-pre-se}

% Setup fonts
\defaultfontfeatures{Mapping=tex-text}
%

%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
% Set the FontAwesome font to be up-to-date.
\newfontfamily\FA[Path=fonts/]{FontAwesome}

% Define font to use according to localFont option
\ifundef{\@local}
{
  %\setmainfont[BoldFont = Helvetica Neue, ItalicFont=Helvetica Neue Thin Italic ,SmallCapsFont = Helvetica Neue Light]{Helvetica Neue Thin}
  \setmainfont[
    BoldFont = Source Sans Pro Semibold, 
    ItalicFont= Source Sans Pro Light Italic,
    SmallCapsFont = Source Sans Pro]{Source Sans Pro Light}
}
{
  \setmainfont[
    Path = fonts/, 
    BoldFont = SourceSansPro-Semibold, 
    ItalicFont = SourceSansPro-LightIt, 
    SmallCapsFont = SourceSansPro-Regular]{SourceSansPro-Light}
}

%New length definition
\newlength{\rightcolumnlength}
\setlength{\rightcolumnlength}{14.8cm}

\newlength{\leftcolumn}
\setlength{\leftcolumn}{2.5cm}

% Font Awesome icons aliases
\newcommand{\mailSymbol}{\faEnvelope}
\newcommand{\mailSymbolO}{\faEnvelopeO} 
\newcommand{\locationSymbol}{\faMapMarker}
\newcommand{\infoSymbol}{\faInfo}
\newcommand{\homeSymbol}{\faLink}
\newcommand{\weiboSymbol}{\faWeibo}
\newcommand{\linkedinSymbol}{\faLinkedin}
\newcommand{\twitterSymbol}{\faTwitter}
\newcommand{\blueskySymbol}{\includegraphics[width=0.07in,height=0.07in]{icon/bluesky-seeklogo.png}}
\newcommand{\mobileSymbol}{\faMobilePhone}
\newcommand{\githubSymbol}{\faGithub}

\newcommand\link[2]{\color{linkcolor}\href{#1}{#2}\color{Black} }
\newcommand\important[1]{\textbf #1}

% Create a tag
% Usage: \cvtag{<tag label>}
\newcommand{\cvtag}[1]{%
  %\tikz[baseline]\node[anchor=base,draw=darkGrey!70,rounded corners=0.5ex,inner xsep=1ex,inner ysep =0.55ex,text height=1.3ex,text depth=.25ex]{#1};
\begin{tikzpicture}
	\node[anchor=base,draw=darkGrey!70,rounded corners=0.5ex,inner xsep=1ex,inner ysep =0.55ex,text height=1.3ex,text depth=.25ex]{#1};
\end{tikzpicture}	  
}

% Render author's name
% Usage: \user{<firstanme>}{<lastname>}
\newcommand\user[2]{\color{accentcolor}{\LARGE #1 \textbf{#2}}\color{Black}}

% Render a text with its symbol
% Usage; \socialtext{<icon>}{<label>}
\newcommand{\socialtext}[2]{\mbox{\textcolor{symbolcolor}{#1}\hspace{0.5em}#2\hspace{1em}}}

% Render a link with its symbol
% Usage; \sociallink{<icon>}{<label>}
%\newcommand{\sociallink}[3]{\mbox{\textcolor{symbolcolor}{#1}\hspace{0.5em}#2\hspace{1em}}}
\newcommand{\sociallink}[3]{\mbox{\textcolor{symbolcolor}{#1}\hspace{0.5em}\link{#2}{#3}\hspace{1em}}}

% Define author's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define author's tagline
% Usage: \tagline{<tag line>}
\newcommand*{\tagline}[1]{\def\@tagline{#1}}

% Define author's photo
% Usage \photo{<diameter>}{<photo>}
\newcommand{\photo}[2]{\def\@photo{#2}\def\@photodiameter{#1}}

% Render author's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\socialtext{\locationSymbol}{#1}}

% Render author's infos
% Usage: \infos{<infos>}
\newcommand*{\infos}[1]{\socialtext{\infoSymbol}{#1}}

% Render author's homepage
% Usage: \homepage{<homepage>}
\newcommand*{\homepage}[1]{\sociallink{\homeSymbol}{http://#1}{#1}}

% Render author's homepage
% Usage: \weibo{<weibo>}
\newcommand*{\weibo}[1]{\sociallink{\weiboSymbol}{http://www.weibo.com/#1}{weibo.com/#1}}


% Render author's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\sociallink{\linkedinSymbol}{http://www.linkedin.com/in/#1}{#1}}


% Render author's twitter (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\twitter}[1]{\sociallink{\twitterSymbol}{https://twitter.com/#1}{#1}}

% Render author's bluesky (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\bluesky}[1]{\sociallink{\blueskySymbol}{https://bsky.app/profile/#1}{#1}}


% Render author's viadeo(optional)
% Usage: \viadeo{<viadeo-nick>}
\newcommand*{\viadeo}[1]{\sociallink{\viadeoSymbol}{http://www.viadeo.com/fr/profile/#1}{viadeo.com/fr/profile/#1}} 

% Render author's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\sociallink{\githubSymbol}{https://www.github.com/#1}{#1}}           % Github icon + URL

% Render author's email (optional)
% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\sociallink{\mailSymbol}{mailto:#1}{#1}}
\newcommand*{\emailO}[1]{\sociallink{\mailSymbolO}{mailto:#1}{#1}}

% Render author's mobile phone (optional)
% Usage: \smartphone{<mobile phone number>}
\newcommand*\smartphone[1]{\socialtext{\mobileSymbol}{#1}}    

% Render author's tagline
\newcommand\resumetitle[1]{
  \ifundef{\@
  	}{
	 \par{
	 	 \bigskip\center{\Large \color{Black}\textsc{#1}\color{Black}}\par
	 }
	 \bigskip
  }{
   % \color{accentcolor}\textsc{\large{#1}}\color{black}
	 \par{
	 	\bigskip\center{\Large \color{Black}\textsc{#1}\color{Black}}\par
	 }
	 \bigskip    
  }
}

% Define social entries to print in header
\newcommand{\socialinfo}[1]{\def\@socialinfo{#1}}


% Render CV header
% Needs \@firstname, \@lastname and \@tagline to be defined
\newcommand*{\makecvheader}{
	\ifundef{\@alternative}{
		 
		\ifundef{\@photodiameter}{
			\begin{minipage}{\linewidth}    	      	
		}{
			\begin{minipage}{\dimexpr\linewidth-\@photodiameter-2em}        	
		}
				\color{accentcolor}\user{\@firstname}{\@lastname}\color{black} \vspace*{0.3cm}\\				 	
				\footnotesize{\@socialinfo}
			\end{minipage}  
		\ifdef{\@photodiameter}{
			\begin{minipage}{\@photodiameter}
				\begin{tikzpicture}%
				\node[circle, text=white, minimum size=2.5cm,
				path picture={\node at (path picture bounding box.center){
						\includegraphics[width=2.5cm]{\@photo}
					};
				}]{ };
				\end{tikzpicture}				
			\end{minipage}
		}{}
	    \resumetitle{\@tagline}
	}{
	    \ifundef{\@photodiameter}{
			\begin{minipage}{\linewidth}     	
	    }{
			\begin{minipage} {\dimexpr\linewidth-\@photodiameter-2em}    	
	    }
				\user{\@firstname}{\@lastname} \vspace*{0.3cm}\\
				\resumetitle{\@tagline}
				\smallskip\\
				\footnotesize{\@socialinfo}
			\end{minipage}  	    
		\ifdef{\@photodiameter}{
			\begin{minipage}{\@photodiameter}
%				\begin{tikzpicture}%
%				\node[circle, text=white, minimum size=2.5cm,
%				path picture={\node at (path picture bounding box.center){
%						\includegraphics[width=2.5cm]{\@photo}
%					};
%				}]{ };
%				\end{tikzpicture}		
				\begin{tikzpicture}%
				\node[text=white, minimum width=2.8cm, minimum height=2.8cm, %minimum size=2.8cm,
				path picture={\node at (path picture bounding box.center){
						\includegraphics[width=2.5cm]{\@photo}
					};
				}]{ };
				\end{tikzpicture}			
			\end{minipage} 			
%      \begin{minipage}{\@photodiameter}
%      	\tikz\path[fill overzoom image={\@photo}]circle[radius=0.5\linewidth];
%      \end{minipage}
      			     	
		}{}
		\bigskip
	}
}

% Resume part title definition
\newcommand\sectionTitle[2]{\section{\texorpdfstring{\color{accentcolor}#2\enspace #1}{#1}}}

% Define a new column type for the scholarship environment
\newcolumntype{Y}{>{\raggedleft}p{\leftcolumn}}

% Define the 'scholarship' environment
\newenvironment{scholarship}{%
  \begin{tabular}{Y p{\rightcolumnlength}}
}{%
  \end{tabular}
}

% Render a scholarshipentry in the scolarship environment
% Usage: \scholarshipentry{<date>}{<description>}
\newcommand\scholarshipentry[2]{
  #1    &  #2 \\
}

% Define the 'skills' environment
\newenvironment{skills}{%
  \begin{longtable}{R{\leftcolumn}p{\rightcolumnlength}}
}{%
  \end{longtable}
}

% Render a skill in the skills environment
% Usage: \skill{<skill>}{<level>}
\newcommand\skill[2]{
  \textsc{#1}    & \foreach \x in {1,...,6}{{\color{accentcolor!80} \ifnumgreater{\x}{#2}{\faCircleO}{\faCircle}}\enspace } 
}

\newcolumntype{E}{>{\raggedright\arraybackslash}p{\rightcolumnlength}}

% Define the 'experiences' environment
\newenvironment{experiences}{%
  \begin{longtable}{R{\leftcolumn}|E}
}{%
  \end{longtable}
}

% Render an experience in the experiences environment
% Usage: 
% \experience
%  {<End date>}      {<Title>}{<Enterprise>}{<Country>}
%  {<Start date}     {
%                      <Experience description (Could be a list)>
%                    }
%                    {<Technology list>}
\newcommand\experience[7]{
  \textsc{#1}    & \textsc{#2, #3, #4}   								\\*
  \textsc{#5}    & \begin{minipage}[t]{\rightcolumnlength}
  					         #6
                   \end{minipage}										\\*
                 & \footnotesize{\foreach \n in {#7}{\cvtag{\n}}} 	\\
  }

% Render a consultant experience in the experiences environment
% Usage: 
% \consultantexperience
%  {<End date>}      {<Consultant title>}{<Consulting Enterprise>}{<Country>}
%  {<Start date}     {<Client title>}{<Client business unit>}
%                    {
%                      <Experience description (Could be a list)>
%                    }
%                    {<Technology list>}
\newcommand\consultantexperience[9]{
  \textsc{#1}    & \textsc{#2, #3, #4}   								\\*
  \textsc{#5}    & \emph{#6} pour #7                       				\\*
  				       & 	\begin{minipage}[t]{\rightcolumnlength}
  						        #8
                   	\end{minipage}										\\*
                 & \footnotesize{\foreach \n in {#9}{\cvtag{\n}}} 	\\
  }

\newcommand\emptySeparator{\multicolumn{2}{c}{}\\}
