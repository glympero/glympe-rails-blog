class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    # Just diplaying parameters
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save
    # Redirect to "Article path" articles#show and needs the id - passing @article
    redirect_to articles_show(@article)
  end

  def show
  end


  private
    def article_params
      # ALLOWING THESE PARAMETERS FOR ARTICLE TO BE PASSED IN A FORM
      params.require(:article).permit(:title, :description)
    end
end