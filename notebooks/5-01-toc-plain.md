---
title: frontmatter title
---

# messing with the title

this is a section where we play with the TOC

btw, this file is a plain markdown text file, **not a notebook** - hence the filename without the `-nb` suffix

another thing we wanted to test is the ability to use another title in the TOC as the one in the file

apparently that is not possible; one can either

- not create a frontmatter, then the first heading is used as the title
- create a frontmatter, then the title in the frontmatter is used as the title

in any case a `title` set from the yaml toc does not seem to trigger at all

## a subsection

that becomes level-3 heading once rendered, because of the extra title layer from the frontmatter
