class ArticlesController < ApplicationController

	before_filter :all_articles, only: [:index, :new, :create, :show]
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

	def show
		#render text: params[:article].inspect
		@article = Article.find(params[:id])
	end

	def destroy
		@articles = Article.find(params[:id])
		@articles.destroy

		redirect_to articles_path
	end



	private

	def all_articles
		@articles  = Article.all		
	end

	def article_params
		params.require(:article).permit( :title,
			                             :text )		
	end

end
