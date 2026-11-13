# NOTICE

This is cloned repo with excelent work done by Idraluna:
* itch: ![itchio](https://idraluna-archives.itch.io/old-school-rpg-typst-templates)
* gitlab: ![gitlab](https://gitlab.com/idraluna-archives/old-school-rpg-typst-templates)

All credits goes to Idraluna - please visit above pages to get most up to date version.

I will update this repository from time to time, pulling Idraluna changes.

# Old School RPG Typst Templates

## Overview

This repository contains Typst template files designed to emulate the formatting in classic RPGs from the 70s & 80s. Currently implemented:

- `0e_lbb.typ`: Emulates the little brown booklets of the original dungeon game. Recommended free fonts: Rye (title), Jost (body)
- `1e_core.typ`: A simulacrum of the formatting in the dungeon game's 'advanced' edition. Recommended free fonts: Rye (title), Jost (body), Tinos (header & footer)
- `Basic.typ`: Mimics the typesetting used for the dungeon game's 1981 'basic' version. Recommended free fonts: Fraunces (body), Caprasimo (headers)

An important disclaimer: these templates prioritize flexibility & simplicity over accuracy. They are intended to capture the feel of old-school RPGs but may not hold up to intense scrutiny.

A big thank-you is owed to Kevin Crawford, whose [_Brief Study of TSR Book Design_](https://www.drivethrurpg.com/en/product/168306/a-brief-study-of-tsr-book-design) was an invaluable resource for setting these up. 

## Using these templates in Typst

Typst can be used for free at [Typst.app](typst.app). The easiest way to get started is just to upload the template file and then scroll down to the sample text, replacing it with your own material. 

For more complex projects, you can load the templates into a separate `.typ` file by adding the following at the start of your file:

```
#import "./Basic.typ": basic_template
#show: basic_template.with()
```

### Typst Resources

- The [Typst documentation](https://typst.app/docs/) is very high-quality and extremely helpful. 
- There's a [Typst Examples Book](https://sitandr.github.io/typst-examples-book/book/) with lots of handy tips.

The nice thing about Typst is that the basic syntax is really simple. For RPGs, you really just need to know `= Header`, `_italics_`, & `*bold*`, plus basic [table formatting](https://typst.app/docs/guides/table-guide/). 