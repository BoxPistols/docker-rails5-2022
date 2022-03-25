class BooksController < ApplicationController
  def index
  end

  def top
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/top'
  end

  def show
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
