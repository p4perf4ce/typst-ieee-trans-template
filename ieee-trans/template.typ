// Variables
#let IEEE_COLOR = (
  Title: rgb("#004495"),
  Section: rgb("#004496"),
  BoldText: rgb("#004495"),
)
#let FONT_WEIGHT = (
  title: 24pt,
  header: 8pt,
  author: 11pt,
  body: 10pt,
  h1: 12pt,
  ack: 10pt,
  ref: 12pt,
)

#let IEEEmembership(it) = {
  text(style: "italic", it)
}

// Macros
// Parse `content` to string.
#let parse_content(content) = {
  if type(content) == type("") {
    return content
  }
  else if content.has("children") {
    return content.children.map(
        (item) => {
          if item.has("body") {
            return item.body.text
          } else if item == [ ] {
            return " "
          } else {
            return " "
          }
        }
      ).join("")
 } else if content.has("body") {
   return item.body.text
 } else {
   assert(false, message: "Invalid input.")
 }
}


// Template

// This function gets your whole document as its `body` and formats
// it as an article in the style of the IEEE.
#let ieee(
  // The paper's title.
  title: "IEEE Transactions and Journals Template",
  // Transaction/Journal name.
  journal-name: "IEEE Transactions and Journals Template",

  // An array of authors. For each author you can specify a name,
  // department, organization, location, and email. Everything but
  // but the name is optional.
  authors: (),

  // The paper's abstract. Can be omitted if you don't have one.
  abstract: none,

  // A list of index terms to display after the abstract.
  index-terms: (),

  // The article's paper size. Also affects the margins.
  paper-size: "us-letter",

  // The path to a bibliography file if you want to cite some external
  // works.
  bibliography-file: none,

  // The paper's content.
  body
) = {
  // Set document metdata.
  set document(title: parse_content(title), author: authors.map(author => author.name))

  // Set the body font.
  set text(font: "STIX Two Text", size: FONT_WEIGHT.body)

  // Configure the page.
  set page(
    paper: paper-size,
    // The margins depend on the paper size.
    margin: if paper-size == "a4" {
      (x: 41.5pt, top: 80.51pt, bottom: 89.51pt)
    } else {
      (
        x: (50pt / 216mm) * 100%,
        top: (55pt / 279mm) * 100%,
        bottom: (64pt / 279mm) * 100%,
      )
    },
    header: locate(loc => {
    set text(FONT_WEIGHT.header)
    if loc.page() == 1 {
        box(width: 0.72in, height: 0.13in, image("logo.png"))
        h(1fr)
        journal-name
        h(4em)
        counter(page).display("1")
        v(4pt, weak: true)
        line(length: 100%, stroke: 1pt)
      } else if calc.rem(loc.page(), 2) == 0 {
        counter(page).display("1")
        h(1fr)
        journal-name
        v(4pt, weak: true)
        line(length: 100%, stroke: 1pt)
      } else {
        let author_title = ""
        if authors.len() == 1 {
          author_title = authors.at(0).name
        } else {
          author_title = authors.at(0).name.split(" ").at(-1)
          author_title = [#upper[#author_title] et al.]
        }
        [#author_title: #title]
        h(1fr)
        counter(page).display("1")
        v(4pt, weak: true)
        line(length: 100%, stroke: 1pt)
      }
    }
    ),
  )

  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 0.65em)

  // Configure lists.
  set enum(indent: 10pt, body-indent: 9pt)
  set list(indent: 10pt, body-indent: 9pt)

  // Configure headings.
  set heading(numbering: "I.A.1.")
  show heading: it => locate(loc => {
    // Find out the final number of the heading counter.
    let levels = counter(heading).at(loc)
    let deepest = if levels != () {
      levels.last()
    } else {
      1
    }

    set text(FONT_WEIGHT.body, weight: "regular", fill: IEEE_COLOR.Section)
    if it.level == 1 [
      // First-level headings are smallcaps.
      // We don't want to number of the acknowledgment section.
      #let is-ack = it.body in ([Acknowledgment], [Acknowledgement])
      #set align(center)
      #set text(if is-ack { FONT_WEIGHT.ack } else { FONT_WEIGHT.h1 })
      #show: smallcaps
      #v(20pt, weak: true)
      #if it.numbering != none and not is-ack {
        numbering("I.", deepest)
        h(7pt, weak: true)
      }
      #it.body
      #v(13.75pt, weak: true)
    ] else if it.level == 2 [
      // Second-level headings are run-ins.
      #set par(first-line-indent: 0pt)
      #set text(style: "italic")
      #v(10pt, weak: true)
      #if it.numbering != none {
        numbering("A.", deepest)
        h(7pt, weak: true)
      }
      #it.body
      #v(10pt, weak: true)
    ] else [
      // Third level headings are run-ins too, but different.
      #if it.level == 3 {
        numbering("1)", deepest)
        [ ]
      }
      _#(it.body):_
    ]
  })

  // Set footnote behavior
  set footnote.entry(
    separator: "",
    clearance: 0em,
  )

  // Display the paper's title.
  v(3pt, weak: true)
  align(
    center,
    text(24pt, font: "Arimo", fallback: false, fill: IEEE_COLOR.Title, title)
  )
  v(8.35mm, weak: true)

  align(center,text(size: FONT_WEIGHT.author, [
    #authors.map(author => 
      if "membership" in author {
        [#author.name, #IEEEmembership(author.membership)]
      } else {
        author.name
      }
  ).join(", ", last: " and ")
  ]))
  v(40pt, weak: true)

  // Start two column mode and configure paragraph properties.
  show: columns.with(2, gutter: 12pt)
  set par(justify: true, first-line-indent: 1em)
  show par: set block(spacing: 0.65em)
  
  // Display abstract and index terms.
  if abstract != none [
    #set text(9pt, weight: "bold")
    #h(1em)_Abstract_---#abstract

    #if index-terms != () [
    _Index terms_---#index-terms.join(", ")
    ]
    #v(2pt)
  ]

  // Display the paper's contents.
  body

  // Display bibliography.
  if bibliography-file != none {
    show bibliography: set text(8pt)
    bibliography(bibliography-file, title: text(12pt)[References], style: "ieee")
  }
}

