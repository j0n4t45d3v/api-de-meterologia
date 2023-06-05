# frozen_string_literal: true

require 'jwt'
require 'dotenv/load'

class GenarateToken
  def initialize
    @secret = ENV.fetch('SECRET', nil)
  end

  def call(email)
    payload = {
      email: email
    }

    JWT.encode(payload, @secret, 'HS256')
  end
end
