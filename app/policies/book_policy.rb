class BookPolicy 
  attr_reader :user, :book

  def initialize user, book
  	@user = user
  	@book = book
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
