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
  describe 'test' do
    it 'should return title name' do
      bib.title.must_be_instance_of String
    end
  end
end
