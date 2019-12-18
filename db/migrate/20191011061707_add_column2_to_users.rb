# frozen_string_literal: true

class AddColumn2ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :type, :integer
  end
end
