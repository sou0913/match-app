# frozen_string_literal: true

class AddColumntypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :integer, default: 0
    add_column :users, :division, :integer, default: 0
    add_column :users, :people, :integer, default: 0
  end
end
