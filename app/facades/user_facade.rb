class UserFacade

  def initialize(params = nil)
    @parameters = params
  end

  def create_user
    User.new(
      username: @parameters[:username],
      email: @parameters[:email],
      password: @parameters[:password]
    )
  end

  def self.password_match?(params)
    params[:password] == params[:confirm_password]
  end

end