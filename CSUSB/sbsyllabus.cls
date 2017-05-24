%
% sbsyllabus.cls v.1.0
%
% CSU San Bernardino ADA Syllabus LaTex Class
%
% Writen by:
%    Keith Evan Schubert, Ph.D., E.I.T.
%    December 15, 2011
% Contents:
%    Basic layout, schedule, campus compliance statements
%
% Modified by:

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sbsyllabus}[2010/01/27 CSUSB ADA Syllabus Class]
\RequirePackage{ifthen}
\RequirePackage{suffix}
%\RequirePackage{couriers}
\RequirePackage[largesmallcaps,nofligatures]{kpfonts}
\renewcommand*\familydefault{\sfdefault}
%\RequirePackage{sectsty}
%\allsectionsfont{\textothersc}
\RequirePackage[letterpaper]{geometry}
\RequirePackage{fancyhdr}
%\RequirePackage{tocloft}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}
\typeout{*********************************************************************}
\typeout{** California State University, San Bernardino ADA Syllabus Class  **}
\typeout{** Written by Keith Evan Schubert                                  **}
\typeout{**            Professor                                            **}
\typeout{**            School of Computer Science and Engineering           **}
\typeout{*********************************************************************}
\renewcommand{\normalsize}{\fontsize{12pt}{12pt}\selectfont}
\geometry{paperwidth=8.5in,paperheight=11in,includehead=false,top=1in,left=1in,right=1in,bottom=1in,footskip=0in}%,showframe}
\pagestyle{empty}
%\markboth{}{}%clear the old headers that comes from article
%\fancypagestyle{plain}{\fancyhf{}\fancyfoot[c]{Page \thepage}}%reset plain
%\fancyhf{}\fancyhead{}\fancyfoot{}%clear fields
%\lhead[]{}\lfoot[]{}
%\chead[]{}\cfoot[\thepage]{\thepage}
%\rhead[]{}\rfoot[]{}
%
%
%
%               Declaring Variables
%
\gdef\@university{California State University, San Bernardino}
\gdef\@college{College of Natural Sciences}
\gdef\@department{School of Computer Science and Engineering}
\gdef\@instructor{Keith Evan Schubert}
\gdef\@office{Jack Brown Hall - Room 348}
\gdef\@telephone{(909)537-5328}
\gdef\@email{schubert@csusb.edu}
\newcommand{\University}[1][California State University, San Bernardino]{\gdef\@university{#1}}
\newcommand{\College}[1][College of Natural Sciences]{\gdef\@college{#1}}
\newcommand{\Department}[1][School of Computer Science and Engineering]{\gdef\@department{#1}}
\newcommand{\Course}[1]{\gdef\@course{#1}}
\newcommand{\Quarter}[1]{\gdef\@quarter{#1}}
\newcommand{\Year}[1]{\gdef\@year{#1}}
\newcommand{\Instructor}[1][Keith Evan Schubert]{\gdef\@instructor{#1}}
\newcommand{\OfficeLocation}[1][Jack Brown Hall - Room 348]{\gdef\@office{#1}}
\newcommand{\Telephone}[1][(909)537-5328]{\gdef\@telephone{#1}}
\newcommand{\EmailAddress}[1][schubert@csusb.edu]{\gdef\@email{#1}}
\newcommand{\OfficeHours}[1]{\gdef\@officehours{#1}}
\newcommand{\Textbook}[1]{\gdef\@textbook{#1}}
\newcommand{\Prereqs}[1]{\gdef\@prereqs{#1}}
\newcommand{\ClassTimes}[1]{\gdef\@classtimes{#1}}
\newcommand{\ClassRoom}[1]{\gdef\@classroom{#1}}
\newcommand{\LabTimes}[1]{\gdef\@labtimes{#1}}
\newcommand{\LabRoom}[1]{\gdef\@labroom{#1}}
\gdef\@campuspolicies{\section{University Policies}
     \subsection{Plagiarism and Cheating}
     Students are expected to be familiar with the University's  Policy on cheating and Plagiarism. Please review
     this at (CSUSB Bulletin, pages 54-55).  Instances of academic dishonesty will not be tolerated. Cheating on
     exams or plagiarism (presenting the work of another as your own, or the use of another person's ideas without
     giving proper credit) will result in a failing grade and sanctions by the University. For this class, all
     assignments are to be completed by the individual student unless otherwise specified.
     \subsection{Classroom Protocol}
     I expect you to be mature about your education and courteous to others.  This means several things, such as, 
     \begin{enumerate}
     \item being an active participant in class; 
     \item showing up on time each day ready for class
     \item if you can't make it, you should make provisions to get notes and such so you learn;
     \item being respectful of others;  
     \item not using cell phones or web surfing - if you don't want to be here, then don't sign up for class;
     \item leaving class quietly to take an important call or go to an essential meeting, so as not to disturb
     others.
     \end{enumerate}
     \subsection{Dropping and Adding}
     You are responsible for understanding the policies and procedures about add/drops, academic renewal, etc. found
     at (CSUSB Bulletin, pages 48-50).}
\newcommand{\CampusPolicies}[1]{\gdef\@campuspolicies{#1}}
\gdef\@adastatement{\section{Support for Students with Disabilities}
     If you are in need of an accommodation for a disability in order to participate in this class, please contact
     Services to Students with Disabilities at (909)537-5238.  You are advised to establish a buddy system and 
     alternate in the class if you require assistance in the event of an emergency. Individuals with disabilities 
     should prepare for an emergency ahead of time by instructing a classmate and the instructor.}
\newcommand{\ADAStatement}[1]{\gdef\@adastatement{#1}}
\date{}
%
%              Syllabus
%
\newcommand{\MakeSyllabus}{
%\title{\@university\\\@college\\\@department\\\@course\\\@quarter \@year}
\title{\@university\\\@course\\\@quarter \@year}
\author{\@instructor}
\maketitle\thispagestyle{empty}
\section{Course and Instructor Information}
\noindent{Instructor: \@instructor\par}
\noindent{Office location: \@office\par}
\noindent{Telephone: \@telephone\par}
\noindent{Email: \@email\par}
\noindent{Office Hours: \@officehours\par}
\noindent{Class Days/Time: \@classtimes\par}
\noindent{Classroom: \@classroom\par}
\noindent{Lab Days/Time: \@labtimes\par}
\noindent{Labroom: \@labroom\par}
\noindent{Textbook: \@textbook\par}
\noindent{Prerequisites: \@prereqs\par}
}
%
% schedule
%
\newenvironment{Schedule}{\section{Schedule}
 \begin{tabbing}
 \=Datexx \= Topicxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx \= Readxxxx \= Hom \= eworkxxxx \= Lab \= x \kill
 \rule[-2pt]{473pt}{0.3pt}\> Date \> Topic                                 \> Read \> Homework \> \> Lab \\
}{
 \end{tabbing}
}
%\Class{date}{topic}{read}{hw}{lab}
\newcommand{\Class}[5]{\>{#1}\>{#2}\>{#3}\>\>{#4}\>{#5}\\}
\newcommand{\Classu}[5]{\rule[-2pt]{473pt}{0.3pt}\>{#1}\>{#2}\>{#3}\>\>{#4}\>{#5}\\}
%
% schedule no HW
%
\newenvironment{ScheduleNoHW}{\section{Schedule}
 \begin{tabbing}
 \=Datexx \= Topicxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx \= Readxxxx \= Lab \= x \kill
 \rule[-2pt]{473pt}{0.3pt}\> Date \> Topic                                 \> Read \> Lab \\
}{
 \end{tabbing}
}
%\ClassNoHW{date}{topic}{read}{lab}
\newcommand{\ClassNoHW}[4]{\>{#1}\>{#2}\>{#3}\>\>{#4}\\}
\newcommand{\ClassNoHWu}[4]{\rule[-2pt]{473pt}{0.3pt}\>{#1}\>{#2}\>{#3}\>\>{#4}\\}
%
% schedule Design
%
\newenvironment{ScheduleDesign}{\section{Schedule}
 \begin{tabbing}
 \=Datexx \= Topicxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx \= Readxxxx \= x \kill
 \rule[-2pt]{473pt}{0.3pt}\> Date \> Topic                                 \> Read \\
}{
 \end{tabbing}
}
%\ClassDesign{date}{topic}{read}
\newcommand{\ClassDesign}[3]{\>{#1}\>{#2}\>{#3}\>\\}
\newcommand{\ClassDesignu}[3]{\rule[-2pt]{473pt}{0.3pt}\>{#1}\>{#2}\>{#3}\>\\}
%
%             Grading Policies
%
\newcommand{\Grading}{\section{Grading}
{All assignments will be submitted in the course Moodle, by the time specified unless previously
arranged with the instructor.  The grading percentages and policies of each graded area are
listed in their sections below.\par}
{The grading scheme is as follows.\par}
{Leter     Score Range\par}
{  A       94  - 100\par}
{  A-  90 - 94\par}
{  B+  87 - 90\par}
{  B   83 - 87\par}
{  B-  80 - 83\par}
{  C+  77 - 80\par}
{  C   73 - 77\par}
{  C-  70 - 73\par}
{  D+  67 - 70\par}
{  D   63 - 67\par}
{  D-  60 - 63\par}
{  F   00 - 60\par}
{All grades will be available on the course Moodle.\par}
{I do not curve grades, but I do give unlimited extra credit.  Extra credit for tests takes the form of
writing tutorials that I will post on the website for other students to benefit.  You must write
the tutorial on an area you lost points on.  You must write the tutorial yourself, do not copy it
from the web.  I get really annoyed when students copy tutorials from others.  I always find it,
don't try.  Writing a tutorial teaches you to do the work.  All who have done them have remarked
how much they learned.  Don't cheat yourself of a valuable learning experience, while risking
expulsion for cheating.  For the final, one and only one tutorial may be submitted in advance.\par}
{You may earn extra credit for homework by attending school seminars, attending relevant conferences,
and participating in school outreach activities, like the open house.\par}
{Labs that are submitted on time can be fixed and re-graded, so no extra credit is needed.\par}}
%
%           reading
%
\newcommand{\Reading}{\section{Reading}
You are to read it in advance for each class (except the first, which would not be possible).
The reading assignments listed cover the material that will be discussed in class, but in a
different way, and with a different emphasis.  I would be wasting your time and insulting
you if I did not add material, as I would be implying you are unwilling or incapable of
reading and understanding.  There are two main reasons for reading the material ahead of time.
\begin{enumerate}
    \item Reading the text before class gives you the basic ideas, so the deeper truths and
    broader implications can be covered in class.
    \item Even the best of textbooks will cause most people to get confused on some aspects.
    If you read the book before the class, your can ask questions and your confusion will get
    cleared up.  Reading will make the course easier for you.
\end{enumerate}
I know that reading before class is not frequently done, but I encourage you to do it.  You
are here to get a top quality education, but in order to get it you must do more than just show up.}
%
%           Homework
%
\newcommand{\Homework}[2]{\section{Homework ({#1}\%)}
{Homework has been implemented as quizzes in the course Moodle.
You may take them in whenever you feel like and in a piecemeal fashion, just be careful of the closing date
(see the Moodle calendar or main page, note since it is due by {#2} it will look like the next day on the calendar).
You will get immediate feedback on the correctness of each answer when you submit the homework, which should help
you to learn as you go.  In a few cases, extended answers, such as proofs, are required, which will require me to
grade them and thus cannot be verified immediately.  These proofs must be organized, and show all the steps and be
done in \LaTeX\footnote{\LaTeX is a free document formatter, available on all platforms, that does a great job
with both math and computer code, and thus will actually make your life easier.  It comes with standard Linux and
Unix installs, but for those who use other platforms, I have put links on my webpage (look for the Tex link on my
main page) to where you can download it for your home computer.}  For extended answer problems, how you get the
answer is as important (if not more important) than what the answer is.    For extended answer problems, cut and
paste your \LaTeX code into the text box, and I will grade it asap.  Please make sure your \LaTeX code works
before cutting and pasting.\par}
{Homework is due by {#2} on the due date, so you should consider it due the day before it says.  Be very careful
of this, as it might be confusing.  You have been warned so please don't try and use this as an excuse.  Late
homework will be not accepted, the Moodle will promptly close the quizzes.  Your clock might differ, so please
try to be in safely under the deadline.  You can save your work without submitting, which allows you to divide up
when you do your problems, but if in the end you don't click submit it won't be graded and you will get a zero.
Please carefully watch the due date and time, as Moodle will automatically stop the quiz when time runs out. After
I set it, I do not control it, it is automatic.  If you don't submit the quiz in time you will get a zero.  Please
do not risk this by waiting till the last second.\par}
{Students are encouraged to discuss class material, \emph{but the work must be done individually}.  The homework
and all other graded work should reflect the effort of the individual who receives credit for it.  Cheating will
not be tolerated. The student may never copy other student's work, nor allow others to copy one's own work. If two
assignments look excessively similar, and are not narrow enough to justify the similarity, automatically a grade of
zero results, with the likely referral to appropriate university bodies. According to the current CSUSB Bulletin,
the offending student may receive penalties up to and including expulsion. Again, students are allowed and encouraged
to discuss the material related to assignments, but when it comes to actually doing the assignment work it is to be
done individually.\par}}
%
%                lab
%
\newcommand{\Lab}[1]{\section{Lab ({#1}\%)}
The lab is an essential aspect in really understanding the material.  All lab files must be zipped into a single
file and uploaded to the class Moodle by the end of day on the Monday following the lab.  If you submit your lab
on time, you may re-submit a fixed lab for a re-grade.  If you do not submit a completed lab on time, you
will get a 0 and cannot re-submit the lab for a re-grade.  Stay on top of your labs!\par
}
%
%                adv lab
%
\newcommand{\LabAdv}[1]{\section{Lab ({#1}\%)}
The lab is an essential aspect in really understanding the material.  Each day in class we will do labs that will
be integrated into the lesson.  You will then pick one of these labs every two weeks to write-up, thus you will each
write five labs.  You will only receive credit for your write-up and you and your lab partner may not do write-ups 
on the same lab. To ensure this, your write-up will have your name first, your partner's name second, and the lab 
topic as the title.  If you both submit the same topic, neither gets any credit.  All lab files must be written in 
\LaTeX and compiled to a pdf then uploaded to the class Moodle.  You may re-submit a fixed lab for a re-grade, so the
earlier you submit, the more time you have to fix them.  Stay on top of your labs!\par
Labs should have:
\begin{enumerate}
\item an introduction that explains the purpose, theory, and materials needed;
\item an experimental plan that describes what to do and how to do it;  
\item an analysis section, which includes the data and your analysis;
\item a conclusion, which pulls it all together and draws out the implications.
\end{enumerate}
I am not forcing a particular format, because I am treating this as an engineering report.  You are trying to explain 
clearly what was done, why, and the importance.  Graphs and diagrams are highly encouraged.  A template is provided 
online, but you are welcome to use your own.\par
}
%
%                midterm
%
\newcommand{\Midterm}[1]{\section{Midterm ({#1}\%)}
The midterm is closed book, but I allow $2$ pages of $8.5\times 11$ front and back of notes in the midterm.  You should
bring paper to write on and a pen or pencil.  You cannot use a calculator.  No electronic device of any type is
permitted in the midterm, use of one in any way will result in a 0 for the exam.  Cell phones should be off and
stored.\par
}
%
%                final
%
\newcommand{\Final}[2]{\section{Final ({#1}\%)}
The final is closed book, but I allow $4$ pages of $8.5\times 11$ front and back of notes in the final.  You should
bring paper to write on and a pen or pencil.  You cannot use a calculator.  No electronic device of any type is
permitted in the final, use of one in any way will result in a 0 for the exam.  Cell phones should be off and
stored.  The final is\par
\indent\textbf{{#2}}\par
}
%
%   Legalese
%
\newcommand{\Legalese}{
\section{Getting Help}
{Everything always seems easier in class.  The goal of this course is to learn the material, not to frustrate or
confuse you.  You will not know what is hard or confusing until you try though.  When you hit that problem that
you can't figure out, don't get frustrated, get help.  You are highly encouraged to take advantage of office
hours.  Office hours are the premiere assistance methodology of this class.  You are also encouraged to discuss
problems and methods with each other.  Study groups can be very helpful.  Do not cheat yourself though by getting
solutions and not understanding!  All work must be your own.  You can discuss and help, but may not copy someone
else's work, or allow your work to be copied.  That is plagiarism and is treated very severely.\par}
{The class website also has my notes, some basic computer practice drills that check themselves if you need to
refresh these topics, student tutorials, and links to other resources.  You are encouraged to avail yourself
of the help these provides.\par}
\@campuspolicies\@adastatement
\section{Time}
{The dean's initiative for student studying is called 25-35, which means 25 hours of study per week for a 3 course
schedule or 35 hours for a 4 course schedule.  I expect about 8-9 hours a week outside class time from students.
These are expected averages, you should expect to have this commitment, though it may vary by the ease with which
you pick up the material.\par}
\section{Other Information}
{The student is responsible for all material covered in the readings, class, labs, and also for all announcements
made therein.  \textbf{The topics and dates in this syllabus are tentative}, for instance in the fall at CSUSB
fires and wind sometimes close the campus.  I might need to cut a topic or move things around should we face
unpleasant weather or other unforeseeable conditions.  All changes will be discussed with the class.\par}
{My personal website, r2labs.org, which has my notes and helps for students is not required for the course, it is
solely there for your help. The university will not provide technical support for resources available on r2labs.org.
The university does not endorse any products which may be advertised through r2labs.org.\par}}

