class BooksController < ApplicationController
  def index
  end

  def top
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    # redirect_to '/top'
    redirect_to book_path(book.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  # 編集したら保存
  def update
    # 変数bookにモデルから探しだしたid/レコードを当てる
    book = Book.find(params[:id])
    # updateメソッド(ストロングパラメーター)
    book.update(book_params)
    # Createと同じ
    redirect_to book_path(book.id)
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
