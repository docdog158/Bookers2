class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user

  end

  def show
    @book = Book.find(params[:id])
    @books = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    @user = @book.user
    redirect_to book_path(@book)
    flash[:notice] = "Book was successfully created."

  end

  def new
    @book = Book.new
  end
  
  def destroy
    @book = Book.find(params[:id])  
    @book.destroy  
    redirect_to '/books' 
  end
  
  
  
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
