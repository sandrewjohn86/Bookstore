class PublisherPolicy 
  attr_reader :user, :publisher

  def initialize user, publisher
  	@user = user
  	@publisher = publisher
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

