class Admin::BooksController < Admin::ApplicationController
  before_filter :verify_logged_in
  
  def new
    @page_title = "Add New Book"
    authorize @book = Book.new
    @category = Category.new
    @author = Author.new
    @publisher = Publisher.new
  end

  def create
    @book = Book.new(book_params)
    if params[:book][:image].blank?
      @book.image = nil
    end

    if @book.save
      flash[:notice] = 'Book Added'
      redirect_to admin_books_path
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])

    if params[:book][:image].blank?
      @book.image = nil
    end

    if @book.update(book_params)
      flash[:notice] = 'Book Updated'
      redirect_to admin_books_path 
    else
      render 'new'
    end
  end

  def edit
    authorize @book = Book.find(params[:id])
  end

  def destroy
    authorize @book = Book.find(params[:id])

    @book.destroy

    flash[:notice] = 'Book Removed'

    redirect_to admin_books_path
  end

  def index
    @books = Book.all.paginate(:per_page => 10, :page => params[:page])
    @categories = Category.all
  end

  private
    def book_params
      params.require(:book).permit(:title, :category_id, :author_id, :publisher_id, :isbn, :price, :buy, :format, :excerpt, :pages, :year, :coverpath, :image)
    end
end
