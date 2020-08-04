class UsersController < ApplicationController
  def index
  	@book =Book.new
  	@users = User.all
  end
  def show
  	@book = Book.new
  	@user = User.find(params[:id])
  	@books = @user.books.all
  end

  def edit
  	@user = current_user
  end
end
