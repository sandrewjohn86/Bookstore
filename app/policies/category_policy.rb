class CategoryPolicy 
  attr_reader :user, :category

  def initialize user, category
  	@user = user
  	@category = category
  end

  def edit?
  	user.email =~ /admin/
  end

  def new?
  	user.email =~ /admin/
  end

  def destroy?
  	user.email =~ /admin/
  end
end

