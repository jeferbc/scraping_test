class V1::WebpagesController < ApplicationController
  before_action :get_webpage, only: [:show]

  def index
    @webpages = Webpage.all
    json_response(@webpages)
  end

  def show
    json_response(@webpage)
  end

  private
    def get_webpage
      @webpage = Webpage.find(params[:id])
    end
end
