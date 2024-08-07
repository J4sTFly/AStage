module Users
  class AuthenticateService
    include JsonWebToken

    attr_reader :user, :password

    def initialize(user, password)
      @user = user
      @password = password
    end

    def call
      if user&.authenticate(password)
        { token: jwt_encode(user_id: user.id), success: true }
      else
        { errors: I18n.t('errors.bad_credentials'), success: false }
      end
    end
  end
end
