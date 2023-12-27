class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = Book.all
  end
  
  def new
    @book = Book.new  
  end
  
  
  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(book.id)
    
    
    #book = Book.new(book_params)
    #book.save
    #redirect_to book_path(book.id)
  end
  
  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render user
    end
  end

  private

  def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
