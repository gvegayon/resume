// George G. Vega Yon - Curriculum Vitae
// Built with Typst (migrated from LaTeX)

#let name = "George G. Vega Yon, Ph.D."
#let footerlink = "https://ggvy.cl"

// Page setup
#set page(
  paper: "us-letter",
  margin: 1in,
  header: context {
    if counter(page).get().first() > 1 [
      #image("fig/ukfaculty.png", width: 1cm)
      #v(-0.75cm)
      #h(1.1cm)
      #emph[#name]
      #h(1fr)
      #counter(page).display()
    ]
  },
)

// Document metadata
#set document(
  title: name + ": Curriculum Vitae",
  author: name,
  keywords: ("statistics", "mathematics", "statistical computing", "data science", "machine learning"),
)

// Typography
#set text(font: "Open Sans", size: 10pt)
#set par(leading: 0.9em)
#show link: set text(fill: teal)

// Section headings
#show heading.where(level: 1): it => {
  v(0.5cm)
  text(size: 16pt)[#it.body]
  v(0.2cm)
  line(length: 100%, stroke: 0.5pt)
  v(0.2cm)
}

// Bold text in teal
#show strong: set text(fill: teal)

// Title
#align(right)[#image("fig/ukfaculty.png", width: 40%)]
#v(-6cm)
#text(size: 24pt, fill: gray.darken(40%))[*#name*]

#v(1cm)

#grid(
  columns: (20%, 80%),
  row-gutter: 8pt,
  [Mobile], [+1 (six two six) 381 8171],
  [e-mail], [#link("mailto:g.vegayon@gmail.com")[`g.vegayon@gmail.com`]],
  [website], [#link("https://ggvy.cl")[`ggvy.cl`]],
  [Code], [#link("https://github.com/gvegayon")[`github.com/gvegayon`]],
  [Linkedin], [#link("https://www.linkedin.com/in/georgevegayon/")[`www.linkedin.com/in/georgevegayon/`]],
  [ORCID], [#link("https://orcid.org/0000-0002-3171-0844")[`orcid.org/0000-0002-3171-0844`]],
)

= Education

*Ph.D. in Biostatistics (with a concentration in Statistical Computing)* #h(1fr) 2020 \
University of Southern California, USA. \
Dissertation title: \
#h(0.5cm) _"Essays on Bioinformatics and Social Network Analysis:_ \
#h(0.75cm) _Statistical and Computational Methods for Complex Systems."_

#v(0.5cm)

*M.Sc. in Social Sciences (with a concentration in Economics)* #h(1fr) 2016 \
California Institute of Technology, USA.

#v(0.5cm)

*Master in Economics and Public Policy* #h(1fr) 2011 \
Universidad Adolfo Ibáñez, Chile.

#v(0.5cm)

*BS. in Business Administration* (with a minor in Political Science) #h(1fr) 2011 \
Universidad Adolfo Ibáñez, Chile.

= Awards

Top paper award, International Communication Association #h(1fr) 2022

Travel Grant, Society of Young Network Scientist #h(1fr) 2019

Fellowship, California Institute of Technology #h(1fr) 2014

Honorable Mention (Posters Session) Chilean Economics Society #h(1fr) 2012

Scholarship, Universidad Adolfo Ibáñez #h(1fr) 2006

= Major Areas of Research Interest

Social Networks and Complex Systems \
Statistical Computing \
Scientific Software Development \
Mechanistic Machine Learning \
Statistical Methods Development

= Academic and Professional Experience

*Research Assistant Professor* #h(1fr) Nov 2021 -- Present \
Division of Epidemiology, University of Utah

#v(0.5cm)

*Data Scientist (contractor)* #h(1fr) May 2024 -- Present \
Center for Forecasting and Outbreaks Analytics, CDC

#v(0.5cm)

*Lead Data Scientist (Associate)* #h(1fr) Nov 2023 -- May 2024 \
Booz Allen Hamilton

#v(0.5cm)

*Adjunct Assistant Professor* #h(1fr) Jan 2023 -- Present \
Division of Population Health Sciences, University of Utah

#v(0.5cm)

*Research Programmer* #h(1fr) Feb 2018 -- Nov 2021 \
Department of Preventive Medicine, University of Southern California

#v(0.5cm)

*Programmer Analyst* #h(1fr) Oct 2015 -- Feb 2018 \
Department of Preventive Medicine, University of Southern California.

#v(0.5cm)

*Graduate student researcher* #h(1fr) Aug 2011 -- Oct 2015 \
Division of Social Sciences, California Institute of Technology.

#v(0.5cm)

*Analyst* #h(1fr) Aug 2011 -- Aug 2014 \
Research Division, Chilean Pension Supervisor (Pension System Watchdog).

#v(0.5cm)

*Founding partner* #h(1fr) Jan 2012 -- Jan 2014 \
Nodos Chile Social Network Analysis Ltda.

#v(0.5cm)

*Adjunct Professor of Statistical Computing* #h(1fr) Jan 2011 -- Jun 2012 \
School of Government, Universidad Adolfo Ibáñez.

= Peer Reviewed Publications

#include "bib-published.typ"

= Work in Progress and Technical Reports

#include "bib-wip.typ"

= Books

"Applied Network Science with R" (on development) #link("https://book.ggv.cl/")

"Applied HPC with R" (on development) #link("https://book-hpc.ggv.cl/")

= Software Packages

#include "software.typ"

= Conference talks/workshops

#include "bib-conferencetalk.typ"

= Invited Speaker

#include "bib-invitedtalk.typ"

= Other Talks

#include "bib-othertalk.typ"

= Teaching

*\(PHS 7045) Advanced Programming with R and HPC* #h(1fr) Fall 2024 \
The University of Utah, USA \
Co-instructor, PHS Ph.D. Program

#v(0.5cm)

*\(PHS 7045) Advanced Programming with R and HPC* #h(1fr) Fall 2022 \
The University of Utah, USA \
Co-instructor, PHS Ph.D. Program

#v(0.5cm)

*\(PM 566) Introduction to Health Data Science* #h(1fr) Fall 2021 \
University of Southern California, USA \
Instructor, Masters of Science in Public Health Data Science

#v(0.5cm)

*\(PM 566) Introduction to Health Data Science* #h(1fr) Fall 2020 \
University of Southern California, USA \
Co-instructor, Masters of Science in Public Health Data Science

#v(0.5cm)

*Statistical Computing with Stata* #h(1fr) First semester 2012 \
Universidad Adolfo Ibáñez, Chile \
Instructor, Masters in Economics and Public Policy

#v(0.5cm)

*Introduction to Economics* #h(1fr) First semester 2012 \
Universidad Adolfo Ibáñez, Chile \
Co-instructor, B.A. in Business Administration

#v(0.5cm)

*Microeconomics* #h(1fr) Second semester 2012 \
Universidad Adolfo Ibáñez, Chile \
Co-instructor, B.A. in Business Administration

#v(0.5cm)

*Introduction to Economics* #h(1fr) First semester 2011 \
Universidad Adolfo Ibáñez, Chile \
Co-instructor, B.A. in Business Administration

= Mentoring/Advising

*Mentor, RA (2024--Present)* \
Sima Najafzadehkhoei, University of Utah, Population Health Sciences, Ph.D. in Biostatistics. Computational Epidemiology, Agent-Based Models and ML.

#v(0.5cm)

*Mentor, RA (2024--Present)* \
Anibal Olivera, Universidad del Desarrollo, Chile, Ph.D. in Social Complexity. Network Science and R package development.

#v(0.5cm)

*Mentor, RA (2024--Present)* \
Milo Banks, Rowland Hall High School, High School Student. Software development and computational epidemiology.

#v(0.5cm)

*Mentor, RA (2023--Present)* \
Hyrum Thomas Diesen, University of Utah, School of Biological Sciences, Molecular Cellular Evolutionary Biology Ph.D. program.

#v(0.5cm)

*Ph.D. Dissertation Committee Member (2023--Present),* \
Eric Anto, University of Utah, Population Health Sciences, Biostatistics Ph.D. program.

#v(0.5cm)

*Qualifying Exam chair and Member, Ph.D. Dissertation Committee Member (2022--2024),* \
Katherine Lawson Michod, University of Utah, Population Health Sciences, Clinical and Translational Epidemiology Ph.D. program.

#v(0.5cm)

*Mentor, RA (Summer 2023),* \
Porter Bischoff, University of Utah + Utah Valley University, Summer Program for Undergraduate Research (SPUR), Network Visualization using R.

#v(0.5cm)

*Supervisor, RA, and M.Sc. Dissertation Committee Member (2022--Present)* \
Derek Meyer, University of Utah, Population Health Science, Agent-Based Models for Epidemics.

#v(0.5cm)

*Mentor, (2022--Present),* \
Jacqueline M. Kent-Marvik, University of Utah, Nursing School, Ph.D. Health Sciences, Network Science and Social Network Analysis.

#v(0.5cm)

*Mentor, (2022),* \
Luis Lopez, NIH, Postbac program, Exponential-Family Random Graph Models.

= Grants

(PIs: Vega Yon, Basu Roy) \
University of Utah Seed Grant #h(1fr) 2026 -- 2027 \
*Quantum-Enhanced Epidemiological Modeling for Public Health
Decision-Making* \
The project seeks to explore the potential of quantum computing to enhance epidemiological modeling and public health decision-making. By implementing a quantum-enhanced version of an epidemiological ABM, we aim to demonstrate the feasibility and advantages of quantum computing in this domain, as well as to provide insights into the types of epidemiological problems that could benefit most from quantum approaches. \
Role: Co-PI \
Total Award Amount: \$ 50,000.

#v(0.5cm)

5P01CA196569-08 (PIs: Gauderman, Siegmund) #h(1fr) 07-01-2016 -- 08-31-2027 \
National Cancer Institute (NCI) #h(1fr) 0.6 calendar months/year \
*Statistical Methods for Integrative Genomics in Cancer* \
This program aims to develop novel statistical methods for integrating multi-omic data to address cancer etiology, prognosis, and treatment. The program has three synergetic projects, one using evolutionary models for annotating genes and their products (of which I am a Co-I). \
Role: Co-Investigator \
Total Award Amount (including indirect costs): \$ 12,894,663.

#v(0.5cm)

HT94252310221 (PI: Kennedy) #h(1fr) 07-01-2023 -- 30-06-2026 \
U.S. Army Medical Research and Development Command (DoD) #h(1fr) 1.8 calendar months/year \
*Phenotypes of Epilepsy Etiology and Drug Resistance (PEER)* \
The project aims to investigate the causes and workings of epilepsy by utilizing new data science methods. The grant will be utilized to analyze patterns in three ongoing and established studies, generating "risk scores" for epilepsy after a head injury, specifically among military personnel. \
Role: Co-Investigator \
Total Award Amount (including indirect costs): \$ 846,484.

#v(0.5cm)

5U01CK000675-01 (PI: Keegan) #h(1fr) 09-30-2022 -- 09-29-2025 \
National Center for Emerging and Zoonotic Infectious Diseases (NCEZID) #h(1fr) 0.3 calendar months/year \
*TRANSMIT: Training Research Acumen in Students Modeling Infectious Threats* \
A fellowship program oriented to train students in using mathematical modeling and computational methods to study infectious diseases. \
Role: Co-Investigator \
Total Award Amount (including indirect costs): \$ 891,356.

#v(0.5cm)

_Submitted but not funded_

#v(0.2cm)

1R01HG012878-01 (PI: Vega Yon) #h(1fr) 12-01-2022 -- 11-30-2027 \
National Human Genome Research Institute (NHGRI) \
*Improving our Predictive Capability of Gene Functions by Leveraging Biological Insights with Advanced Statistical Computing* \
Using discrete exponential-family models, build a mechanistic gene function evolution model incorporating complex features involving biological processes such as neofunctionalization. \
Role: PI \
Total Award Amount: Not funded

#v(0.5cm)

1R01HG012878-01A1 (PI: Vega Yon) #h(1fr) 12-01-2023 -- 11-30-2028 \
National Human Genome Research Institute (NHGRI) \
*Building a Novel Prediction Framework Leveraging Biological Insights to Boost Machine Learning Algorithms for Annotating Gene Function* \
This project extends my model of function evolution using discrete exponential-family models. It embeds it into a mechanistic machine learning framework---mixing theory and data-driven models to improve gene function prediction. \
Role: PI \
Total Award Amount: Not funded

= Honors and Services to the Profession

*Manuscript Review (Ad Hoc)* \
Journal of the American Statistical Association \
American Sociological Review \
The Official Journal of The Society for Computational Economics \
The R Journal \
The Stata Journal \
Social Networks \
Journal of Mathematical Sociology \
Computer Methods and Programs in Biomedicine Update \
Journal of Open Source Software \
Bioinformatics

#v(0.5cm)

*Abstract Review* \
International Conference on Computational Social Science (2019--2021) \
SUNBELT Conference (2016)

#v(0.5cm)

*Panelist/Discussant*

"Learning tips for your PhD from other researchers in the community". \
Early and Middle Career Researchers (EMCRs) on Social Networks workshops, October 2023.

"JASA A&CS Special Invited Session: A Tale of Two Datasets -- Representativeness and Generalisability of Inference for Samples of Networks." \
Joint Statistical Meetings (JSM), August 2023.

"Social Network Diffusion of Individual Behavior Change Interventions Virtual Workshop." \
National Institute on Aging Division of Behavioral and Social Research (NIA BSR), March 2022.

#v(0.2cm)

*Book Review*

"Microeconometrics and Matlab: An Introduction", by Adams, Clarke and Quinn, Oxford University Press, 2015.

"Mastering Gephi Network Visualization", by Ken Cherven, Packt Publishing, 2015.

"Network Graph Analysis and Visualization with Gephi", by Ken Cherven, Packt Publishing, 2013.

#v(0.5cm)

*Misc*

Core member of the #link("https://datascience.utah.edu")["University of Utah's Center for Data Science"] (2023--Present)

Lead of #link("https://netsci.utah.edu")["Network Science and Social Network Analysis at the U (NetSNAU)"] research group (2022--Present)

Member of "Center for Applied Network Analysis (CANA) at USC" research group (2016--Present)

Co-organizer of the #link("https://networkanalysis.usc.edu")[USC Networks Meeting] (2020, 2021)

Founder of the (first) #link("https://www.meetup.com/useRchile/")[R Users Group in Chile (2013)]

Co-organizer of the #link("https://socalr.org")[East LA R User Group (LAERUG)].

= Software

R, C++, Python, Typst, SQL, XML, regex, Stata+Mata, VBA, Gephi, Pajek, Mathematica, MS Suite, Git, Unix, Docker, Visual Studio Code

#v(1cm)

// Footer
#align(center)[
  #text(size: 8pt)[
    last update: #datetime.today().display("[month repr:long] [day], [year]") \
    #link(footerlink)[#raw(footerlink)]
  ]
]
