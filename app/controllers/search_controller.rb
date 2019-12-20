class SearchController < ApplicationController
  def index
    render locals: {
      results: Search.new(params[:location])
    }
  end
end
