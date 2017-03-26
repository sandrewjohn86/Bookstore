class UserPolicy 
  attr_reader :user, :current_user

  def initialize current_user, user
  	@user = user
  	@current_user = current_user
  end

  def edit?
  	current_user.email =~ /admin/
  end

  def new?
  	current_user.email =~ /admin/
  end

  def destroy?
  	current_user.email =~ /admin/
  end
end
