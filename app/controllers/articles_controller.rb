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

		@article.save
		redirect_to @article
		
	end

	def edit
	end

	def update
		  if @article.update(article_params)
		    redirect_to @article
		  else
		    render 'edit'
		  end
	end

	def show
		#render text: params[:article].inspect
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
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
