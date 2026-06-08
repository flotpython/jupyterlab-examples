---
title: Possible topics for the MyST Workshop
short_title: possible topics
date: 2026-06-08
---

## purpose

in this notebook I am trying to list the main topics that I think are relevant to the MyST Workshop  
it is less micro-management oriented than a list of issues, and tries to be more high-level  
now, it is still a bit of a brain dump, so I apologize in advance for the lack of structure

### re-use from one course to the other

I guess that's the meta-topic here; we have many courses each year, so we're
after a scheme where creating a new course is as painless as possible, while
following our best practices (themes, plugins, styles, publication methods,
etc..)

each time there's a change in the best practices, we need to update all courses,
and that can become a serious burden

## static content

- this has been a longstanding thorn in the flesh  
- supposed to be available in 1.10 I think I understand ?
- for the record, use cases are, well, infinite, but for example:
  - insert a folium-produced map as html in a notebook
  - attach a raw pdf (although the download thing could have helped for this one)

as it is, I still need to swallow this one, hadn't had a chance to try it out yet

## execution models

so, this one is a bit confusing:

- there are 2 possible execution runtimes: build-time and read-time
- ideally I would want to be able to say, on a per-notebook basis:
  - this is not executed at all
  - this is executed at build-time
  - this is executed at run-time (and against what kernel then)

because, what sense does it make to have a notebook executed at build-time ***and** at read-time ?
that would be a terribly confusing experience for the user I think...

currently, I can kind of achieve that but it's convoluted and not flexible enough, I mean as far as I know:

- I think I can only toggle the `--execute` flag globally (is that right?)
- and if I do that I can toggle off some executions with `skip_execution=true`
- also I think I can declare (globally) that I want jupyterlite inside, but that makes sense only for the ones executed at read-time; not sure if I can declare that on a per-notebook basis

## digression: frontmatter metadata

which brings me to the question of frontmatter metadata:  

- I find it very hard to know what can be set and where (in the config/toc and in the notebook)
- can we come up with something totally smooth and uniform ?

## execution ctd: editable cells

for notebooks executable at read-time, we'd like to have editable cells..

I quite understand it's a rabbit hole, since it pulls everything IDE (syntax highlighting, AI-assisted coding etc..)  
but as it is now, read-time execution has almost no application for me (which is fine btw)

use case: I have a Python package that performs auto-correction of exercises; I believe it could theoretically run inside a jlite-powered notebook; but of course without the ability to edit cells it's not going to be very useful

## deployment models

the doc mentions 2 deployment models:

- static deployment (e.g. gh-pages)
- app deployment (e.g. vercel, netlify etc..)

For me it's exclusively the former for now  
I'm not sure I see the value there would be in the latter as compared to the former  
Why would we bother ?  
In other words, what can we do with the latter that we can't do with the former ?

## execution & interactive outputs

still totally struggling when it comes to producing interactive outputs
(visualizing with `ipywidgets`, `folium`, `bokeh`, `plotly`, `altair` etc..)

I think I kind of understand the notion that it depends on the underlying tool -
whether it has a JS backend or not  
However for more traditional tools (we do write a lot of new content each year,
but we also vastly re-use content from one year to the other), like `ipywidgets`
or `matlotlib` animations, my mental model was, I just need a jlite-powered
notebook, and I'm good  
but this does not match reality, and so again in this area I'd like to learn
what are the current limitations and what can be done about it, if anything

## customization

I have created my own theme; for now it's a fork in my orga, and has just one addition to the upstream
theme, which is a button to use the full width of the page

even with this very small scope, maintenance is a bit of a chore, as:

A - I need to essentially rebase my custom theme on top of the upstream one each time I want to update it
B - and I've had to persuade you folks to use a more sensible way to expose these artefacts through gh releases

### plugins for the theme ?

ideally I'd like to **not have to fork** and write plugins instead  
the things we'd need to customize would be:

- add buttons like the full-width one
- enable plugins (typically the lightbox thing is something I wouldn't need to repeat over and over again in each course)
- tweak the css

so ok for the last point there's already the `style:` entry in the config, but that's not optimal  
- at the minimum we'd need to be able to specify several entries so we could have global css shared in some url (same look for all course) and one for that specific course
- but I'd say ideally this is part of my custom theme; but again without the need for a fork..

what I'm trying to say is that ideally, adopting all these pieces would be done
as one-liner; otherwise, as we have dozens of courses, we keep on maintaining
and checking several moving pieces (the custom theme, the custom css, etc..)
across too many courses, and it's a nightmarish task

generally speaking I'd need to better understand how to take advantage of the current plugin system, and what are the limitations of it, and whether it can be improved to allow for more flexible customization

### plugins for execution ?

I had a question one time when writin a course on Rust, I was wondering if it was possible to write a plugin that would make it so that cells with a specific task (`clear`) would inject a specific code snippet (e.g. `!cargo clean`) before executing the cell

it turned out to ba apparently unfeasible, because it looks like execution occurs before any kind of parsing is done, iiuc

is there anything that could be done in this direction to allow for more control on execution based on cell metadata for example ?
