class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  

  
  def _new
  end
    
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
