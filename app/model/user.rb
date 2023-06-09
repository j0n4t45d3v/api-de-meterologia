# frozen_string_literal: true

# model de user
class User
  def initialize(username:, email:, password:)
    @username = username
    @email = email
    @password = password
  end

  def to_hash
    {
      username: @username,
      email: @email,
      password: @password
    }
  end
end
