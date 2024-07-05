class UsersController < ApplicationController
  def index; end

  def create
    user = User.new(user_params)

    if user.save
      render :show, locals: { user: }
    else
      render locals: { user: }
    end
  end

  private

  def user_params
    params.fetch(:user, {}).permit(:email, :username, :password)
  end
end
