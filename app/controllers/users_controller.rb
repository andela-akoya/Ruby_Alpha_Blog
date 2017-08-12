class UsersController < ApplicationController

  def new; end

  def create
    parameters = set_params
    respond_to do |format|
      unless UserFacade.password_match? parameters then
        format.json { render json: {
          :password => 'Confirm password does not match'
        }, status: :bad_request}
      end
      user =  UserFacade.new(parameters).create_user
      if user.save
        format.html {redirect_to articles_path}
      else
        format.json { render json: user.errors.messages, status: :bad_request}
      end
    end
  end

  private

  def set_params
   params.require(:user).permit(:username, :email, :password, :confirm_password)
  end

end
