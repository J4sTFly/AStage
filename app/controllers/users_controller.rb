class UsersController < ApplicationController
  before_action :auth_request, only: :edit

  def create
    user = Users::CreateUserService.call(user_params)

    if user.valid?
      render json: UserSerializer.new(user).call
    else
      render json: user.errors.full_messages
    end
  end

  def edit
    render json: UserSerializer.new(@user).call
  end

  def login
    user = User.find_by(email: user_params[:email])

    result = Users::AuthenticateService.new(user, user_params[:password]).call

    if result[:success]
      render json: result[:token]
    else
      render json: result[:errors]
    end
  end

  private

  def user_params
    params.fetch(:user, {}).permit(:email, :username, :password)
  end
end
