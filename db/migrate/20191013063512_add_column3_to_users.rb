class AddColumn3ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :string, default: ""
    add_column :users, :genre,   :string, default: ""
    add_column :users, :people,  :integer, default: 1
  end
end
