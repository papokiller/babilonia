class Search::SuggestionsController < ApplicationController
  def show
    search = Google::Suggestion.search(params[:id])
    render json: { data: search }
  end
end
