class UsersController < ApplicationController
   before_action :authenticate_user!,except: [:top, :about]

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books
  end

  def edit
  	@user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to books_path
    end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
       flash[:success] = 'Successfully'
  	   redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

private
  def user_params
  	params.require(:user).permit(:image, :name, :profile_introduction)
  end

end
