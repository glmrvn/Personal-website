class ArticlesController < ApplicationController

	before_filter :all_articles, only: [:index, :new, :create, :show, :edit, :update]
	before_filter :article_find, only: [:show, :edit, :update]
#	before_filter :check_admin, only:  [:create, :new, :destroy]

	def index
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)

		if @article.save
		  redirect_to @article
	    else
		  render 'new'
		end		
	end

	def edit
	end

	def update
		  if @article.update(article_params)
		  	flash[:succes] = "Article updated"
		    redirect_to @article
		  else
		    render 'edit'
		    flash[:succes] = :message
		  end
	end

	def show
		#render text: params[:article].inspect
	end

	def destroy
		@article = Article.find(params[:id])
		@article.image = nil
		@article.destroy

		redirect_to articles_path
		flash[:succes] = "Article Deleted"
	end



	private

	def all_articles
		@articles  = Article.all		
	end

	def article_find
		@article = Article.find(params[:id])		
	end

	def article_params
		params.require(:article).permit( :title,
			                             :text,
			                             :image )		
	end

end
