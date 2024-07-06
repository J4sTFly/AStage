# frozen_string_literal: true

class UserSerializer
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def call
    { id: user.id,
      username: user.username,
      email: user.email,
      password: user.password,
      errors: user.errors.full_messages
    }
  end
end
