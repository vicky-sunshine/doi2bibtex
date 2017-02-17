require 'http'
require 'uri'

module Doi2bibtex
  # parse daily weather description from cwb website
  class Doi2bibtex
    attr_reader :doi, :bibtex
    private :hash

    CROSSREF_URL = 'http://data.crossref.org/'.freeze

    def initialize(doi)
      @doi ||= doi
      handle_doi_request
      parsing_bibtex
    end

    def url
      URI.unescape(@hash["url"])
    end

    def author
      @hash["author"].to_s
    end

    def title
      @hash["title"].to_s
    end

    def book_title
      if @hash["booktitle"].nil?
        @hash["journal"].to_s
      else
        @hash["booktitle"].to_s
      end
    end

    def publisher
      @hash["publisher"].to_s
    end

    def volume
      @hash["volume"].nil? ? nil:@hash["volume"].to_i
    end

    def issue
      @hash["number"].nil? ? nil:@hash["number"].to_i
    end

    def pages
      @hash["pages"].to_s.gsub('--', '-')
    end

    def year
      @hash["year"].to_i
    end

    def month
      if @hash["month"].nil?
        nil
      else
        Date::MONTHNAMES.index(@hash["month"].capitalize)
      end
    end

    def inspect
      "<#{Doi2bibtex}:0x#{'%x' % (object_id << 1)} @doi=#{doi.inspect}, @bibtex=#{@bibtex.inspect}>"
    end

    def to_s
      bibtex
    end

    def to_h
      {
        doi: doi,
        url: url,
        author: author,
        title: title,
        book_title: book_title,
        publisher: publisher,
        volume: volume,
        issue: issue,
        pages: pages,
        year: year,
        month: month
      }
    end

    private

    def handle_doi_request
      res = HTTP.headers(:accept => 'application/x-bibtex').get(CROSSREF_URL + doi)
      if res.code == 200
        @bibtex ||= res.to_s
      else
        @bibtex = nil
      end
    end

    def parsing_bibtex
      if bibtex.nil?
        @hash = nil
      else
        data = bibtex.delete("{},\\").delete("\n").split("\t").drop(1)
        @hash ||= data.map { |e| e.split(" = ")}.to_h
      end
    end
  end
end
