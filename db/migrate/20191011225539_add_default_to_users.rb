class AddDefaultToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :type, default: 0
    change_column_default :users, :type, null: false
  end
end
