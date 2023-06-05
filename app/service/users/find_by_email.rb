# frozen_string_literal: true

module Users
  class UserFindByEmail
    def initialize(id:, repository: UserRepository)
      @id = id
      @repository = repository
    end

    def call
      @repository.find_by(email: @id)
    end
  end
end
