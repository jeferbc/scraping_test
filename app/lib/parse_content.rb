# used for search into a webpage headers and links tags

class ParseHtml
  require 'open-uri'
  attr_reader :url, :content, :doc

  def initialize(url)
    @url = url
    @doc = Nokogiri::HTML(open(@url))
    byebug
    @content = []
  end

  def get_headers(header)
    get_text(@doc.css(header))
  end

  def get_link
    get_url(@doc.css('a[href!= nil]'))
  end

  def get_url(entries)
    entries.each do |entry|
      @content << { tag: entry.name, content: entry['href'] }
    end
  end

  def get_text(entries)
    entries.each do |entry|
      @content << { tag: entry.name, content: entry.text }
    end
  end
end
