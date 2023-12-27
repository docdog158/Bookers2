class BooksController < ApplicationController
   before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user

  end

  def show
    #@book = Book.find(params[:id])
    #@books = Book.new
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = @book.user
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      render :index
    end
      
  end

  def new
    @book = Book.new
  end
  
  def destroy

    @book = Book.find(params[:id])
    @book.destroy

    redirect_to '/books'
  end
  
  def update
    
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end  
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_books_path
    end
  end
  
end
