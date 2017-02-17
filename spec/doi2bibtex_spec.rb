require 'vcr'
require 'webmock'
require 'minitest/autorun'
require 'minitest/rg'

require_relative '../lib/doi2bibtex.rb'

DOI = "10.1109/JPROC.2014.2371999".freeze

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
end

VCR.use_cassette('doi2bibtex') do
  bib = Doi2bibtex::Doi2bibtex.new(DOI)
  describe 'test for doi' do
    it 'should return doi' do
      bib.doi.must_be_instance_of String
    end
    it 'should have doi format' do
      bib.doi.must_match(/[0-9\.]+\/[a-zA-Z0-9\.]+/)
     end
  end

  describe 'test for title' do
    it 'should return title name' do
      bib.title.must_be_instance_of String
    end
  end

  describe 'test for url' do
    it 'should have url' do
      bib.url.must_be_instance_of String
    end
    it 'should have url format' do
      bib.url.must_match(/https:\/\/doi.org\/[0-9\.]+\/[a-zA-Z0-9\.]+/)
     end
  end

  describe 'test for author' do
    it 'should have author' do
      bib.author.must_be_instance_of String
    end
  end

  describe 'test for book_title' do
    it 'should have book_title' do
      bib.book_title.must_be_instance_of String
    end
  end

  describe 'test for year' do
    it 'should have year' do
      bib.year.must_be_instance_of Fixnum
    end
  end
end
