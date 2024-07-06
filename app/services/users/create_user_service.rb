# frozen_string_literal: true

module Users
  class CreateUserService
    class << self
      def call(user_params)
        user = User.new(user_params)

        if user.valid?
          user.save
          WelcomeMailer.with(user:).welcome.deliver_later
        end

        user
      rescue Error => e
        Rails.logger.error(e)
      end
    end
  end
end
