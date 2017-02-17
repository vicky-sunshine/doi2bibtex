$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'doi2bibtex/version'
Gem::Specification.new do |s|
  s.name = 'doi2bibtex'
  s.version = Doi2bibtex::VERSION
  s.date = Doi2bibtex::DATE
  s.executables << 'doi2bibtex'
  s.summary = 'Convert DOI to BibTeX'
  s.description = 'Give DOI of a paper and get corresponding BibTeX'
  s.authors = ['Chi-Hsuan Li']
  s.email   = ['lch82327@gmail.com']
  s.files       =  `git ls-files`.split("\n")
  s.test_files  =  `git ls-files spec/*`.split("\n")
  s.homepage    =  'https://github.com/vicky-sunshine/doi2bibtex'
  s.license     =  'MIT'

  # depend gem
  s.add_runtime_dependency 'thor', '~> 0.19'
  s.add_development_dependency 'minitest', '~> 5.9'
  s.add_development_dependency 'minitest-rg', '~> 5.2'
  s.add_development_dependency 'rake', '~> 11.3'
  s.add_development_dependency 'vcr', '~> 3.0'
  s.add_development_dependency 'webmock', '~> 2.1'

  s.homepage    =  'https://github.com/vicky-sunshine/doi2bibtex'
  s.license     =  'MIT'
end
