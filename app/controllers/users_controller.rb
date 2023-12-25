class UsersController < ApplicationController
  def show
  end

  def edit
  end
  
  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end
end
