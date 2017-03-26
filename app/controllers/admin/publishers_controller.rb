class Admin::PublishersController < Admin::ApplicationController
  before_filter :verify_logged_in

  def new
    @page_title = "Add New Publisher"
    authorize @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      flash[:notice] = "Publisher Created"
      redirect_to admin_publishers_path
    else
      render 'new'
    end
  end

  def update
    @publisher = Publisher.find(params[:id])

    @publisher.update(publisher_params)

    flash[:notice] = 'Publisher Updated'

    redirect_to admin_publishers_path 
  end

  def edit
    authorize @publisher = Publisher.find(params[:id])
  end

  def destroy
    authorize @publisher = Publisher.find(params[:id])

    @publisher.destroy

    flash[:notice] = 'Publisher Removed'

    redirect_to admin_publishers_path
  end

  def index
    @publishers = Publisher.all.paginate(:per_page => 10, :page => params[:page])
  end

  private
    def publisher_params
      params.require(:publisher).permit(:name)
    end
end
