class ArticlesController < ApplicationController
  #before_action :article_params,only:[:index,:new,:create]
  before_action :set_article,only:[:show,:edit,:update,:destroy]
	  def index
		  @articles = Article.all
	  end

    def new
    	@article = Article.new
    end

    def create
      @article = Article.new(article_params)
     @article.user = User.first 
      if @article.save
      	flash[:notice] = "data create succesfully"
      	redirect_to articles_path
      else
      	render :new,status: :unprocessable_entity
      end
    end

		def show
		end
 
		 def edit
		 end

  def update
 
 	   if @article.update(article_params)
 	   	flash[:ontice] = "update succesfully"
 		redirect_to articles_path
 	else
 		render :edit,status: :unprocessable_entity
 	end
 end
   def destroy

    if @article.destroy
    	flash[:ontice] = "data deleted succesfully"
   	redirect_to root_path, status: :see_other
   end
   end

end


private
def article_params
   params.require(:article).permit(:title,:description)	
end

def set_article
	@article = Article.find(params[:id])
end