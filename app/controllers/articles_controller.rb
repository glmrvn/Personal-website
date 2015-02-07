class ArticlesController < ApplicationController

	before_filter :all_articles, only: [:index, :new, :create, :show, :edit, :update, :see_count]
	before_filter :article_find, only: [:show, :edit, :update, :see_count]

	def index
		@articles = Article.paginate(page: params[:page], :per_page => 8)
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
		end
	end

	def show
	end

	def destroy
		@article = Article.find(params[:id])
		@article.image = nil
		@article.destroy

		redirect_to articles_path
		flash[:error] = "Article Deleted"
	end

	def see_count
		@article.increment!(:see_count)
		render 'show'
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
