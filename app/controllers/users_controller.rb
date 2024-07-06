class UsersController < ApplicationController
  def index; end

  def create
    user = Users::CreateUserService.call(user_params)

    render json: UserSerializer.new(user).call
  end

  private

  def user_params
    params.fetch(:user, {}).permit(:email, :username, :password)
  end
end
