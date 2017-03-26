class Admin::ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'admin/application'

  helper_method :current_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end

  	def verify_logged_in
  		unless current_user
  			redirect_to admin_login_path
  		end
  	end

  protected
    def user_not_authorized
      redirect_to admin_books_path, alert: "You are not authorized to do that!"
    end
end