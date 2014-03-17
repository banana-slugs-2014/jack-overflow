class SearchesController < ApplicationController
  def search
    search_term = params[:search_term]
    @questions = Question.where("title ILIKE ? OR body ILIKE ?", search_term , search_term)
    render 'posts/index'
   end
end