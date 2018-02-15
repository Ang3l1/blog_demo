class ArticlesController < ApplicationController
	#before_action :validate_user, except: [:show, :index]
	before_action :authenticate_user!, except: [:show, :index]
	before_action :set_article, except: [:index, :new, :create]
	before_action :authenticate_editor!, only: [:new, :create, :update]
	before_action :authenticate_admin!, only: [:destroy, :publish]

	def index
		@articles = Article.paginate(page: params[:page], per_page: 5).publicate
	end

	def show
		@articles.update_visit_count
		@comment = Comment.new
		#@hascategory = Category.find(params[:@articles.id])
	end

	def new
		@articles = Article.new
		@categories = Category.all
	end

	def create
		@articles = current_user.articles.new(article_params)
		@articles.categories = params[:categories]
		if @articles.save
			redirect_to @articles
		else
			render :new
		end
	end

	def edit
		
	end

	def update
		
		if @articles.update(article_params)
			redirect_to articles_path
		else
			render :edit
		end
	end

	def publish
		@articles.publish!
		redirect_to @articles
	end

	def destroy
		
		@articles.destroy
		redirect_to articles_path
	end

	private
	#def validate_user
	#	redirect_to new_user_session_path, notice: "Necesita iniciar sesión"
	#end
	def set_article
		@articles = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :body, :cover, :categories)
	end
end