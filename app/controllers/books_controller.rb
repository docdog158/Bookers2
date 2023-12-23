class BooksController < ApplicationController
  def index
    @book=Book.new
    @books=Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  

  
  def create
    
  end
    
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
