class RenameColumn2ToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :division, :division
  end
end
