class AuthorPolicy 
  attr_reader :user, :author

  def initialize user, author
  	@user = user
  	@author = author
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
