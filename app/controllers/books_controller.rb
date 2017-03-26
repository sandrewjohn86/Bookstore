class BooksController < ApplicationController

  def index
    if params[:search]
      @books = Book.search(params[:search]).all.paginate(:per_page => 10, :page => params[:page])
      @categories = Category.all
    else
      @books = Book.all.paginate(:per_page => 10, :page => params[:page])
      @categories = Category.all

    end
  end

  def show
    @book = Book.find(params[:id])
    @categories = Category.all
  end

  private
    def book_params
      params.require(:book).permit(:title, :category_id, :author_id, :publisher_id, :isbn, :price, :buy, :format, :excerpt, :pages, :year, :coverpath, :image)
    end
end
