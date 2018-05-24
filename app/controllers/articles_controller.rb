class ArticlesController < ApplicationController
  def index
    
  end

  def new
    @articles = Article.new
  end

  def create

  end

  def update

  end

  def destroy

  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
