class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    #@book = Book.find(params[:id])
    #@books = Book.all
    @book = Book.new
    @books = @user.books
    
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = @book.user
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
      
  end
  
  
  
  
  def new
    @book = Book.new  
  end
  
  
  def edit
  
    @user = User.find(params[:id])
  end
  
  
  def index
    @book = Book.new
    @user = current_user
    #@user = User.find(params[:id])
    @users = User.all
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end
  

  def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
