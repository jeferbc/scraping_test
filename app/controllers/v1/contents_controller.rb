class V1::ContentsController < ApplicationController
  require 'parse_content'

  def index
    @contents = Content.all
    json_response(@contents)
  end

  def create
    contents = parse_document()
    webpage = Webpage.new(webpage_params)
    if webpage.save
      @contents = []
      contents.each do |content|
        @contents << webpage.contents.create!(content)
      end
      json_response(@contents)
    end
  end

  private
    def webpage_params
      params.permit(:url)
    end

    def parse_document
      doc = ParseHtml.new(webpage_params[:url])
      doc.get_headers('h1')
      doc.get_headers('h2')
      doc.get_headers('h3')
      doc.get_link()
      doc.content
    end
end
