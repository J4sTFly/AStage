class ApplicationController < ActionController::Base
  include JsonWebToken

  private

  def auth_request
    header = request.headers['Authorization']
    if header
      header = header.split.last
      decoded = jwt_decode(header)
      user(decoded[:user_id])
    else
      render_unauthorized
    end
  end

  def user(user_id)
    @user = User.find user_id
  end

  def render_unauthorized
    render json: I18n.t('errors.unauthorized'), status: :unauthorized
  end
end
