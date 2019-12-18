# frozen_string_literal: true

class RenameColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :type, :role
  end
end
