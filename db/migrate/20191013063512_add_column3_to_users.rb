# frozen_string_literal: true

class AddColumn3ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :string, default: ''
    add_column :users, :division,   :string, default: ''
    add_column :users, :people,  :integer, default: 1
  end
end
