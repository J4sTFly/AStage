# frozen_string_literal: true

module ControllersHelper
  include JsonWebToken

  def login_user(user)
    token = jwt_encode(user_id: user.id)
    request.headers['Authorization'] = "Bearer #{token}"

    token
  end
end
