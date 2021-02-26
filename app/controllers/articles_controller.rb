class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
  def edit
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new
    article.title = params[:title]
    article.description = params[:description]
    article.save
    redirect_to article_path(article)
  end

  def update
    # raise params.inspect
    a = Article.find params[:id]
    a.update params.require(:article).permit(:title, :description)
    redirect_to article_path(a)
  end 
end
