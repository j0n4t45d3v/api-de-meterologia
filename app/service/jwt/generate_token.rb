# frozen_string_literal: true

require 'jwt'
require 'dotenv/load'

class GenarateToken
  def initialize
    @secret = ENV["SECRET"]
  end

  def call(email)

    payload = {
      email: email
    }

    token = JWT.encode(payload, @secret, 'HS256')

    token
  end
end
