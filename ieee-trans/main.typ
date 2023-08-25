#import "template.typ": *
#show: ieee.with(
  title: [Preparation of Papers for IEEE #smallcaps[Transactions] and #smallcaps[Journals] (_February_ 2022)],
  journal-name: "IEEE TRANSACTIONS AND JOURNALS TEMPLATE",
  abstract: [
    The process of scientific writing is often tangled up with the intricacies of typesetting, leading to frustration and wasted time for researchers. In this paper, we introduce Typst, a new typesetting system designed specifically for scientific writing. Typst untangles the typesetting process, allowing researchers to compose papers faster. In a series of experiments we demonstrate that Typst offers several advantages, including faster document creation, simplified syntax, and increased ease-of-use.
  ],
  authors: (
    (
      name: "First Author",
      membership: [Student Member,~IEEE],
      department: [Engineering Dept.],
      organization: [The Institute],
      location: [Boston, NY, USA],
      email: "fa@insti.ac.us"
    ),
    (
      name: "Second Author",
      membership: [Member,~IEEE],
      department: [Engineering Dept.],
      organization: [The Institute],
      location: [Boston, NY, USA],
      email: "sa@insti.ac.us"
    ),
    (
      name: "Third Author",
      membership: [Senior Member,~IEEE],
      department: [Engineering Dept.],
      organization: [The Institute],
      location: [Boston, NY, USA],
      email: "sa@insti.ac.us"
    ),
    (
      name: "Last Author",
      membership: [Fellow,~IEEE],
      department: [Engineering Dept.],
      organization: [The Institute],
      location: [Boston, NY, USA],
      email: "sa@insti.ac.us"
    ),
  ),
  index-terms: ("Scientific writing", "Typesetting", "Document creation", "Syntax"),
  bibliography-file: "refs.bib",
)

// This should be #thanks
#footnote(numbering: it => "")[
#par(justify: true, first-line-indent: 1em)[
_This paragraph of the first footnote will contain the date on which you
submitted your paper for review. It will also contain support information,
including sponsor and financial support acknowledgment. For example,
“This work was supported in part by the U.S. Department of Commerce
under Grant 123456.”_

_The next few paragraphs should contain the authors’ current affiliations, including current address and e-mail. For example, First A. Author is with the National Institute of Standards and Technology, Boulder, CO
80305 USA (e-mail: author\@boulder.nist.gov)._

_Second B. Author Jr. was with Rice University, Houston, TX 77005
USA. He is now with the Department of Physics, Colorado State University, Fort Collins, CO 80523 USA (e-mail: author\@lamar.colostate.edu).
Third C. Author is with the Electrical Engineering Department, University of Colorado, Boulder, CO 80309 USA, on leave from the
National Research Institute for Metals, Tsukuba, Japan (e-mail: author\@nrim.go.jp)_
]
]
= Introduction
Scientific writing is a crucial part of the research process, allowing researchers to share their findings with the wider scientific community. However, the process of typesetting scientific documents can often be a frustrating and time-consuming affair, particularly when using outdated tools such as LaTeX. Despite being over 30 years old, it remains a popular choice for scientific writing due to its power and flexibility. However, it also comes with a steep learning curve, complex syntax, and long compile times, leading to frustration and despair for many researchers.@netwok2020

== Paper overview
In this paper we introduce Typst, a new typesetting system designed to streamline the scientific writing process and provide researchers with a fast, efficient, and easy-to-use alternative to existing systems. Our goal is to shake up the status quo and offer researchers a better way to approach scientific writing. @netwok2021

By leveraging advanced algorithms and a user-friendly interface, Typst offers several advantages over existing typesetting systems, including faster document creation, simplified syntax, and increased ease-of-use.

To demonstrate the potential of Typst, we conducted a series of experiments comparing it to other popular typesetting systems, including LaTeX. Our findings suggest that Typst offers several benefits for scientific writing, particularly for novice users who may struggle with the complexities of LaTeX. Additionally, we demonstrate that Typst offers advanced features for experienced users, allowing for greater customization and flexibility in document creation.

Overall, we believe that Typst represents a significant step forward in the field of scientific writing and typesetting, providing researchers with a valuable tool to streamline their workflow and focus on what really matters: their research. In the following sections, we will introduce Typst in more detail and provide evidence for its superiority over other typesetting systems in a variety of scenarios.

= Methods
#lorem(90)

$ a + b = gamma $

#lorem(200)

= Results

#lorem(450)

= Conclusion

#lorem(300)