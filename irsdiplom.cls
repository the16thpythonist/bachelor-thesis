% -*- TeX -*- -*- DE -*-
% Obige 1. Zeile ist zur Bestimmung eines korrekten Document-Modes in WinEdt
%%
%%                             %%%%%%%%%%%%%%%%%%%%%%%%
%%                             %%                    %%
%%                             %%  KLASSE IRSDIPLOM  %%
%%                             %%                    %%
%%                             %%%%%%%%%%%%%%%%%%%%%%%%
%%
%%
%% $Date: 2008-08-16 20:38:28 +0200 (Sa, 16. Aug 2008) $
%% $Revision: 13 $
%% $Autor: Matthias $
%% $URL: https://irs-apache.irs.uni-karlsruhe.de/svnd/LaTeX-irsdiplom/irsdiplom.cls $
%%
%%

\def\IRS@version{2}
\def\IRS@SVN $#1: #2-#3-#4 #5 #6 $ $#7: #8 $ \endIRS@SVN{\def\IRS@filedate{#2/#3/#4}\def\IRS@filetime{#5}\def\IRS@revision{#8}}
\IRS@SVN $Date: 2008-08-16 20:38:28 +0200 (Sa, 16. Aug 2008) $ $Revision: 13 $ \endIRS@SVN

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\message{v\IRS@version.\IRS@revision\space\IRS@filedate}
\ProvidesClass{irsdiplom}%
   [\IRS@filedate\space v\IRS@version.\IRS@revision\space LaTeX2e document class (MS)]

\typeout{^^J%
         *************************************************^^J%
         * document class \space IRSDIPLOM v\IRS@version.\IRS@revision\space\space (\IRS@filedate)^^J%
         * class for writing theses at the^^J%
         * Institute for Control Systems (IRS),^^J%
         * Universitaet Karlsruhe (TH)^^J%
         * http://www.irs.kit.edu^^J%
         *************************************************^^J%
         }

% In der Klasse report ist die Variable \@mainmatter nicht bekannt, bei book wird
% sie vordefiniert und auf true gesetzt. Sie wird sp"ater abgefragt und muss daher
% auf alle F"alle vordefiniert worden sein!
\newif\if@mainmatter
\@mainmattertrue

\RequirePackage{ifpdf}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Verarbeiten der Optionen
%% Laden der entspr. Klasse
%% Laden von Standard-Packages

\newif\ifIRS@report
\IRS@reportfalse
\newif\ifIRS@book
\IRS@booktrue
\newcommand{\CurrentClass}{book}

\newif\ifIRS@afuenf
\IRS@afuenffalse
\newif\ifIRS@avier
\IRS@avierfalse
\newif\ifIRS@booksize
\IRS@booksizetrue % Standard: Buchgroesse

\newif\ifIRS@chapter
\IRS@chapterfalse
\newif\ifIRS@chapterplain
\IRS@chapterplainfalse
\newif\ifIRS@emptyeoc
\IRS@emptyeoctrue
\newif\ifIRS@indexchapter
\IRS@indexchapterfalse
\newif\ifIRS@indexplain
\IRS@indexplainfalse
\newif\ifIRS@idxtotoc
\IRS@idxtotocfalse

\newcommand{\IRS@ptsize}{0} % Standard: 10pt

\newif\ifIRS@dvips
\IRS@dvipsfalse
\newif\ifIRS@pdftex
\IRS@pdftexfalse
\newif\ifIRS@dvipdf
\IRS@dvipdffalse
\newif\ifIRS@dvipdfm
\IRS@dvipdfmtrue
\newif\ifIRS@dvipdfmx
\IRS@dvipdfmxfalse
\newcommand{\IRS@useddriver}{dvipdfm} % Standard: Treiber DVIPDFM
\newif\ifIRS@pdfcprot
\IRS@pdfcprottrue
\newif\ifIRS@twoside
\IRS@twosidetrue % Standard: twoside
\newif\ifIRS@openright
\IRS@openrighttrue % Standard: openright
\newif\ifIRS@hyperref
\IRS@hyperreftrue
\newif\ifIRS@color
\IRS@colorfalse
\newif\ifIRS@english
\IRS@englishtrue
\newif\ifIRS@french
\IRS@frenchfalse
\newif\ifIRS@german
\IRS@germanfalse
\newif\ifIRS@loadparskip
\IRS@loadparskiptrue
\newif\ifIRS@loadcrop
\IRS@loadcropfalse
\newif\ifIRS@croppage
\IRS@croppagefalse
\newif\ifIRS@loadexscale
\IRS@loadexscalefalse

\DeclareOption{report}{\IRS@reporttrue\IRS@bookfalse\renewcommand{\CurrentClass}{report}}
\DeclareOption{book}{\IRS@booktrue\IRS@reportfalse\renewcommand{\CurrentClass}{book}}
\ProcessOptions\relax
\DeclareOption{chapter}{\IRS@chaptertrue}
\DeclareOption{chapterplain}{\IRS@chapterplaintrue\IRS@indexplaintrue}
\DeclareOption{noemptyendofchapter}{\IRS@emptyeocfalse}
\DeclareOption{notitlepage}{\ClassWarningNoLine{IRSDIPLOM}{option `notitlepage' not supported.}}
\DeclareOption{indexplain}{\IRS@indexplaintrue}
\DeclareOption{indexchapter}{\IRS@indexchaptertrue}
\DeclareOption{idxtotoc}{\IRS@indexchaptertrue\IRS@idxtotoctrue}
\DeclareOption{crop}{\IRS@loadcroptrue\IRS@croppagetrue}
\DeclareOption{a4paper}{\IRS@booksizefalse\IRS@aviertrue\IRS@afuenffalse\IRS@loadcropfalse\IRS@croppagefalse\renewcommand{\IRS@ptsize}{1}}
\DeclareOption{a5paper}{\IRS@booksizefalse\IRS@avierfalse\IRS@afuenftrue\renewcommand{\IRS@ptsize}{4}}
\DeclareOption{booksize}{\IRS@booksizetrue\IRS@avierfalse\IRS@afuenffalse\renewcommand{\IRS@ptsize}{0}}
\DeclareOption{landscape}{\ClassWarningNoLine{IRSDIPLOM}{option `landscape' not supported.}}
\DeclareOption{10pt}{\renewcommand{\IRS@ptsize}{0}}
\DeclareOption{11pt}{\renewcommand{\IRS@ptsize}{1}}
\DeclareOption{12pt}{\renewcommand{\IRS@ptsize}{2}}
\DeclareOption{8pt}{\renewcommand{\IRS@ptsize}{3}}
\DeclareOption{9pt}{\renewcommand{\IRS@ptsize}{4}}
\DeclareOption{14pt}{\renewcommand{\IRS@ptsize}{5}}
\DeclareOption{17pt}{\renewcommand{\IRS@ptsize}{6}}
\DeclareOption{20pt}{\renewcommand{\IRS@ptsize}{7}}
\DeclareOption{oneside}{\IRS@twosidefalse}
\DeclareOption{twoside}{\IRS@twosidetrue}
\DeclareOption{openright}{\IRS@openrighttrue}
\DeclareOption{openany}{\IRS@openrightfalse}
\DeclareOption{pdftex}{\IRS@pdftextrue\IRS@dvipsfalse\IRS@dvipdffalse\IRS@dvipdfmfalse\IRS@dvipdfmxfalse\renewcommand{\IRS@useddriver}{pdftex}}
\DeclareOption{dvips}{\IRS@pdftexfalse\IRS@dvipstrue\IRS@dvipdffalse\IRS@dvipdfmfalse\IRS@dvipdfmxfalse\renewcommand{\IRS@useddriver}{dvips}}
\DeclareOption{dvipdf}{\IRS@pdftexfalse\IRS@dvipsfalse\IRS@dvipdftrue\IRS@dvipdfmfalse\IRS@dvipdfmxfalse\renewcommand{\IRS@useddriver}{dvipdf}}
\DeclareOption{dvipdfm}{\IRS@pdftexfalse\IRS@dvipsfalse\IRS@dvipdffalse\IRS@dvipdfmtrue\IRS@dvipdfmxfalse\renewcommand{\IRS@useddriver}{dvipdfm}}
\DeclareOption{dvipdfmx}{\IRS@pdftexfalse\IRS@dvipsfalse\IRS@dvipdffalse\IRS@dvipdfmfalse\IRS@dvipdfmxtrue\renewcommand{\IRS@useddriver}{dvipdfmx}}
\DeclareOption{nopdfcprot}{\IRS@pdfcprotfalse}
\DeclareOption{hyperref}{\ClassWarningNoLine{IRSDIPLOM}{obsolete option `hyperref'.\MessageBreak hyperref is now loaded by default}}
\DeclareOption{nohyperref}{\IRS@hyperreffalse}
\DeclareOption{color}{\IRS@colortrue}
\DeclareOption{english}{\IRS@englishtrue\IRS@frenchfalse\IRS@germanfalse}
\DeclareOption{french}{\IRS@englishfalse\IRS@frenchtrue\IRS@germanfalse}
\DeclareOption{german}{\IRS@englishfalse\IRS@frenchfalse\IRS@germantrue}
\DeclareOption{noparskip}{\IRS@loadparskipfalse}
\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{\CurrentClass}\PassOptionsToPackage{\CurrentOption}{graphicx}}
\DeclareOption{final}{\PassOptionsToClass{\CurrentOption}{\CurrentClass}\PassOptionsToPackage{\CurrentOption}{graphicx}}
\ProcessOptions\relax

% Falls die Schriftgr"o"sen von den Standardgr"o"sen abweichen => extsizes verwenden
%%% wurde dahingehend ge"andert, extsizes.sty zu laden, statt die Klassen zu verwenden wg. bugs!!!
%\ifnum\IRS@ptsize>2
%    \ifIRS@report\renewcommand{\CurrentClass}{extreport}\fi
%    \ifIRS@book\renewcommand{\CurrentClass}{extbook}\fi
%\fi

\ifpdf
    \IRS@pdftextrue\IRS@dvipsfalse\IRS@dvipdffalse\IRS@dvipdfmfalse\IRS@dvipdfmxfalse\renewcommand{\IRS@useddriver}{pdftex}
\else
    % Falls Treiber pdftex, aber nicht PDFLATEX zum Kompilieren verwendet wurde => verwende DVIPS
    \ifIRS@pdftex\IRS@pdftexfalse\IRS@dvipstrue\renewcommand{\IRS@useddriver}{dvips}\fi
\fi

% Falls mal Packages verwendet werden, bei denen unbedingt der richtige Treiber angegeben
% werden muss, dann hier erg"anzen!
\PassOptionsToClass{\IRS@useddriver}{\CurrentClass}\PassOptionsToPackage{\IRS@useddriver}{hyperref}%
\PassOptionsToPackage{\IRS@useddriver}{graphicx}\PassOptionsToPackage{\IRS@useddriver}{color}%
\PassOptionsToPackage{\IRS@useddriver}{geometry}
%\PassOptionsToPackage{\IRS@useddriver}{crop}% funktioniert nicht mit dvipdfm!!!

\PassOptionsToClass{titlepage}{\CurrentClass} % Standard: titlepage

\ifcase\IRS@ptsize
    \PassOptionsToClass{10pt}{\CurrentClass}\or
    \PassOptionsToClass{11pt}{\CurrentClass}\or
    \PassOptionsToClass{12pt}{\CurrentClass}\or
    \relax\or
    \relax\or
    \relax\or
    \relax\or
    \relax\fi


\ifIRS@avier
    \PassOptionsToClass{a4paper}{\CurrentClass}\PassOptionsToPackage{a4paper}{hyperref}%
        \PassOptionsToPackage{a4paper}{typearea}\PassOptionsToPackage{a4paper}{geometry}\fi
\ifIRS@afuenf
    \PassOptionsToClass{a5paper}{\CurrentClass}\PassOptionsToPackage{a5paper}{hyperref}%
        \PassOptionsToPackage{a5paper}{typearea}\PassOptionsToPackage{a5paper}{geometry}\fi

\ifIRS@twoside
    \PassOptionsToClass{twoside}{\CurrentClass}\else
    \PassOptionsToClass{oneside}{\CurrentClass}\fi

\ifIRS@openright
    \PassOptionsToClass{openright}{\CurrentClass}\else
    \PassOptionsToClass{openany}{\CurrentClass}\fi



\newcommand\loadclassoption[1]{\input{irsdiplom#1.clo}}

\DeclareOption*{\IfFileExists{irsdiplom\CurrentOption.clo}
  {\expandafter\AtEndOfClass\expandafter{%
     \expandafter\loadclassoption\expandafter{\CurrentOption}}
    \typeout{*** IRSDIPLOM: class option file \string`irsdiplom\CurrentOption.clo\string' will be loaded at end of class.}}%
  {\PassOptionsToClass{\CurrentOption}{\CurrentClass}}}
\ProcessOptions\relax

\LoadClass{\CurrentClass}

\ifcase\IRS@ptsize
    \relax\or
    \relax\or
    \relax\or
    \RequirePackage[8pt]{extsizes}\IRS@loadexscaletrue\or
    \RequirePackage[9pt]{extsizes}\IRS@loadexscaletrue\or
    \RequirePackage[14pt]{extsizes}\IRS@loadexscaletrue\or
    \RequirePackage[17pt]{extsizes}\IRS@loadexscaletrue\or
    \RequirePackage[20pt]{extsizes}\IRS@loadexscaletrue\fi

\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{geometry}
\RequirePackage{graphicx}
%\RequirePackage[latin1]{inputenc}
%\RequirePackage[utf8]{inputenc}
\RequirePackage{fix-cm}
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}
\RequirePackage{helvet}
\ifIRS@german % Geändert von Oliver Stark 29.08.2016
	\RequirePackage[german]{babel}
\fi
\ifIRS@english
    \RequirePackage[english]{babel}
\fi
\ifIRS@french
	\RequirePackage[french]{babel}
\fi
\ifIRS@loadparskip
    \RequirePackage{parskip}
\fi
\ifIRS@loadcrop
    \RequirePackage[a4,center,dvips!]{crop}
    \AtBeginDocument{\crop[cam]}
    \ifIRS@twoside\AtBeginDocument{\crop[odd]}\fi
    \AtBeginDocument{\crop[info]}
\fi

%% Seiteneinstellungen vor dem Laden von hyperref festlegen (wichtig f"ur dvipdfm)
\ifIRS@avier
   \geometry{paperwidth=210mm, paperheight=297mm, height=247mm,width=167mm,top=21.5mm,right=15mm}%,headsep=7mm,headheight=10mm,footskip=11mm}
\fi
\ifIRS@afuenf
   \geometry{paperwidth=148mm, paperheight=210mm, height=175mm,width=117mm,top=19mm,right=12mm}%,headsep=6mm,headheight=10mm,footskip=9mm
\fi
\ifIRS@booksize
   \geometry{paperwidth=170mm, paperheight=240mm, height=192mm,width=128mm,top=26mm,right=17mm}%,left=25mm,includehead,headsep=6mm,headheight=10mm,footskip=9mm
\fi

\def\phantomsection{\relax} % wird in hyperref richtig definiert; f"ur idxtotoc
\ifIRS@hyperref\RequirePackage{hyperref}\fi
\ifIRS@color\RequirePackage{color}\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Variablen vordefinieren und Befehle definieren, um deren Werte ver"andern zu k"onnen

\newcommand{\IRS@headtextfont}{\sl}
\newcommand{\IRS@headpagenumberfont}{\rm}
\newcommand{\IRS@captionwordfont}{}
\newcommand{\IRS@captionfont}{}
\newcommand{\headtextfont}[1]{\renewcommand{\IRS@headtextfont}{#1}}
\newcommand{\headnumberfont}[1]{\renewcommand{\IRS@headpagenumberfont}{#1}}
\newcommand{\captionwordfont}[1]{\renewcommand{\IRS@captionwordfont}{#1}}
% \captionfont wird erst sp"ater definiert, um Kompatibilit"at mit caption.sty sicherzustellen
\newcommand{\IRS@place}{\changefont{phv}{m}{n}{Karlsruhe}}	%% [MerkerMS01]
\newcommand{\IRS@startdate}{}			
\newcommand{\IRS@defensedate}{}	% Hinzugefuegt, Jairo Inga 2019.02.20													
\newcommand{\IRS@arbeittyp}{}
\newcommand{\IRS@arbeittypm}{}						%% Hinzugefuegt, wie arbeittyp, nur nicht fettgedruckt, Manuel Schwartz 2015.10.13
\newcommand{\IRS@arbeitnummer}{007}
\newcommand{\IRS@titlepagetitle}{}
\newcommand{\IRS@deckblatttitle}{}
\newcommand{\IRS@titlem}{} 							%% Hinzugefuegt, wie title, nur nicht fettgedruckt, Manuel Schwartz 2015.01.17
\newcommand{\IRS@coop}{} 							%% Hinzugefuegt, Name des Unternehmens bei externer Arbeit, Manuel Schwartz 2015.01.17
\newcommand{\IRS@dateEnd}{} 						%% Hinzugefuegt, Name des Unternehmens bei externer Arbeit, Manuel Schwartz 2015.02.03
\newcommand{\IRS@beschreibung}{\ifIRS@german{\bfseries Noch keine Beschreibung vorhanden.}\else{\bfseries description not available yet.}\fi}%
\newcommand{\IRS@betreuer}{Dipl.-Ing. Alfons Pilar}
\newcommand{\IRS@hauptreferent}{\changefont{phv}{m}{n}{Prof.\,Dr.-Ing. Sören Hohmann}}
\newcommand{\IRS@zweitpruefer}{}    %% Hinzugefuegt, Jairo Inga 2019.03.05
\newcommand{\IRS@korreferent}{}
\newcommand{\IRS@authortitle}{cand.\,el.}
\newcommand{\IRS@secondauthor}{}
\newcommand{\IRS@secondauthortitle}{cand.\,el.}
\newcommand{\IRS@keywords}{}
\newcommand{\IRS@textausgabetag}{\changefont{phv}{m}{n}{Tag der Ausgabe}}	%% [MerkerMS01]
\newcommand{\IRS@vortragstag}{\changefont{phv}{m}{n}{Tag des Vortrags}}	%%  Hinzugefuegt Jairo Inga 2019.02.20
\newcommand{\IRS@textabgabetag}{\changefont{phv}{m}{n}{Tag der Abgabe}}		%% [MerkerMS01]
\newcommand{\IRS@textbetreuer}{\changefont{phv}{m}{n}{Betreuer}}			%% [MerkerMS01]
\newcommand{\IRS@textkorreferent}{\changefont{phv}{m}{n}{Korreferent}}		%% [MerkerMS01]
\newcommand{\IRS@texthauptreferent}{\changefont{phv}{m}{n}{Hauptreferent}}		%% Jairo Inga 2019.02.20
\newcommand{\IRS@textzweitpruefer}{\changefont{phv}{m}{n}{Zweitprüfer}} %% Jairo Inga 2019.03.05
\newcommand{\IRS@textbearbeiter}{\changefont{phv}{m}{n}{Bearbeiter}}		%% [MerkerMS01]
\newcommand{\place}[1]{\renewcommand{\IRS@place}{#1}}
\newcommand{\startdate}[1]{\renewcommand{\IRS@startdate}{#1}}
\newcommand{\defensedate}[1]{\renewcommand{\IRS@defensedate}{#1}} %% Hinzugefuegt, Jairo Inga 2019.02.20
\newcommand{\arbeittyp}[1]{\renewcommand{\IRS@arbeittyp}{#1}}
\newcommand{\arbeittypm}[1]{\renewcommand{\IRS@arbeittypm}{#1}} 		%% Hinzugefuegt, wie arbeittyp, nur nicht fettgedruckt, Manuel Schwartz 2015.10.13
\newcommand{\titlem}[1]{\renewcommand{\IRS@titlem}{#1}}					%% Hinzugefuegt, wie title, nur nicht fettgedruckt, Manuel Schwartz 2017.01.17
\newcommand{\coop}[1]{\renewcommand{\IRS@coop}{#1}} 					%% Hinzugefuegt, wie title, nur nicht fettgedruckt, Manuel Schwartz 2017.01.17
\newcommand{\dateEnd}[1]{\renewcommand{\IRS@dateEnd}{#1}} 				%% Hinzugefuegt, wie title, nur nicht fettgedruckt, Manuel Schwartz 2017.02.03
\newcommand{\arbeitnummer}[1]{\renewcommand{\IRS@arbeitnummer}{#1}}
\newcommand{\titlepagetitle}[1]{\renewcommand{\IRS@titlepagetitle}{#1}}
\newcommand{\deckblatttitle}[1]{\renewcommand{\IRS@deckblatttitle}{#1}}
\newcommand{\beschreibung}[1]{\renewcommand{\IRS@beschreibung}{#1}}
\newcommand{\betreuer}[1]{\renewcommand{\IRS@betreuer}{#1}}
\newcommand{\hauptreferent}[1]{\renewcommand{\IRS@hauptreferent}{#1}}
\newcommand{\zweitpruefer}[1]{\renewcommand{\IRS@zweitpruefer}{#1}} %% Hinzugefuegt, Jairo Inga 2019.03.05
\newcommand{\korreferent}[1]{\renewcommand{\IRS@korreferent}{#1}}
\newcommand{\authortitle}[1]{\renewcommand{\IRS@authortitle}{#1}}
\newcommand{\secondauthor}[1]{\renewcommand{\IRS@secondauthor}{#1}}
\newcommand{\secondauthortitle}[1]{\renewcommand{\IRS@secondauthortitle}{#1}}
\newcommand{\keywords}[1]{\renewcommand{\IRS@keywords}{#1}}
\newcommand{\textausgabetag}[1]{\renewcommand{\IRS@textausgabetag}{#1}}
\newcommand{\vortragstag}[1]{\renewcommand{\IRS@vortragstag}{#1}} %Hinzugefuegt, Jairo Inga 2019.02.20
\newcommand{\textabgabetag}[1]{\renewcommand{\IRS@textabgabetag}{#1}}
\newcommand{\textbetreuer}[1]{\renewcommand{\IRS@textbetreuer}{#1}}
\newcommand{\textkorreferent}[1]{\renewcommand{\IRS@textkorreferent}{#1}}
\newcommand{\textzweitpruefer}[1]{\renewcommand{\IRS@zweitpruefer}{#1}} %% Hinzugefuegt, Jairo Inga 2019.03.05
\newcommand{\textbearbeiter}[1]{\renewcommand{\IRS@textbearbeiter}{#1}}
\@onlypreamble\place
\@onlypreamble\startdate
\@onlypreamble\arbeittyp
\@onlypreamble\arbeittypm 	%% Hinzugefuegt, wie arbeittyp, nur nicht fettgedruckt, Manuel Schwartz 2015.10.13
\@onlypreamble\titlem 		%% Hinzugefuegt, wie title, nur nicht fettgedruckt, Manuel Schwartz 2017.01.17
\@onlypreamble\coop 		%% Hinzugefuegt, wie title, nur nicht fettgedruckt, Manuel Schwartz 2017.01.17
\@onlypreamble\dateEnd 		%% Hinzugefuegt, wie title, nur nicht fettgedruckt, Manuel Schwartz 2017.02.03
\@onlypreamble\arbeitnummer
\@onlypreamble\titlepagetitle
\@onlypreamble\deckblatttitle
\@onlypreamble\beschreibung
\@onlypreamble\betreuer
\@onlypreamble\hauptreferent
\@onlypreamble\korreferent
\@onlypreamble\authortitle
\@onlypreamble\secondauthor
\@onlypreamble\secondauthortitle
\@onlypreamble\keywords
\@onlypreamble\textausgabetag
\@onlypreamble\vortragstag %Hinzugefuegt, Jairo Inga 2019.02.20
\@onlypreamble\textabgabetag
\@onlypreamble\textbetreuer
\@onlypreamble\textkorreferent
\@onlypreamble\textzweitpruefer  %Hinzugefuegt, Jairo Inga 2019.03.05
\@onlypreamble\textbearbeiter
\ifIRS@english
  \title{Title}
  \author{Author}
\else
  \title{Titel}
  \author{Autor}
\fi

\let\and\relax
\date{\today}

\newcommand{\nocroppage}{\IRS@croppagefalse}
\@onlypreamble\nocroppage

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Allgemeine Einstellungen

\RequirePackage{setspace} \setstretch{1.1}

% Offset f"ur Druckausgabe einstellen (wichtig f"ur zweiseitigen Druck)
%
% Wichtig: Experimentelles Feature - wird bald ge"andert!
%
\newcommand{\IRS@printername}{}
\newlength{\IRS@hoffset}
\newlength{\IRS@voffset}
\setlength{\IRS@hoffset}{0pt}
\setlength{\IRS@voffset}{0pt}
\newcommand{\printername}[1]{\renewcommand{\IRS@printername}{#1}}
\newcommand{\printerhoffset}[1]{\setlength{\IRS@hoffset}{#1}}
\newcommand{\printervoffset}[1]{\setlength{\IRS@voffset}{#1}}
\@onlypreamble\printername
\@onlypreamble\printerhoffset
\@onlypreamble\printervoffset
%\InputIfFileExists{localprinters.cfg}{\ClassInfo{irsdiplom}{Local printer config file localprinters.cfg loaded}}%
%{\ClassInfo{irsdiplom}{Didn't find any local printer config file (localprinters.cfg)}}
\AtBeginDocument{%
      \advance\voffset\IRS@voffset%
      \advance\hoffset\IRS@hoffset%
      }

% zum Zwischenparken der Werte...
\newlength{\IRS@parskiptemp}
\newlength{\IRS@parindenttemp}


% Exscale in einer modifizierten Version 'laden', falls keine LaTeX-Standard-Schriftgroesse verwendet wird
\ifIRS@loadexscale
  \ifIRS@dvipdfm
    \DeclareFontShape{OMX}{cmex}{m}{n}{%
          <-8> %sfixed * cmex7
          <8> %cmex8
          <9> %cmex9
          <10> <10.95> <12> <14.4> <17.28> <20.74> <24.88>cmex10
           }{}
    \DeclareSymbolFont{largesymbols}{OMX}{cmex}{m}{n}
    \newdimen\big@size
    \addto@hook\every@math@size{\setbox\z@\vbox{\hbox{$($}\kern\z@}%
       \global\big@size 1.2\ht\z@}
    \def\bBigg@#1#2{%
       {\hbox{$\left#2\vcenter to#1\big@size{}\right.\n@space$}}}
    \def\big{\bBigg@\@ne}
    \def\Big{\bBigg@{1.5}}
    \def\bigg{\bBigg@\tw@}
    \def\Bigg{\bBigg@{2.5}}
  \else
    \RequirePackage{exscale}
  \fi
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Anpassung an PDFLaTeX, dvipdfm, ...


%% EVTL AUSKOMMENTIEREN WENN FEHLER AUFTRETEN !!
%% ---------------------------------------------

\ifpdf
    %% Die \DeclareGraphicsExtensions werden durch die Angabe des Treibers bei graphicx
    %% automatisch richtig gesetzt!!!
    %% Allerdngs: Um PDFTEX um die F"ahigkeit EPS's zu verarbeiten zu erweitern:
    %% (siehe epstopdf.sty f"ur weitere Anweisung, wie es zu verwenden ist)
    \IfFileExists{epstopdf.sty}{\RequirePackage{epstopdf}%
        \typeout{*** INFO: ensure that PDFLATEX is run with the option ^^J%
                 *** \string`-shell-escape\string' for epstopdf to work properly!}}{\relax}

    % Gimmick: Optischer Randausgleich (s. Doku dazu)
    \IfFileExists{pdfcprot.sty}{\ifIRS@pdfcprot\RequirePackage[activate]{pdfcprot}\fi}{\relax}

    % Alle unbekannten Typen werden als METAPOST-Ausgaben behandelt (so wie beim Standard-LaTeX das eps-Format...)
    \DeclareGraphicsRule{*}{mps}{*}{}
\fi

% Setzen des Papierformats bei DVIPS
\ifIRS@dvips
    \ifIRS@loadcrop
        \AtBeginDvi{\special{papersize=210mm,297mm}}
    \fi
    \@ifpackageloaded{graphics}{% schliesst auch graphicx mit ein...
    \g@addto@macro\Gin@extensions{,.png}
    \DeclareGraphicsRule{.png}{eps}{.bb}{`bmeps #1}
    }{}
\fi

% Setzen des Papierformats bei DVIPDFM
\ifIRS@dvipdfm
    \ifIRS@loadcrop
        \AtBeginDvi{\special{pdf: pagesize width 210truemm height 297truemm}}
    \fi
    \@ifpackageloaded{graphics}{% schliesst auch graphicx mit ein...
    \g@addto@macro\Gin@extensions{,.eps}
    }{}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Anpassungen hyperref

% Damit Ausdruck gut aussieht!
\ifIRS@hyperref
    \hypersetup{colorlinks=true,
        citecolor=black,
        linkcolor=black,
        %% pagecolor=black, %% Auskommentiert, Manuel Schwartz 2015.10.13 (Warning: Package hyperref Warning: Option 'pagecolor' is not available anymore.)
        urlcolor=black,
        pdfcreator={LaTeX with document class IRSDiplom v\IRS@version.\IRS@revision\ (\IRS@filedate)}}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% F"ur Sortierreihenfolge in BibTeX

\newcommand{\noopsort}[1]{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Neue Kommandos

\newcommand{\isavier}[2]{\ifIRS@avier\protect #1\else \protect #2\fi}
\newcommand{\isafuenf}[2]{\ifIRS@afuenf\protect #1\else \protect #2\fi}
\newcommand{\isbooksize}[2]{\ifIRS@booksize\protect #1\else \protect #2\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% "Andern der Pagestyles

% Pagestyle "headings" ver"andern/anpassen
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty%
%      \def\@oddfoot{Matthias Schwaiger}\def\@evenfoot{Matthias Schwaiger}% Debugging
      \def\@evenhead{\rule[-1.5mm]{\textwidth}{.1mm}\rule{-\textwidth}{0mm}%
        {\IRS@headpagenumberfont\thepage}\hfil\IRS@headtextfont\leftmark}%
      \def\@oddhead{\rule[-1.5mm]{\textwidth}{.1mm}\rule{-\textwidth}{0mm}%
        {\IRS@headtextfont\rightmark}\hfil\IRS@headpagenumberfont\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {%
        \ifIRS@chapter
          \ifnum \c@secnumdepth >\m@ne
            \if@mainmatter
              \@chapapp\ \thechapter.\ \relax%
            \fi
          \else
            \hskip 1em\relax%
          \fi
        \else
          \hskip 1em\relax%
        \fi
        ##1}{}
      \markright {% notwendig, falls nach \chapter lange kein \section kommt
        %\ifnum \c@secnumdepth >\z@
        %  \thechapter\hskip 1em\relax
        %\else
        %  \hskip 1em\relax
        %\fi
        %##1
        }{}}
    \def\sectionmark##1{%
      \markright {%
        \ifnum \c@secnumdepth >\@ne
          \thesection\hskip 1em\relax
        \else
          \hskip 1em\relax
        \fi
        ##1}}}
\else % oneside
  \def\ps@headings{
      \let\@oddfoot\@empty
      \def\@oddhead{\rule[-1.5mm]{\textwidth}{.1mm}\rule{-\textwidth}{0mm}%
        {\IRS@headtextfont\rightmark}\hfil\IRS@headpagenumberfont\thepage}%
      \let\@mkboth\markboth
    \ifIRS@chapter
      \def\chaptermark##1{%
        \markright {%
          \ifnum \c@secnumdepth >\z@
            \if@mainmatter
              %\@chapapp\ %
              \thechapter.\hskip 1em\relax%
            \else
              \relax%
            \fi
          \else
            \relax%
          \fi
        ##1}{}}
    \else
      \def\chaptermark##1{%
        \markright {%
        }{}}
    \fi
    \def\sectionmark##1{%
      \markright {%
        \ifnum \c@secnumdepth >\@ne
          \thesection\hskip 1em\relax
        \else
          \thechapter\hskip 1em\relax
        \fi
        ##1}}}
\fi

% Pagestyle "myheadings" ver"andern/anpassen
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\rule[-1.5mm]{\IRS@textwidth}{.1mm}\rule{-\IRS@textwidth}{0mm}%
      {\IRS@headpagenumberfont\thepage}\hfil\IRS@headtextfont\leftmark}%
    \def\@oddhead{\rule[-1.5mm]{\IRS@textwidth}{.1mm}\rule{-\IRS@textwidth}{0mm}%
      {\IRS@headtextfont\rightmark}\hfil\IRS@headpagenumberfont\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }

% Standardm"assigen pagestyle aufrufen
\pagestyle{headings}

% Ver"andern, welcher pagestyle beim "Ubergang von Kapiteln/Abschnitten verwendet werden soll
\renewcommand\chapter{\clearpage
                      \ifIRS@emptyeoc\thispagestyle{empty}\else\relax\fi
                      \if@openright\cleardoublepage\else\relax\fi
                      \thispagestyle{empty}
                      \global\@topnum\z@
                      \@afterindentfalse
                      \secdef\@chapter\@schapter}

\ifIRS@book
  \renewcommand\frontmatter{%
      \clearpage
      \ifIRS@emptyeoc\thispagestyle{empty}\else\relax\fi
      \cleardoublepage\thispagestyle{empty}
    \@mainmatterfalse
    \pagenumbering{roman}}
  \renewcommand\mainmatter{%
      \clearpage
      \ifIRS@emptyeoc\thispagestyle{empty}\else\relax\fi
      \cleardoublepage\thispagestyle{empty}
    \@mainmattertrue
    \pagenumbering{arabic}}
  \renewcommand\backmatter{%
      \clearpage\thispagestyle{empty}
    \if@openright
      \cleardoublepage\thispagestyle{empty}
    \else
      \relax
    \fi
    \@mainmatterfalse}
\fi

% Vertikalen Abstand beim Beginn eines neuen Kapitels anpassen
\def\@makechapterhead#1{%
  \vspace*{20\p@}% original: 50
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 30\p@% original: 40
  }}

\def\@makeschapterhead#1{%
  \vspace*{20\p@}% original: 50
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 30\p@% original: 40
  }}


% Die "Uberschriften in den Kopfzeilen sollen nicht in Gro"sbuchstaben erscheinen
% und der Zeilenabstand auf einfach geschaltet werden
\renewcommand{\tableofcontents}{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname\@mkboth{\contentsname}{\contentsname}}%
    \begin{singlespace}
    \@starttoc{toc}%
    \end{singlespace}
    \if@restonecol\twocolumn\fi
    }

\renewcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
    \addcontentsline{toc}{chapter}{\listfigurename}%
      \@mkboth{\listfigurename}%
              {\listfigurename}%
    \begin{singlespace}
    \@starttoc{lof}%
    \end{singlespace}
    \if@restonecol\twocolumn\fi
    }

\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
    \addcontentsline{toc}{chapter}{\listtablename}%
      \@mkboth{%
          \listtablename}%
         {\listtablename}%
    \begin{singlespace}
    \@starttoc{lot}%
    \end{singlespace}
    \if@restonecol\twocolumn\fi
    }

\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \addcontentsline{toc}{chapter}{\bibname}%
      \@mkboth{\bibname}{\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
						%% Manuel Schwartz 2015.10.13, ab Anhang (auch Bibliography) mit großen roemischen Buchstaben
						\pagenumbering{Roman}
						\setcounter{page}{1}
						%%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m%
      \begin{singlespace}}
     {\end{singlespace}%
        \def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

% ... und beim Index gibt es ausserdem noch eine Option f"ur den pagestyle der 1. Seite
\renewenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \clearpage
                \ifIRS@indexchapter
                  \ifIRS@emptyeoc\thispagestyle{empty}\else\relax\fi
                  \if@openright\cleardoublepage\else\relax\fi
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \phantomsection%
                \ifIRS@idxtotoc\addcontentsline{toc}{chapter}{\indexname}\fi%
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\indexname}%
                        {\indexname}%
                %
                \ifIRS@indexplain\thispagestyle{plain}\else\thispagestyle{empty}\fi%
                \parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem
                \begin{singlespace}}
               {\end{singlespace}%
                \if@restonecol\onecolumn\else\clearpage\fi}

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\ifIRS@emptyeoc\thispagestyle{empty}\else\relax\fi\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Titelseite neu definieren

\renewcommand\maketitle{%
  \ifIRS@afuenf
    \advance\oddsidemargin -5mm
    \advance\textwidth 4mm
  \fi
  \ifIRS@booksize
    \advance\oddsidemargin -2mm
    \advance\textwidth 3mm
  \fi
  \begin{titlepage}%
  \setlength{\parskip}{0pt}%
  \setlength{\parindent}{0pt}%
  \begin{singlespace}%
  \sffamily%
  % \setcounter{page}{1}%\m@ne		%% Geaendert, erzeugte falsche Seitenzahlen, Manuel Schwartz 2015.10.13
  \thispagestyle{empty}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let\footnote\thanks
  \ifthenelse{\equal{\IRS@titlepagetitle}{}}{\renewcommand{\IRS@titlepagetitle}{\@title}}{\relax}
  %
  \ifIRS@avier
  {%
%  \raisebox{-0.7cm}[0pt][0pt]{\includegraphics[width=\textwidth]{unilogo_uni_fakultaet}}
  \ifIRS@dvipdfm
%    \raisebox{-1.1cm}[0pt][0pt]{\includegraphics[width=\textwidth]{unilogo_forschungsuni_fakultaet.eps}}
    \raisebox{-1.1cm}[0pt][0pt]{\includegraphics[width=\textwidth]{kitlogo_fakultaet.eps}}
  \else
%    \raisebox{-1.1cm}[0pt][0pt]{\includegraphics[width=\textwidth]{unilogo_forschungsuni_fakultaet}}
    \raisebox{-1.1cm}[0pt][0pt]{\includegraphics[width=\textwidth]{kitlogo_fakultaet}}
  \fi

  \vspace*{1.8cm}
  {\hspace*{-0.05\textwidth}\hbox to\z@{\rule{1.1\textwidth}{0.6mm}\hss}}

  \vspace*{2.2cm}
  \parbox[top][15cm][t]{\textwidth}{%
  {\scalebox{2}{\parbox{0.5\textwidth}{\sffamily\fontsize{11}{13.2pt}\selectfont\sloppy\raggedright\@author%
  \ifthenelse{\equal{\IRS@secondauthor}{}}{}{~\\[0.3ex] \IRS@secondauthor}%
  }}}
  \vfil
  \vfil
  {\scalebox{2.1}{\parbox{0.48\textwidth}{\sffamily\fontsize{14}{16.8pt}\bfseries\sloppy\raggedright\IRS@titlepagetitle}}}%
  \vfil
  }

  {\hspace*{-0.05\textwidth}\hbox to\z@{\rule{1.1\textwidth}{0.6mm}\hss}}

  \vspace*{1.2cm}
  {\scalebox{1.8}{\parbox{0.56\textwidth}{\sffamily\fontsize{10}{12pt}\bfseries\sloppy\raggedright\IRS@arbeittyp{}
  \IRS@arbeitnummer}}}

  \ifIRS@dvipdfm
%    \raisebox{-2cm}[0pt][0pt]{\includegraphics[width=\textwidth]{irslogo_irs_institutsleiter.eps}}
    \raisebox{-2cm}[0pt][0pt]{\includegraphics[width=\textwidth]{irslogo.eps}}
  \else
%    \raisebox{-2cm}[0pt][0pt]{\includegraphics[width=\textwidth]{irslogo_irs_institutsleiter}}
    \raisebox{-2cm}[0pt][0pt]{\includegraphics[width=\textwidth]{irslogo}}
  \fi

  \raisebox{-2.8cm}[0pt][0pt]{\hspace*{-0.05\textwidth}\hbox to\z@{\rule{1.1\textwidth}{0.6mm}\hss}}%
  }
  \fi
  \ifIRS@afuenf
  % A5 Layout der Titelseite
  {%
  \ifIRS@dvipdfm
    \raisebox{-3.5mm}[0pt][0pt]{\includegraphics[width=\textwidth]{kitlogo_fakultaet.eps}}
  \else
    \raisebox{-3.5mm}[0pt][0pt]{\includegraphics[width=\textwidth]{kitlogo_fakultaet}}
  \fi

  \vspace*{8mm}
  {\hspace*{-0.04\textwidth}\hbox to\z@{\rule{1.08\textwidth}{0.4mm}\hss}}

  \vspace*{1.4cm}
  \parbox[top][10.7cm][t]{\textwidth}{%
  {\scalebox{1.6}{\parbox{0.62\textwidth}{\sffamily\fontsize{10}{12pt}\selectfont\sloppy\raggedright\@author%
  \ifthenelse{\equal{\IRS@secondauthor}{}}{}{~\\[0.3ex] \IRS@secondauthor}%
  }}}
  \vfil
  \vfil
  {\scalebox{2}{\parbox{0.5\textwidth}{\sffamily\fontsize{11}{13.2pt}\bfseries\sloppy\raggedright\IRS@titlepagetitle}}}%
  \vfil
  }

  {\hspace*{-0.04\textwidth}\hbox to\z@{\rule{1.08\textwidth}{0.4mm}\hss}}

  \vspace*{0.7cm}
  {\scalebox{1.3}{\parbox{0.77\textwidth}{\sffamily\fontsize{10}{12pt}\bfseries\sloppy\raggedright\IRS@arbeittyp{}
  \IRS@arbeitnummer}}}

  \ifIRS@dvipdfm
    \raisebox{-1.4cm}[0pt][0pt]{\includegraphics[width=\textwidth]{irslogo.eps}}
  \else
    \raisebox{-1.4cm}[0pt][0pt]{\includegraphics[width=\textwidth]{irslogo}}
  \fi

  \raisebox{-2cm}[0pt][0pt]{\hspace*{-0.04\textwidth}\hbox to\z@{\rule{1.08\textwidth}{0.4mm}\hss}}%
  }
  \fi
  \ifIRS@booksize
  % Buchformat-Layout der Titelseite
  {%
  \ifIRS@dvipdfm
    \raisebox{-3.5mm}[0pt][0pt]{\includegraphics[width=\textwidth]{kitlogo_fakultaet.eps}}
  \else
    \raisebox{-3.5mm}[0pt][0pt]{\includegraphics[width=\textwidth]{kitlogo_fakultaet}}
  \fi

  \vspace*{8mm}
  {\hspace*{-0.04\textwidth}\hbox to\z@{\rule{1.08\textwidth}{0.4mm}\hss}}

  \vspace*{1.6cm}
  \parbox[top][12cm][t]{\textwidth}{%
  {\scalebox{1.6}{\parbox{0.62\textwidth}{\sffamily\fontsize{11}{13.2pt}\selectfont\sloppy\raggedright\@author%
  \ifthenelse{\equal{\IRS@secondauthor}{}}{}{~\\[0.3ex] \IRS@secondauthor}%
  }}}
  \vfil
  \vfil
  {\scalebox{2}{\parbox{0.5\textwidth}{\sffamily\fontsize{12}{14.4pt}\selectfont\bfseries\sloppy\raggedright\IRS@titlepagetitle}}}%
  \vfil
  }

  {\hspace*{-0.04\textwidth}\hbox to\z@{\rule{1.08\textwidth}{0.4mm}\hss}}

  \vspace*{0.7cm}
  {\scalebox{1.3}{\parbox{0.77\textwidth}{\sffamily\fontsize{11}{13.2pt}\selectfont\bfseries\sloppy\raggedright\IRS@arbeittyp{}
  \IRS@arbeitnummer}}}

  \ifIRS@dvipdfm
    \raisebox{-1.4cm}[0pt][0pt]{\includegraphics[width=\textwidth]{irslogo.eps}}
  \else
    \raisebox{-1.4cm}[0pt][0pt]{\includegraphics[width=\textwidth]{irslogo}}
  \fi

  \raisebox{-2cm}[0pt][0pt]{\hspace*{-0.04\textwidth}\hbox to\z@{\rule{1.08\textwidth}{0.4mm}\hss}}%
  }
  \fi
  \end{singlespace}%
  \end{titlepage}%
  \ifIRS@afuenf
    \advance\oddsidemargin 5mm
    \advance\textwidth -4mm
  \fi
  \ifIRS@booksize
    \advance\oddsidemargin 2mm
    \advance\textwidth -3mm
  \fi
  \setcounter{footnote}{0}%
  %\setcounter{page}{1}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  %\global\let\@author\@empty
  %\global\let\@date\@empty
  %\global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \ifIRS@french\relax\else%
    \global\let\date\relax
  \fi
  \global\let\and\relax
  \ifIRS@twoside%
  \newpage\thispagestyle{empty}
  \else
  %\setcounter{page}{0}% %% Geaendert, erzeugte falsche Seitenzahlen, Manuel Schwartz 2015.10.13
  \fi
  %% \setcounter{page}{0}%	%% Geaendert, erzeugte falsche Seitenzahlen, Manuel Schwartz 2015.10.13
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Abstract
\ifIRS@book
    \newenvironment{abstract}{}{}
    \def\abstractname{abstract}
\fi

\renewenvironment{abstract}{%
      \setlength{\IRS@parindenttemp}{\parindent}
      \setlength{\parindent}{0pt}
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse
      \fi
      \newpage%
      \thispagestyle{empty}%
      %\ifthenelse{\value{page}=0}{}{\addtocounter{page}{-1}}%
      \chapter*{\abstractname}
					\begin{singlespace}
        				\setlength{\parindent}{\IRS@parindenttemp}
        				}
        				{\end{singlespace}
       \if@restonecol\twocolumn\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Danksagung	%% Neu, Falls das jemand schreiben will, Manuel Schwartz 03.04.2016,
\ifIRS@book
    \newenvironment{danke}{}{}
    \def\dankename{Danksagung}
\fi

\renewenvironment{danke}{%
      \setlength{\IRS@parindenttemp}{\parindent}
      \setlength{\parindent}{0pt}
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse
      \fi
      \newpage%
      \thispagestyle{empty}%
      %\ifthenelse{\value{page}=0}{}{\addtocounter{page}{-1}}%
      \chapter*{\dankename}
					\begin{singlespace}
        				\setlength{\parindent}{\IRS@parindenttemp}
        				}
        				{\end{singlespace}
       \if@restonecol\twocolumn\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Neues Kommando fuer Sperrvermerk % Manuel Schwartz 2017.02.03
%
% Deutscher sowie englischer Text mit DE Rechtsabteilung des KIT (Julia Groh, 01.02.2017) abgesprochen, gesehen auf  https://www.ksri.kit.edu/90.php
%
\newcommand{\sperrvermerk}%
{{%
%%%%% Zuweisung der richtigen Seite und Seitenlayout
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse
      \fi
\ifIRS@twoside%
\newpage%
\setlength{\IRS@parindenttemp}{\parindent}%
\setlength{\parindent}{0pt}%
\ifIRS@emptyeoc\thispagestyle{empty}\else\relax\fi%
\ifthenelse{\isodd{\value{page}}}{}{\mbox{ }\newpage}%
\thispagestyle{empty}%
\else%
\newpage%
\thispagestyle{empty}%
\fi%
%%%%%

\begin{minipage}[!ht]{\textwidth}%
\ifIRS@english
				{%
        \begin{singlespace}
			{\changefont{phv}{b}{n}{\Large{Non-disclosure Notice}}}\\\\\\
        	{\changefont{phv}{m}{n}{This}}\IRS@arbeittypm\ {\changefont{phv}{m}{n}{contains confidential data of}}\IRS@coop.{\changefont{phv}{m}{n}{Any publication or reproduction of the present thesis or of parts of it shall require the express approval by}}\IRS@coop.{\changefont{phv}{m}{n}{Copies or transcripts of the present thesis $\mathrm{-}$ including those in digital form $\mathrm{-}$ shall not be allowed. Reviewers and members of the examination committee shall have access to this thesis exclusively. For determining the grade, the thesis may be made available to other persons. This non-disclosure notice shall be valid until}} \IRS@dateEnd\ {\changefont{phv}{m}{n}{(for a period of 5 years). In case parts of the thesis will be or have already been published, this non-disclosure notice shall become void.}}
%				{\changefont{phv}{b}{n}{\Large{Non-Disclosure Agreement}}}\\\\\\\\
%				{\changefont{phv}{m}{n}{This}}\IRS@arbeittypm\ {\changefont{phv}{m}{n}{with the title}}\\\\\\
%				\@title \\\\\\
%				{\changefont{phv}{m}{n}{contains confidential data of}}\IRS@coop.\\\\\\
%				{\changefont{phv}{b}{n}{This work may only be made available to the first and second reviewers and authorized members of the board of examiners. Any publication and duplication of this bachelor thesis $\mathrm{-}$ even in parts $\mathrm{-}$ is prohibited.}}\\\\
%				{\changefont{phv}{b}{n}{An inspection of this work by third parties requires the expressed permission of the author and}}\IRS@coop. 
        \end{singlespace}
				\vspace{4ex}
				\IRS@place, the \@date%
				}
    \else
        {%
        \begin{singlespace}
        	{\changefont{phv}{b}{n}{\Large{Sperrvermerk}}}\\\\\\
        		{\changefont{phv}{m}{n}{Diese}}\IRS@arbeittypm\ {\changefont{phv}{m}{n}{enthält vertrauliche Daten der}}\IRS@coop.{\changefont{phv}{m}{n}{Veröffentlichung oder Vervielfältigungen der Arbeit, auch nur auszugsweise, sind ohne ausdrückliche Genehmigung der}}\IRS@coop\ {\changefont{phv}{m}{n}{nicht gestattet. Es dürfen keinerlei Kopien oder Abschriften $\mathrm{-}$ auch in digitaler Form $\mathrm{-}$ gefertigt werden. Die Arbeit ist nur Korrektoren sowie Mitgliedern des Prüfungsausschusses zugänglich zu machen. Im Rahmen des Notenfindungsprozesses kann die Arbeit weiteren Personen zugänglich gemacht werden. Dieser Sperrvermerk gilt bis zum}} \IRS@dateEnd\ {\changefont{phv}{m}{n}{(5 Jahre). Sollten Teile der Arbeit durch Dritte veröffentlicht werden oder bereits veröffentlicht worden sein, ist der Sperrvermerk hinfällig.}}
				
%				{\changefont{phv}{m}{n}{Die vorliegende}}\IRS@arbeittypm\ {\changefont{phv}{m}{n}{mit dem Titel}}\\\\\\
%				\@title \\\\\\
%				{\changefont{phv}{m}{n}{beinhaltet interne und vertrauliche Informationen des Unternehmens}}\IRS@coop.\\\\\\
%				{\changefont{phv}{b}{n}{Eine Einsicht in diese}} \IRS@arbeittyp\ {\changefont{phv}{b}{n}{ist nicht gestattet. Ausgenommen davon sind die betreuenden Dozenten, die befugten Mitglieder des Prüfungsausschusses sowie der Geheimhaltungserklärung des KIT unterliegenden Personen. Eine Veröffentlichung und Vervielfältigung der Bachelorarbeit $\mathrm{-}$ auch in Auszügen $\mathrm{-}$ ist nicht gestattet.}}
        \end{singlespace}
        \vspace{4ex}
        \IRS@place, den \@date%
        }
    \fi

\end{minipage}%
\if@restonecol\twocolumn\fi%
\newpage%
\ifIRS@twoside%
    \thispagestyle{empty}%
    \mbox{ }\newpage%
\fi }}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Neues Kommando f"ur das Einf"ugen der Erkl"arung
\newcommand{\erklaerung}%
{{%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse
      \fi
\ifIRS@twoside%
\newpage%
\setlength{\IRS@parindenttemp}{\parindent}%
\setlength{\parindent}{0pt}%
\ifIRS@emptyeoc\thispagestyle{empty}\else\relax\fi%
\ifthenelse{\isodd{\value{page}}}{}{\mbox{ }\newpage}%
\thispagestyle{empty}%
%% \addtocounter{page}{-2}%	%% Geaendert, erzeugte falsche Seitenzahlen, Manuel Schwartz 2015.10.13
\else%
\newpage%
\thispagestyle{empty}%
%% \addtocounter{page}{-1}% %% Geaendert, erzeugte falsche Seitenzahlen, Manuel Schwartz 2015.10.13
\fi%
%
\begin{minipage}[t][\textheight][b]{\textwidth}%
\ifIRS@english
    {%
    \begin{singlespace}
    \ifthenelse{\equal{\IRS@secondauthor}{}}{\changefont{phv}{m}{n}{I}}{\changefont{phv}{m}{n}{We}} declare that \ifthenelse{\equal{\IRS@secondauthor}{}}{I wrote my}{we wrote our} \IRS@arbeittypm\  		
    \ifthenelse{\equal{\IRS@secondauthor}{}}{by myself}{by ourselves} and that \ifthenelse{\equal{\IRS@secondauthor}{}}{I}{we} have followed the regulations relating to good scientific practice of the Karlsruhe Institute of Technology (KIT). \ifthenelse{\equal{\IRS@secondauthor}{}}{I}{We} did not use any unacknowledged sources or means and \ifthenelse{\equal{\IRS@secondauthor}{}}{I}{we} marked all references \ifthenelse{\equal{\IRS@secondauthor}{}}{I}{we} used literally or by content.
    \end{singlespace}

    \vspace{4ex}
    \IRS@place, the \@date%
    }
\else
    \ifIRS@french
        {%
        \begin{singlespace}
        \ifthenelse{\equal{\IRS@secondauthor}{}}{Je certifie que j'ai accompli seul}%
        {Nous certifions que nous avons accompli seuls}
        ce travail et que tout \'{e}l\'{e}ment ext\'{e}rieur
        utilis\'{e} est connu de \ifthenelse{\equal{\IRS@secondauthor}{}}{mon}{notre}
        ma\^{\i}tre de stage. Tout \'{e}l\'{e}ment ext\'{e}rieur utilis\'{e} est cit\'{e}.
        \end{singlespace}

        \vspace{4ex}
        \IRS@place, \@date%
        }
    \else
        {%
				%% [MerkerMS01]
        \begin{singlespace}
        \ifthenelse{\equal{\IRS@secondauthor}{}}{\changefont{phv}{m}{n}{Ich versichere}}{\changefont{phv}{m}{n}{Wir versichern}} hiermit, dass \ifthenelse{\equal{\IRS@secondauthor}{}}{ich meine}{wir unsere}\IRS@arbeittypm\ %% [MerkerMS01]
        selbständig und unter Beachtung der Regeln zur Sicherung guter wissenschaftlicher Praxis im Karlsruher Institut für Technologie (KIT) in der aktuellen Fassung 
        angefertigt \ifthenelse{\equal{\IRS@secondauthor}{}}{habe. Ich habe}{haben. Wir haben} keine anderen als die angegebenen Quellen und Hilfsmittel benutzt und wörtlich 
        oder inhaltlich übernommene Stellen als solche kenntlich gemacht.
        \end{singlespace}

        \vspace{4ex}
        \IRS@place, den \@date%
        }
    \fi
\fi

\vspace{10ex}
\ifthenelse{\equal{\IRS@secondauthor}{}}{\@author}{%
\begin{tabular}{@{}p{.5\textwidth}@{}p{.5\textwidth}@{}}
\@author&\IRS@secondauthor%\scriptsize
\end{tabular}}

\end{minipage}%
\if@restonecol\twocolumn\fi%
\newpage%
\ifIRS@twoside%
    \thispagestyle{empty}%
    \mbox{ }\newpage%
\fi }}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Neues Kommando f"ur das Deckblatt der Arbeit (Beschreibung der Arbeit)
\newcommand{\deckblatt}%
{{%
  % englische Bezeichnung f"ur Bearbeiter anpassen, falls 2 Bearbeiter
  \ifIRS@english
    \ifthenelse{\equal{\IRS@textbearbeiter}{Student}}{%
      \ifthenelse{\equal{\IRS@secondauthor}{}}{\relax}{\renewcommand{\IRS@textbearbeiter}{Students}}}{\relax}
  \fi
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \newpage%
  \fontsize{10}{12.2pt}\selectfont%
  \setlength{\IRS@parskiptemp}{\parskip}%
  \setlength{\parskip}{0pt}%
  \setlength{\IRS@parindenttemp}{\parindent}%
  \setlength{\parindent}{0pt}%
  \ifIRS@twoside%
    \ifIRS@emptyeoc\thispagestyle{empty}\else\relax\fi%
    \ifthenelse{\isodd{\value{page}}}{}{\mbox{ }\newpage}%
    \thispagestyle{empty}%
    %% \addtocounter{page}{-2}% %% Geaendert, erzeugte falsche Seitenzahlen, Manuel Schwartz 2015.10.13
  \else%
    \thispagestyle{empty}%
    %% \addtocounter{page}{-1}% %% Geaendert, erzeugte falsche Seitenzahlen, Manuel Schwartz 2015.10.13
  \fi
  \ifthenelse{\equal{\IRS@deckblatttitle}{}}{\renewcommand{\IRS@deckblatttitle}{\@title}}{\relax}%
  %
  \ifIRS@avier %% ÄNDERUNGEN fuer die ab 15.03.2019 nur noch digitalen Arbeiten, Jairo Inga, 2019.02.20 %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    {%
    \ifIRS@dvipdfm
%      \raisebox{-0.6cm}[0.2cm][0pt]{\includegraphics[width=0.92\textwidth]{kitlogo_irs.eps}}
%      \raisebox{-0.6cm}[0.2cm][0pt]{\includegraphics[width=\textwidth]{kitlogo_irs.eps}}
			\raisebox{-1.1cm}[0.2cm][0pt]{\includegraphics[width=\textwidth]{kitlogo_irs.eps}} %% Änderung Jairo Inga 2019.03.05, um Verschiebung durch Unterschriftsbild zu beheben
    \else
%      \raisebox{-0.6cm}[0.2cm][0pt]{\includegraphics[width=0.92\textwidth]{kitlogo_irs}}
%      \raisebox{-0.6cm}[0.2cm][0pt]{\includegraphics[width=\textwidth]{kitlogo_irs}}
		\raisebox{-1.1cm}[0.2cm][0pt]{\includegraphics[width=\textwidth]{kitlogo_irs}}  %% Änderung Jairo Inga 2019.03.05, um Verschiebung durch Unterschriftsbild zu beheben
    \fi
    \vspace*{2.25cm plus 0.7cm minus 0.5cm}
    \begin{center}
      \parbox{\textwidth}{\centering\sffamily\fontsize{14}{16.8pt}\selectfont\bfseries\IRS@arbeittyp{} \IRS@arbeitnummer}\\[0.8cm plus 0.5cm minus 0.4cm]
      \parbox{\textwidth}{\centering\sffamily\fontsize{16}{19.2pt}\selectfont\bfseries\IRS@deckblatttitle}
    \end{center}
    \vspace*{1cm plus 0.5cm minus 0.7cm}
    \setlength{\parskip}{\IRS@parskiptemp}
    \setlength{\parindent}{\IRS@parindenttemp}
    \begin{singlespace}
      {\sffamily\fontsize{12}{14.4pt}\selectfont\IRS@beschreibung\par}
    \end{singlespace}
    \setlength{\parskip}{0pt}
    \setlength{\parindent}{0pt}

    \vspace*{2cm plus 0.5cm minus 1.5cm}
    %{\changefont{phv}{m}{n}{(}\sffamily\fontsize{12}{14.4pt}\selectfont\IRS@hauptreferent\changefont{phv}{m}{n}{)}}	%% [MerkerMS01] %Auskommentiert Jairo Inga, 2019.02.20
    \vfill

    \newlength{\IRS@tempdim}
    \setlength{\IRS@tempdim}{\textwidth}
%    \setlength{\IRS@tempdim}{0.81\textwidth}
    \newsavebox{\IRS@testbox}
    \sbox{\IRS@testbox}{{\sffamily\fontsize{12}{14.4pt}\selectfont\IRS@textausgabetag{} :}}
    \advance\IRS@tempdim-\wd\IRS@testbox
    \advance\IRS@tempdim-\tabcolsep
    \advance\IRS@tempdim-\tabcolsep
    \begin{tabular}[b]{@{}ll@{}}%
      \mbox{\parbox[t]{\wd\IRS@testbox}{\sffamily\fontsize{12}{14.4pt}\selectfont\IRS@textbearbeiter\hfill :}}&%
        \mbox{\parbox[t]{\IRS@tempdim}{\sffamily\fontsize{12}{14.4pt}\selectfont%
          \ifthenelse{\equal{\IRS@authortitle}{}}{}\@author}}\\[0.2cm]%
      \ifthenelse{\equal{\IRS@secondauthor}{}}{}{&%
        \mbox{\parbox[t]{\IRS@tempdim}{\sffamily\fontsize{12}{14.4pt}\selectfont%
          \ifthenelse{\equal{\IRS@secondauthortitle}{}}{}{\IRS@secondauthortitle{} }\IRS@secondauthor}}\\[0.2cm]}%
      \ifthenelse{\equal{\IRS@korreferent}{}}{}{\mbox{\parbox[t]{\wd\IRS@testbox}{\sffamily\fontsize{12}{14.4pt}\selectfont%
          \IRS@textkorreferent\hfill :}}&%
         \mbox{\parbox[t]{\IRS@tempdim}{\sffamily\fontsize{12}{14.4pt}\selectfont\IRS@korreferent}}\\[0.2cm]}%
      \mbox{\parbox[t]{\wd\IRS@testbox}{\sffamily\fontsize{12}{14.4pt}\selectfont\IRS@textbetreuer\hfill :}}&%
         \mbox{\parbox[t]{\IRS@tempdim}{\sffamily\fontsize{12}{14.4pt}\selectfont\IRS@betreuer}}\\[0.2cm]% 
         \mbox{\parbox[t]{\wd\IRS@testbox}{\sffamily\fontsize{12}{14.4pt}\selectfont\IRS@texthauptreferent\hfill  :}}& %Jairo Inga, 2019.02.20
         \mbox{\parbox[t]{\IRS@tempdim}{\sffamily\fontsize{12}{14.4pt}\selectfont\IRS@hauptreferent}}\\[0.2cm] %Jairo Inga, 2019.02.20
         \mbox{\parbox[t]{\wd\IRS@testbox}{\sffamily\fontsize{12}{14.4pt}\selectfont\IRS@textzweitpruefer\hfill :}}&% %Jairo Inga, 2019.03.05
         \mbox{\parbox[t]{\IRS@tempdim}{\sffamily\fontsize{12}{14.4pt}\selectfont\IRS@zweitpruefer}}\\[0.2cm]% %Jairo Inga, 2019.03.05
      \ifthenelse{\equal{\IRS@startdate}{}}{}{\mbox{\parbox[t]{\wd\IRS@testbox}{\sffamily\fontsize{12}{14.4pt}\selectfont\IRS@textausgabetag\hfill :}}&%
				{\sffamily\fontsize{12}{14.4pt}\selectfont\IRS@startdate}\\[0.2cm]}%
					\ifthenelse{\equal{\IRS@defensedate}{}}{}{\mbox{\parbox[t]{\wd\IRS@testbox}{\sffamily\fontsize{12}{14.4pt}\selectfont\IRS@vortragstag\hfill :}}&%
				{\sffamily\fontsize{12}{14.4pt}\selectfont\IRS@defensedate}\\[0.2cm]}%  % Jairo Inga, 2019.02.20
      \ifthenelse{\equal{\@date}{}}{}{\mbox{\parbox[t]{\wd\IRS@testbox}{\sffamily\fontsize{12}{14.4pt}\selectfont\IRS@textabgabetag\hfill :}}&%
				{\sffamily\fontsize{12}{14.4pt}\selectfont\@date}}%
    \end{tabular}%
    
    \vspace*{1cm plus 0.5cm minus 1.5cm}
    %\hline
    %\begin{minipage}[t][\textheight][b]{\textwidth}
\ifIRS@english
    {%
    %\begin{singlespace}
    %\ifthenelse{\equal{\IRS@secondauthor}{}}{\changefont{phv}{m}{n}{I}}{\changefont{phv}{m}{n}{We}} declare that \ifthenelse{\equal{\IRS@secondauthor}{}}{I wrote my}{we wrote our} \IRS@arbeittypm\  		
    %\ifthenelse{\equal{\IRS@secondauthor}{}}{by myself}{by ourselves} and that \ifthenelse{\equal{\IRS@secondauthor}{}}{I}{we} have followed the regulations relating to good scientific practice of the Karlsruhe Institute of Technology (KIT). \ifthenelse{\equal{\IRS@secondauthor}{}}{I}{We} did not use any unacknowledged sources or means and \ifthenelse{\equal{\IRS@secondauthor}{}}{I}{we} marked all references \ifthenelse{\equal{\IRS@secondauthor}{}}{I}{we} used literally or by content.
    %\end{singlespace}

    \vspace{4ex}
    \IRS@place, the \@date%
    }
\else
    \ifIRS@french
        {%
        \begin{singlespace}
        \ifthenelse{\equal{\IRS@secondauthor}{}}{Je certifie que j'ai accompli seul}%
        {Nous certifions que nous avons accompli seuls}
        ce travail et que tout \'{e}l\'{e}ment ext\'{e}rieur
        utilis\'{e} est connu de \ifthenelse{\equal{\IRS@secondauthor}{}}{mon}{notre}
        ma\^{\i}tre de stage. Tout \'{e}l\'{e}ment ext\'{e}rieur utilis\'{e} est cit\'{e}.
        \end{singlespace}

        \vspace{4ex}
        \IRS@place, \@date%
        }
    \else
        {%
				%% [MerkerMS01]
        \begin{singlespace}
      {\sffamily\fontsize{12}{14.4pt}\selectfont
    
        \ifthenelse{\equal{\IRS@secondauthor}{}}{\changefont{phv}{m}{n}{Ich versichere}}{\changefont{phv}{m}{n}{Wir versichern}} hiermit, dass \ifthenelse{\equal{\IRS@secondauthor}{}}{ich meine}{wir unsere}\IRS@arbeittypm\ %% [MerkerMS01]
        selbständig und unter Beachtung der Regeln zur Sicherung guter wissenschaftlicher Praxis im Karlsruher Institut für Technologie (KIT) in der aktuellen Fassung 
        angefertigt \ifthenelse{\equal{\IRS@secondauthor}{}}{habe. Ich habe}{haben. Wir haben} keine anderen als die angegebenen Quellen und Hilfsmittel benutzt und wörtlich 
        oder inhaltlich übernommene Stellen als solche kenntlich gemacht. \par}
        \end{singlespace}

        \vspace{4ex}
        
        {\sffamily\fontsize{12}{14.4pt}\selectfont \IRS@place, den \@date \par}
        }
    \fi
\fi
\raisebox{-1.5cm}[0cm][0pt]{\includegraphics[width=0.2\textwidth]{unterschrift}}

\vspace{10ex}
\ifthenelse{\equal{\IRS@secondauthor}{}}{{\sffamily\fontsize{12}{14.4pt}\selectfont \@author}}{%
\begin{tabular}{@{}p{.5\textwidth}@{}p{.5\textwidth}@{}}
{\sffamily\fontsize{12}{14.4pt}\selectfont \@author}&{\sffamily\fontsize{12}{14.4pt}\selectfont \IRS@secondauthor}%\scriptsize
\end{tabular}}
%\end{minipage}

%\if@restonecol\twocolumn\fi%
%\newpage%
%\ifIRS@twoside%
%    \thispagestyle{empty}%
%    \mbox{ }\newpage%
%\fi 
    }%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ENDE A4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \fi%
  \ifIRS@afuenf%
    {%
    \ifIRS@dvipdfm
      \raisebox{-2mm}[0.2cm][0pt]{\includegraphics[width=\textwidth]{kitlogo_irs.eps}}
    \else
      \raisebox{-2mm}[0.2cm][0pt]{\includegraphics[width=\textwidth]{kitlogo_irs}}
    \fi
    \vspace*{0.6cm plus 0.8cm minus 0.5cm}
    \begin{center}
      \parbox{\textwidth}{\centering\sffamily\fontsize{10}{12pt}\selectfont\bfseries\IRS@arbeittyp{} \IRS@arbeitnummer}\\[0.6cm plus 0.3cm minus 0.3cm]
      \parbox{\textwidth}{\centering\sffamily\fontsize{11}{13.2pt}\selectfont\bfseries\IRS@deckblatttitle}
    \end{center}
    \vspace*{0.4cm plus 0.6cm minus 0.3cm}
    \setlength{\parskip}{\IRS@parskiptemp}
    \setlength{\parindent}{\IRS@parindenttemp}
    \begin{singlespace}
      {\sffamily\fontsize{9}{10.8pt}\selectfont\IRS@beschreibung}
    \end{singlespace}
    \setlength{\parskip}{0pt}
    \setlength{\parindent}{0pt}
    \vspace*{1.2cm plus 0.3cm minus 0.8cm}
    {\changefont{phv}{m}{n}{(}\sffamily\fontsize{9}{10.8pt}\selectfont\IRS@hauptreferent\changefont{phv}{m}{n}{)}} 	%% [MerkerMS01]
    \vfill

    \newlength{\IRS@tempdim}
    \setlength{\IRS@tempdim}{\textwidth}
%    \setlength{\IRS@tempdim}{0.81\textwidth}
    \newsavebox{\IRS@testbox}
    \sbox{\IRS@testbox}{{\sffamily\fontsize{9}{10.8pt}\selectfont\IRS@textausgabetag{} :}}
    \advance\IRS@tempdim-\wd\IRS@testbox
    \advance\IRS@tempdim-\tabcolsep
    \advance\IRS@tempdim-\tabcolsep
%    \parbox[b][][b]{0.81\textwidth}{%
    \begin{tabular}[b]{@{}ll@{}}%
      \mbox{\parbox[t]{\wd\IRS@testbox}{\sffamily\fontsize{9}{10.8pt}\selectfont\IRS@textbearbeiter\hfill :}}&%
        \mbox{\parbox[t]{\IRS@tempdim}{\sffamily\fontsize{9}{10.8pt}\selectfont%
          \ifthenelse{\equal{\IRS@authortitle}{}}{}\@author}}\\%
      \ifthenelse{\equal{\IRS@secondauthor}{}}{}{&%
        \mbox{\parbox[t]{\IRS@tempdim}{\sffamily\fontsize{9}{10.8pt}\selectfont%
          \ifthenelse{\equal{\IRS@secondauthortitle}{}}{}{\IRS@secondauthortitle{} }\IRS@secondauthor}}\\}%
      \ifthenelse{\equal{\IRS@korreferent}{}}{}{\mbox{\parbox[t]{\wd\IRS@testbox}{\sffamily\fontsize{9}{10.8pt}\selectfont%
          \IRS@textkorreferent\hfill :}}&%
        \mbox{\parbox[t]{\IRS@tempdim}{\sffamily\fontsize{9}{10.8pt}\selectfont\IRS@korreferent}}\\}%
      \mbox{\parbox[t]{\wd\IRS@testbox}{\sffamily\fontsize{9}{10.8pt}\selectfont\IRS@textbetreuer\hfill :}}&%
        \mbox{\parbox[t]{\IRS@tempdim}{\sffamily\fontsize{9}{10.8pt}\selectfont\IRS@betreuer}}\\%
      \ifthenelse{\equal{\IRS@startdate}{}}{}{\mbox{\parbox[t]{\wd\IRS@testbox}{\sffamily\fontsize{9}{10.8pt}\selectfont\IRS@textausgabetag\hfill :}}&%
        {\sffamily\fontsize{9}{10.8pt}\selectfont\IRS@startdate}\\}%
      \ifthenelse{\equal{\@date}{}}{}{\mbox{\parbox[t]{\wd\IRS@testbox}{\sffamily\fontsize{9}{10.8pt}\selectfont\IRS@textabgabetag\hfill :}}&%
        {\sffamily\fontsize{9}{10.8pt}\selectfont\@date}}%
    \end{tabular}%
    }%
  \fi%
  \ifIRS@booksize%
    {%
    \ifIRS@dvipdfm
      \raisebox{-4mm}[0.2cm][0pt]{\includegraphics[width=\textwidth]{kitlogo_irs.eps}}
    \else
      \raisebox{-4mm}[0.2cm][0pt]{\includegraphics[width=\textwidth]{kitlogo_irs}}
    \fi
    \vspace*{0.5cm plus 0.4cm minus 0.3cm}
    \begin{center}
      \parbox{\textwidth}{\centering\sffamily\fontsize{12}{14.4pt}\selectfont\bfseries\IRS@arbeittyp{} \IRS@arbeitnummer}\\[0.6cm plus 0.3cm minus 0.3cm]
      \parbox{\textwidth}{\centering\sffamily\fontsize{14}{16.6pt}\selectfont\bfseries\IRS@deckblatttitle}
    \end{center}
    \vspace*{0.4cm plus 0.6cm minus 0.3cm}
    \setlength{\parskip}{\IRS@parskiptemp}
    \setlength{\parindent}{\IRS@parindenttemp}
    \begin{singlespace}
      {\sffamily\fontsize{10}{12pt}\selectfont\IRS@beschreibung}
    \end{singlespace}
    \setlength{\parskip}{0pt}
    \setlength{\parindent}{0pt}
    \vspace*{1.4cm plus 0.3cm minus 0.8cm}
    {\changefont{phv}{m}{n}{(}\sffamily\fontsize{10}{12pt}\selectfont\IRS@hauptreferent\changefont{phv}{m}{n}{)}}	%% [MerkerMS01]
    \vfill

    \newlength{\IRS@tempdim}
    \setlength{\IRS@tempdim}{\textwidth}
%    \setlength{\IRS@tempdim}{0.81\textwidth}
    \newsavebox{\IRS@testbox}
    \sbox{\IRS@testbox}{{\sffamily\fontsize{10}{12pt}\selectfont\IRS@textausgabetag{} :}}
    \advance\IRS@tempdim-\wd\IRS@testbox
    \advance\IRS@tempdim-\tabcolsep
    \advance\IRS@tempdim-\tabcolsep
%    \parbox[b][][b]{0.81\textwidth}{%
    \begin{tabular}[b]{@{}ll@{}}%
      \mbox{\parbox[t]{\wd\IRS@testbox}{\sffamily\fontsize{10}{12pt}\selectfont\IRS@textbearbeiter\hfill :}}&%
        \mbox{\parbox[t]{\IRS@tempdim}{\sffamily\fontsize{10}{12pt}\selectfont%
          \ifthenelse{\equal{\IRS@authortitle}{}}{}\@author}}\\%
      \ifthenelse{\equal{\IRS@secondauthor}{}}{}{&%
        \mbox{\parbox[t]{\IRS@tempdim}{\sffamily\fontsize{10}{12pt}\selectfont%
          \ifthenelse{\equal{\IRS@secondauthortitle}{}}{}{\IRS@secondauthortitle{} }\IRS@secondauthor}}\\}%
      \ifthenelse{\equal{\IRS@korreferent}{}}{}{\mbox{\parbox[t]{\wd\IRS@testbox}{\sffamily\fontsize{10}{12pt}\selectfont%
          \IRS@textkorreferent\hfill :}}&%
        \mbox{\parbox[t]{\IRS@tempdim}{\sffamily\fontsize{10}{12pt}\selectfont\IRS@korreferent}}\\}%
      \mbox{\parbox[t]{\wd\IRS@testbox}{\sffamily\fontsize{10}{12pt}\selectfont\IRS@textbetreuer\hfill :}}&%
        \mbox{\parbox[t]{\IRS@tempdim}{\sffamily\fontsize{10}{12pt}\selectfont\IRS@betreuer}}\\%
      \ifthenelse{\equal{\IRS@startdate}{}}{}{\mbox{\parbox[t]{\wd\IRS@testbox}{\sffamily\fontsize{10}{12pt}\selectfont\IRS@textausgabetag\hfill :}}&%
        {\sffamily\fontsize{10}{12pt}\selectfont\IRS@startdate}\\}%
      \ifthenelse{\equal{\@date}{}}{}{\mbox{\parbox[t]{\wd\IRS@testbox}{\sffamily\fontsize{10}{12pt}\selectfont\IRS@textabgabetag\hfill :}}&%
        {\sffamily\fontsize{10}{12pt}\selectfont\@date}}%
    \end{tabular}%
    }%
  \fi%
  %
  \if@restonecol\twocolumn\fi%
  \newpage%
  \ifIRS@twoside%
    \thispagestyle{empty}%
    \mbox{ }\newpage%
  \fi%
}}



% spezielle deutsche Anpassungen...
\def\captionsgerman{%	
  \def\prefacename{Vorwort}%
  \def\refname{Literatur}%
  \def\abstractname{Kurzfassung}%
  \def\bibname{Literatur}% "Literatur"? - original: "Literaturverzeichnis"
  \def\chaptername{Kapitel}%
  \def\appendixname{Anhang}%
  \def\contentsname{Inhaltsverzeichnis}% "Inhalt"? - original: "Inhaltsverzeichnis"
  \def\listfigurename{Abbildungen}% "Abbildungen"? - original: "Abbildungsverzeichnis"
  \def\listtablename{Tabellen}% "Tabellen"? - original: "Tabellenverzeichnis"
  \def\indexname{Index}%
  \def\figurename{Abbildung}%
  \def\tablename{Tabelle}%  % oder: Tafel
  \def\partname{Teil}%
  \def\enclname{Anlage(n)}% % oder: Beilage(n)
  \def\ccname{Verteiler}%   % oder: Kopien an
  \def\headtoname{An}%
  \def\pagename{Seite}%
  \def\seename{siehe}%
  \def\alsoname{siehe auch}}
\let\captionsngerman=\captionsgerman
  %
%\ifIRS@english
%  \arbeittyp{\changefont{phv}{m}{n}{Masters thesis}}%
%  \textausgabetag{\changefont{phv}{m}{n}{Date of hand out}}%
%  \textvortragstag{\changefont{phv}{m}{n}{Defense date}}%
%  \textabgabetag{\changefont{phv}{m}{n}{Date of hand in}}%
%  \textbetreuer{\changefont{phv}{m}{n}{Supervisor}}%
%  \texthauptreferent{\changefont{phv}{m}{n}{Examiner}}% %Jairo Inga, 2019.03.05
%  \textzweitpruefer{\changefont{phv}{m}{n}{Second examiner}}% %Jairo Inga, 2019.03.05
%  \textbearbeiter{\changefont{phv}{m}{n}{Student}}%
%  \textkorreferent{\changefont{phv}{m}{n}{Co-Referee}}%
%\fi
%\ifIRS@french
%  \arbeittyp{M\'{e}moire de fin d'\'{e}tudes}%
%  \textausgabetag{Choix du sujet}%
%  \textabgabetag{Remise du sujet}%
%  \textbetreuer{Responsable du stage}%
%  \textbearbeiter{Etudiant}%
%  \textkorreferent{Co-rapporteur}%
%\fi


%% Alte LateX Syntax, wird mit dem aktuellen MikteX nicht mehr richtig unterstuetzt, Manuel Schwartz 2015.10.13
%% Ganzer Abschnitt auskommentiert und durch \package{lmodern} in der preamble ersetzt

%\long\def\@makecaption#1#2{%			
  %\vskip\abovecaptionskip
  %\sbox\@tempboxa{{\IRS@captionfont{\IRS@captionfont\IRS@captionwordfont #1:} #2}}%
  %\ifdim \wd\@tempboxa >\hsize
    %{\IRS@captionfont{\IRS@captionfont\IRS@captionwordfont #1:} #2}\par
  %\else
    %\global \@minipagefalse
    %\hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  %\fi
  %\vskip\belowcaptionskip}
%%

\AtBeginDocument{%
  \ifIRS@dvipdfm
    \ifIRS@loadexscale
      \@ifpackageloaded{amsmath}{%
        \ClassWarningNoLine{irsdiplom}{ensure that amsmath is loaded with option 'cmex10'.\MessageBreak Otherwise you might run into trouble\MessageBreak with some characters (e.g. some brackets) ..}
      }
    \fi
  \fi
  \ifIRS@dvipdfm
    \ifIRS@loadexscale
      \@ifpackageloaded{exscale}{%
        \ClassError{irsdiplom}{DO NOT use package 'exscale'}{JUST DON'T. There is no need to do so (as it is already in use) and you'll run deeply into trouble ...}
      }
    \fi
  \fi
  \@ifpackageloaded{float}{%
    \typeout{class irsdiplom: package 'float' detected.}%
    \renewcommand*{\listof}[2]{%
      \@ifundefined{ext@#1}{\float@error{#1}}{%
        \@namedef{l@#1}{\@dottedtocline{1}{1.5em}{2.3em}}%
        \chapter*{#2}
        \addcontentsline{toc}{chapter}{#2}%
        \@mkboth{#2}%
                {#2}%
        \begingroup\setlength{\parskip}{\z@}%
          \begin{singlespace}%
          \@starttoc{\@nameuse{ext@#1}}%
          \end{singlespace}%
        \endgroup}}}{}%
\@ifundefined{captionfont}{\newcommand{\captionfont}[1]{\renewcommand{\IRS@captionfont}{#1}}}{\relax}%
%
%
\ifIRS@hyperref
\ifthenelse{\equal{\IRS@secondauthor}{}}{\def\IRS@pdfauthor{\@author}}{\def\IRS@pdfauthor{\@author{}, \IRS@secondauthor}}
\ifIRS@english
  \def\IRS@pdfsubject{\IRS@arbeittyp{} \IRS@arbeitnummer{} at the Control Systems Laboratory (IRS), Universit"at Karlsruhe (TH)}
\else
  \def\IRS@pdfsubject{\IRS@arbeittyp{} \IRS@arbeitnummer{} am Institut f"ur Regelungs- und Steuerungssysteme, Universit"at Karlsruhe (TH)}
\fi
%
\hypersetup{%
  pdftitle={\@title}, % Titel der Diplomarbeit
  pdfsubject={\IRS@pdfsubject},
  pdfauthor={\IRS@pdfauthor},
  pdfkeywords={\IRS@keywords},
  %% pdfstartview=FitH, %% Auskommentiert, Manuel Schwartz 2015.10.13 (Warning: Option 'pdfstartview' has already been used, setting this option has no effect on input line 71
  %% pdfpagemode={UseOutlines},% None, FullScreen, UseOutlines %% Auskommentiert, Manuel Schwartz 2015.10.13 (selbe wie oben)
  bookmarksnumbered=true
  }
\fi%
%
\ifIRS@croppage%
      {{
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse
      \fi
      \ifIRS@twoside%
            \newpage%
            \setlength{\IRS@parindenttemp}{\parindent}%
            \setlength{\parindent}{0pt}%
            \thispagestyle{empty}%
            %% \addtocounter{page}{-2}%	%% Geaendert, erzeugte falsche Seitenzahlen, Manuel Schwartz 2015.10.13
      \else%
            \newpage%
            \thispagestyle{empty}%
            %% \addtocounter{page}{-1}% %% Geaendert, erzeugte falsche Seitenzahlen, Manuel Schwartz 2015.10.13
      \fi%
      \sffamily
      \ifIRS@dvipdfm
        \includegraphics[width=\textwidth]{unilogo_forschungsuni_fakultaet.eps}
      \else
        \includegraphics[width=\textwidth]{unilogo_forschungsuni_fakultaet}
      \fi

      \vspace*{1cm}
      \begin{center}
      {\fontsize{20}{25pt}\selectfont\bfseries Dieses Deckblatt dient\\[0.5cm] lediglich als Schnittvorlage}
      \end{center}

      \vspace*{1cm}
      \fontsize{16}{17.6pt}\selectfont
      {\bfseries Druckerprofil: \ifthenelse{\equal{\IRS@printername}{}}{\textless keines\textgreater}%
      {\IRS@printername}}\\[-0.3cm]

      {\bfseries Ausdruck: \ifIRS@twoside doppelseitig\else einseitig\fi}\\[-0.3cm]

      {\bfseries Beim Ausdruck darauf achten, dass als Vergr"o"serungsfaktor 100\% eingestellt ist!}

      \vspace*{1cm}
      \fontsize{12}{13.2pt}\selectfont
      {\bfseries \IRS@arbeittyp{} \IRS@arbeitnummer}
      \begin{description}
            \item[\sffamily Autor(en):]\@author\ifthenelse{\equal{\IRS@secondauthor}{}}{}{, \IRS@secondauthor}
            \item[\sffamily Titel:]\@title
      \end{description}

      \vfill
      \ifIRS@dvipdfm
        \includegraphics[width=\textwidth]{irslogo_irs_institutsleiter.eps}
      \else
        \includegraphics[width=\textwidth]{irslogo_irs_institutsleiter}
      \fi
      \if@restonecol\twocolumn\fi%
      \newpage%
      \ifIRS@twoside%
            \thispagestyle{empty}%
            \mbox{ }\newpage%
      \fi
      }}
      \crop[off]
\fi
}

\endinput
