class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def index
  	@books = Book.all
    @book =Book.new
  end
  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
    if @book.save
  	   redirect_to book_path(@book), notice: 'You have created book successfully.'
    else
      @books = Book.all
      render 'index'
    end
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book), notice: 'You have updated book successfully.'
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  def correct_user
    unless user_signed_in?
      redirect_to root_path
    end
  end
end