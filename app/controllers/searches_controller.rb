class SearchesController < ApplicationController
  def search
    @search_term = params[:search_term]
    @results = Question.where("title LIKE ? OR body like ?", search_term , search_term)
    #render search results
  end
end