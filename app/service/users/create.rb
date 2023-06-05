# frozen_string_literal: true

require 'bcrypt'
require './app/model/user'
require './app/repositories/user_repository'

module Users
  class UserCreate
    def initialize(params:, user: User, repository: UserRepository)
      @params = params
      @user = user
      @repository = repository
    end

    def call
      encode_password =  BCrypt::Password.create(@params["password"])
      user = @user.new(username: @params["username"], email: @params["email"], password: encode_password)
      @repository.create!(user.to_hash)
    end
  end
end
