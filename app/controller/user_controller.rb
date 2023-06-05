# frozen_string_literal: true

require './app/service/users/create'
require './app/service/users/find_by_email'

class UserController
  def self.create(params)
    Users::UserCreate.new(params: params).call
  end

  def self.find(params)
    Users::UserFindByEmail.new(id: params).call
  end
end
