class ArticlesController < ApplicationController
  def index
    # @articles = Article.where('status',1).order("id DESC")
    @articles = Article.order("id DESC")
    @article = Article.new
  end

  def new
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json:{ article: article}
    end
  end

  private
  def article_params
    # binding.pry
    if params[:article][:deletepass].match(/\A\d{0,4}\z/)
      params.require(:article).permit(:text, :deletepass).merge(status: 1)
    else
      params.require(:article).permit(:text).merge(status: 1)
    end
  end
end
