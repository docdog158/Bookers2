class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all
    @books =Book.all
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to user_path(@user.id)
  end
  
  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
