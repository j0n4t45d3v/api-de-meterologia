# frozen_string_literal: true

class Users < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
    end
  end
end
