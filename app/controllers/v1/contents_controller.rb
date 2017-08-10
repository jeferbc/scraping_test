class V1::ContentsController < ApplicationController
  require 'parse_content'

  def index
    @contents = Content.all.paginate(page: params[:page], per_page: params[:per_page])
    json_response(@contents)
  end

  def create
    webpage = Webpage.where(url: webpage_params[:url]).first_or_create!
    contents = parse_document()
    if webpage
      @contents = []
      contents.each do |content|
        @contents << webpage.contents.where(content).first_or_create!
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
