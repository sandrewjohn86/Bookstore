class Admin::UsersController < Admin::ApplicationController
  before_filter :verify_logged_in
  
  def new
    @page_title = "Add New User"
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User Created"
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    @user.update(user_params)

    flash[:notice] = 'User Updated'

    redirect_to admin_users_path 
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy

    flash[:notice] = 'User Removed'

    redirect_to admin_users_path
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    #@books = @user.books
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
