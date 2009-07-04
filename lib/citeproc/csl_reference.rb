#  == Synopsis
#
# Declarations of CSL constants (see http://xbiblio.svn.sourceforge.net/viewvc/xbiblio/csl/schema/trunk/csl.rnc?view=markup)
#
#  == Author
#
#  Liam Magee
#
#  == Copyright
#
#  Copyright (c) 2007, Liam Magee.
#  Licensed under the same terms as Ruby - see http://www.ruby-lang.org/en/LICENSE.txt.
#

module Citeproc

  INFO_FIELDS = %W(
    anthropology
    astronomy
    biology
    botany
    chemistry
    communications
    engineering
    generic-base
    geography
    geology
    history
    humanities
    law
    literature
    math
    medicine
    philosophy
    physics
    psychology
    sociology
    science
    political_science
    social_science
    theology
    zoology
  )

  INFO_CLASSES = %W(author-date numeric label note in-text)

  TERMS =
    ## Misc
  %W(
    accessed
    anonymous
    and
    and others
    at
    et-al
    forthcoming
    from
    in press
    ibid
    in
    no date
    references
    retrieved
    letter
    interview
    online
    cited
    edition
    internet
    presented-at
  ) +
    ## Roles
  %W(
    editor
    translator
    interviewer
    recipient
  ) +
    ## Months
  %W(
    month-01
    month-02
    month-03
    month-04
    month-05
    month-06
    month-07
    month-08
    month-09
    month-10
    month-11
    month-12
  )

  LOCATOR_TERMS = \
  ## Locators
  %W(
    book
    chapter
    column
    figure
    folio
    issue
    line
    note
    opus
    page
  ) +
  ## a synonym for "page" (to be deprecated)
  %W(
    page-range
    page-first
    paragraph
    part
    section
    sub verbo
    volume
    verse
  )

  TERM_FORMS = %W(long verb short verb-short symbol)

  NAMES = %W(
    author
    editor
    translator
    recipient
    interviewer
    publisher
    composer
    original-publisher
    original-author
  ) +
    ## to be used when citing a section of a book, for example, to distinguish the author
    ## proper from the author of the containing work
  %W(
    container-author
  ) +
    ## use for series editor
  %W(
    collection-editor
  )

  DATE_TOKENS = %W(issued event accessed container original-date)

  VARIABLES = [
    ## the primary title for the cited item
    "title",

    ## the secondary title for the cited item; for a book chapter, this
    ## would be a book title, for an article the journal title, etc.
    "container-title",

    ## the tertiary title for the cited item; for example, a series title
    "collection-title",

    ## collection number; for example, series number
    "collection-number",

    ## title of a related original version; often useful in cases of translation
    "original-title",

    ## the name of the publisher
    "publisher",

    ## the location of the publisher
    "publisher-place",

    ## the name of the archive
    "archive",

    ## the location of the archive
    "archive-place",

    ## the location within an archival collection (for example, box and folder)
    "archive_location",

    ## the name or title of a related event such as a conference or hearing
    "event",

    ## the location or place for the related event
    "event-place",

    ##
    "page",

    ## a description to locate an item within some larger container or
    ## collection; a volume or issue number is a kind of locator, for example.
    "locator",

    ## version description
    "version",

    ## volume number for the container periodical
    "volume",

    ## refers to the number of items in multi-volume books and such
    "number-of-volumes",

    ## the issue number for the container publication
    "issue",

    ##
    "chapter-number",

    ## medium description (DVD, CD, etc.)
    "medium",

    ## the (typically publication) status of an item; for example "forthcoming"
    "status",

    ## an edition description
    "edition",

    ## a section description (for newspapers, etc.)
    "section",

    ##
    "genre",

    ## a short inline note, often used to refer to additional details of the resource
    "note",

    ## notes made by a reader about the content of the resource
    "annote",

    ##
    "abstract",

    ##
    "keyword",

    ## a document number; useful for reports and such
    "number",

    ## for related referenced resources; this is here for legal case
    ## histories, but may be relevant for other contexts.
    "references",

    ##
    "URL",

    ##
    "DOI",

    ##
    "ISBN",

    ##
    "call-number",

    ## the number used for the in-text citation mark in numeric styles
    "citation-number",

    ## the label used for the in-text citation mark in label styles
    "citation-label",

    ## The number of a preceding note containing the first reference to
    ## this item. Relevant only for note-based styles, and null for first references.
    "first-reference-note-number",

    ## The year suffix for author-date styles; e.g. the 'a' in '1999a'.
    "year-suffix",
  ]

  TYPES = %W(
    article
    article-magazine
    article-newspaper
    article-journal
    bill
    book
    broadcast
    chapter
    entry
    entry-dictionary
    entry-encyclopedia
    figure
    graphic
    interview
    legislation
    legal_case
    manuscript
    map
    motion_picture
    musical_score
    pamphlet
    paper-conference
    patent
    post
    post-weblog
    personal_communication
    report
    review
    review-book
    song
    speech
    thesis
    treaty
    webpage
  )

end
