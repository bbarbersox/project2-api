#
class AuthController < ApplicationController
  skip_before_action :authenticate, only: [:login, :register] # skip login & register before login & register.  login and actions are the only actions not authenticated

  # POST /login
  def login
    @user = User.authenticate credentials[:email], credentials[:password]
    if @user # serializer makes it easier to return json, in this case the token
      render json: @user, serializer: LoginUserSerializer, root: 'user'
    else
      head :unauthorized # if authentication case this is executed
    end
  end

  # POST /register
  def register
    @user = User.create(credentials)

    if @user.valid? # .valid is provided active record
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /logout/1 - makes the token on front end is no longer usable
  def logout
    if current_user == User.find(params[:id])
      current_user.logout
      head :no_content # the request has an empty response body
    else
      head :unauthorized # you are not allowed to do this
    end
  end

  def credentials
    params.require(:credentials).permit(:email,
                                        :password,
                                        :password_confirmation)
  end

  private :credentials
end
