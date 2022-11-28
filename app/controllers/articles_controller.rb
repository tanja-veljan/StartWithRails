class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  # Read from CRUD
  def show
    @article = Article.find(params[:id])
  end

  # Create step 1 from CRUD
  def new
    @article = Article.new
  end

  # Create step 2 from CRUD
  def create
    @article = Article.new(title: "...", body: "...")

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end
end
