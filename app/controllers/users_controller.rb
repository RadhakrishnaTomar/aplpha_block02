class UsersController < ApplicationController


	def new
	 @user = User.new
	end
   
   def index
   	@users = User.all
   end

	 def create
	 	@user = User.new(user_params)
	 	if @user.save
	 		flash[:notice] = "user #{@user.username} sucessfuly created !!"
	 		redirect_to articles_path
	 	else
	 		render :edit,status: :unprocessable_entity 
	 	end
	 end
	 def edit
	 	@user = User.find(params[:id])
	 end
	 def update
	 	@user = User.find(params[:id])
	 	if @user.update(user_params)
	 		flash[:notice] = "user succesfullu updated!!"
      redirect_to @user
    else
    	render :new ,status: :unprocessable_entity
	 end
	end

	def show
		@user = User.find(params[:id])
	end

private
   def user_params
   	 params.require(:user).permit(:username,:email,:password_digest)
  end
end