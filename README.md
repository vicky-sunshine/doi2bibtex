# doi2bibtex
[![Gem Version](https://badge.fury.io/rb/doi2bibtex.svg)](https://badge.fury.io/rb/doi2bibtex)
[![Build Status](https://travis-ci.org/vicky-sunshine/doi2bibtex.svg?branch=master)](https://travis-ci.org/vicky-sunshine/doi2bibtex)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Give DOI, get corresponding BibTeX!

## Usage

Install it with the following command:
```sh
$ gem install doi2bibtex
```

To get the BibTex format of certain DOI
```sh
$ doi2bibtex get 10.1109/JPROC.2014.2371999
@article{Kreutz_2015,
	doi = {10.1109/jproc.2014.2371999},
	url = {https://doi.org/10.1109%2Fjproc.2014.2371999},
	year = 2015,
	month = {jan},
	publisher = {Institute of Electrical and Electronics Engineers ({IEEE})},
	volume = {103},
	number = {1},
	pages = {14--76},
	author = {Diego Kreutz and Fernando M. V. Ramos and Paulo Esteves Verissimo and Christian Esteve Rothenberg and Siamak Azodolmolky and Steve Uhlig},
	title = {Software-Defined Networking: A Comprehensive Survey},
	journal = {Proceedings of the {IEEE}}
}
```

## Development
Use it from your Ruby code:
````ruby
require 'doi2bibtex'
DOI = "10.1109/JPROC.2014.2371999"
bib = Doi2bibtex::Doi2bibtex.new(doi)

bib.url
# "https://doi.org/10.1109/jproc.2014.2371999"

bib.title
# "Software-Defined Networking: A Comprehensive Survey"

bib.author
# "Diego Kreutz and Fernando M. V. Ramos and Paulo Esteves Verissimo and Christian Esteve Rothenberg and Siamak Azodolmolky and Steve Uhlig"

bib.book_title
# "Proceedings of the IEEE"

bib.publisher
# "Institute of Electrical and Electronics Engineers (IEEE)"

bib.volume
# 103

bib.issue
# 1

bib.pages
# "14-76"

bib.year
# 2015

bib.month
# nil

bib.bibtex
# "@article{Kreutz_2015,\n\tdoi = {10.1109/jproc.2014.2371999},\n\turl = {https://doi.org/10.1109%2Fjproc.2014.2371999},\n\tyear = 2015,\n\tmonth = {jan},\n\tpublisher = {Institute of Electrical and Electronics Engineers ({IEEE})},\n\tvolume = {103},\n\tnumber = {1},\n\tpages = {14--76},\n\tauthor = {Diego Kreutz and Fernando M. V. Ramos and Paulo Esteves Verissimo and Christian Esteve Rothenberg and Siamak Azodolmolky and Steve Uhlig},\n\ttitle = {Software-Defined Networking: A Comprehensive Survey},\n\tjournal = {Proceedings of the {IEEE}}\n}"

bib.to_h
# {:doi=>"10.1109/JPROC.2014.2371999",
#  :url=>"https://doi.org/10.1109/jproc.2014.2371999",
#  :author=>"Diego Kreutz and Fernando M. V. Ramos and Paulo Esteves Verissimo and Christian Esteve Rothenberg and Siamak Azodolmolky and Steve Uhlig",
#  :title=>"Software-Defined Networking: A Comprehensive Survey",
#  :book_title=>"Proceedings of the IEEE",
#  :publisher=>"Institute of Electrical and Electronics Engineers (IEEE)",
#  :volume=>103,
#  :issue=>1,
#  :pages=>"14-76",
#  :year=>2015,
#  :month=>nil
# }

bib.to_s # alias to `.bibtex`
# "@article{Kreutz_2015,\n\tdoi = {10.1109/jproc.2014.2371999},\n\turl = {https://doi.org/10.1109%2Fjproc.2014.2371999},\n\tyear = 2015,\n\tmonth = {jan},\n\tpublisher = {Institute of Electrical and Electronics Engineers ({IEEE})},\n\tvolume = {103},\n\tnumber = {1},\n\tpages = {14--76},\n\tauthor = {Diego Kreutz and Fernando M. V. Ramos and Paulo Esteves Verissimo and Christian Esteve Rothenberg and Siamak Azodolmolky and Steve Uhlig},\n\ttitle = {Software-Defined Networking: A Comprehensive Survey},\n\tjournal = {Proceedings of the {IEEE}}\n}"
```
