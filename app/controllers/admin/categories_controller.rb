class Admin::CategoriesController < Admin::ApplicationController
  before_filter :verify_logged_in
  
  def new
    @page_title = "Add New Category"
    authorize @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category Created"
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])

    @category.update(category_params)

    flash[:notice] = 'Category Updated'

    redirect_to admin_categories_path 
  end

  def edit
    authorize @category = Category.find(params[:id])
  end

  def destroy
    authorize @category = Category.find(params[:id])

    @category.destroy

    flash[:notice] = 'Category Removed'

    redirect_to admin_categories_path
  end

  def index
    @categories = Category.all.paginate(:per_page => 10, :page => params[:page])
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @books = @category.books
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
