class Admin::AuthorsController < Admin::ApplicationController
  before_filter :verify_logged_in
  
  def new
    @page_title = "Add New Author"
    authorize @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "Author Created"
      redirect_to admin_authors_path
    else
      render 'new'
    end
  end

  def update
    @author = Author.find(params[:id])

    @author.update(author_params)

    flash[:notice] = 'Author Updated'

    redirect_to admin_authors_path 
  end

  def edit
    authorize @author = Author.find(params[:id])
  end

  def destroy
    authorize @author = Author.find(params[:id])

    @author.destroy

    flash[:notice] = 'Author Removed'

    redirect_to admin_authors_path
  end

  def index
    @authors = Author.all.paginate(:per_page => 10, :page => params[:page])
  end

  private
    def author_params
      params.require(:author).permit(:first_name, :last_name)
    end
end
