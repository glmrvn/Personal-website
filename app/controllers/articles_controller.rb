class ArticlesController < ApplicationController

  before_filter :all_articles, only: [:index, :new, :create, :show, :edit, :update]
  before_filter :article_find, only: [:show, :edit, :update]
  before_filter :signed_user,  only: [:edit, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], :per_page => 6)
  end

  def new
   @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:succes] = "Article updated"
      redirect_to user_path(current_user)

    else
      render 'edit'
    end
  end

  def show
    @article.increment!(:see_count)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.image = nil
    @article.destroy

    redirect_to user_path(current_user)
    flash[:error] = "Article Deleted"
  end

  private

  def all_articles
    @articles  = Article.all
  end

  def article_find
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit( :title, :text, :image )
  end

  def signed_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

end
