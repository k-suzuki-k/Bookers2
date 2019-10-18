class UsersController < ApplicationController

	before_action :correct_user, only: [:edit, :update]
	def correct_user
		@user = User.find(params[:id])
		@user_chk = current_user
		unless @user == @user_chk
			#redirect_to user_path(@user_chk)
			redirect_to user_path(@user_chk)
		end
	end

 	  def index
		  @books = Book.all
		  @book = Book.new
		  @users = User.all
		  @user = current_user
 	  end

	  def show
		  @user = User.find(params[:id])
		  @book = Book.new
		  @books = Book.where(user_id:@user.id)
	  end

	  def edit
		  @user = User.find(params[:id])
	          render :layout => "second_layout"
	  end

	  def update
		  @user = User.find(params[:id])

		  if @user.update(user_params)
			  redirect_to user_path(@user.id), notice:"You have updated user successfully."
		  else
			  render :edit, layout: 'second_layout'
		  end
	  end
	  private
	  def user_params
		  params.require(:user).permit(:name,:introduction,:profile_image)
	  end

end
