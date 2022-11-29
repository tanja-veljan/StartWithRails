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

  # Update step 1 from CRUD
  def edit
    @article = Article.find(params[:id])
  end

  # Update step 2 from CRUD
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Delete from CRUD
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end

