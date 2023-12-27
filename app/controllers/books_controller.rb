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
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to show_path
    end
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
      render :books
    end
      

  end

  def new
    @book = Book.new
  end
  
  def destroy
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to show_path
    end
    @book = Book.find(params[:id])  
    @book.destroy  
    redirect_to '/books'
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(Book_params)
    redirect_to book_path(@book.id)
    
      #flash[:notice] = "You have updated book successfully."
    #else
      #render :edit
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
