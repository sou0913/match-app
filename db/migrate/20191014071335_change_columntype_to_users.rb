# frozen_string_literal: true

class ChangeColumntypeToUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :address
    remove_column :users, :division
    remove_column :users, :people
  end

  def down
    add_column :users, :address, :integer, default: 0
    add_column :users, :division, :integer, default: 0
    add_column :users, :people, default: 0
  end
end
