class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  # Read from CRUD
  def show
    @article = Article.find(params[:id])
  end
end
