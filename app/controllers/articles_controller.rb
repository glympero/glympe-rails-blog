class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    # Just diplaying parameters
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      # Redirect to "Article path" PREFIX article and needs the id - passing @article
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
    
  end

  def show
    @article = Article.find(params[:id])
  end

  private
    def article_params
      # ALLOWING THESE PARAMETERS FOR ARTICLE TO BE PASSED IN A FORM
      params.require(:article).permit(:title, :description)
    end
end