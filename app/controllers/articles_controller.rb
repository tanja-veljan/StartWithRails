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
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end

